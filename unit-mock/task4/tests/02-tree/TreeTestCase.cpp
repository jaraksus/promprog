//
// Created by akhtyamovpavel on 5/1/20.
//


#include "TreeTestCase.h"
#include "Tree.h"

#include <boost/filesystem.hpp>
#include <fstream>

const std::string DIR_PREFIX = "tmp";
const std::string SUBDIR = "subdir";
const std::string COMMON_FILE = "text.txt";
const std::string EMPTY_SUBDIR = "empty_subdir";

std::string GetDirName() {
    std::string test_name = ::testing::UnitTest::GetInstance()->current_test_info()->name();
    std::string dirname = DIR_PREFIX + "_" + test_name;
    return dirname;
}

void TreeTestCase::SetUp() {
    std::string dirname = GetDirName();

    boost::filesystem::create_directory(boost::filesystem::path("./" + dirname));
    boost::filesystem::create_directory(boost::filesystem::path("./" + dirname + "/" + SUBDIR));
    boost::filesystem::create_directory(boost::filesystem::path("./" + dirname + "/" + EMPTY_SUBDIR));

    std::ofstream outfile("./" + dirname + "/" + SUBDIR + "/" + COMMON_FILE);
    outfile << "some text";
    outfile.close();
}

void TreeTestCase::TearDown() {
    boost::filesystem::remove_all(boost::filesystem::path("./" + GetDirName()));
}

void checkBaseStructure(FileNode res, bool dirs_only) {
    ASSERT_EQ(GetDirName(), res.name);
    ASSERT_EQ(true, res.is_dir);
    ASSERT_EQ(2, res.children.size());

    bool found_subdir = false;
    bool found_empty_subdir = false;
    for (auto& node : res.children) {
        if (node.name == SUBDIR) {
            found_subdir = true;

            ASSERT_EQ(true, node.is_dir);
            ASSERT_EQ(1 - dirs_only, node.children.size());
        } else if (node.name == EMPTY_SUBDIR) {
            found_empty_subdir = true;
        }
    }

    ASSERT_EQ(true, found_subdir);
    ASSERT_EQ(true, found_empty_subdir);
}

TEST_F(TreeTestCase, GetTree_InvalidArgumentPathNotExist) {
    try {
        GetTree("./tmp_2", false);
    }
    catch (std::invalid_argument const & err) {
        ASSERT_EQ(err.what(), std::string("Path not exist"));
    }
    catch (...) {
        FAIL() << "Expected std::invalid_argument";
    }
}

TEST_F(TreeTestCase, GetTree_InvalidArgumentPathNotDir) {
    try {
        GetTree("./" + GetDirName() + "/" + SUBDIR + "/" + COMMON_FILE, false);
    }
    catch (std::invalid_argument const & err) {
        ASSERT_EQ(err.what(), std::string("Path is not directory"));
    }
    catch (...) {
        FAIL() << "Expected std::invalid_argument";
    }
}

TEST_F(TreeTestCase, GetTree_WithCommonFiles) {
    FileNode res = GetTree("./" + GetDirName(), false);
    checkBaseStructure(res, false);
}

TEST_F(TreeTestCase, GetTree_WithoutCommonFiles) {
    FileNode res = GetTree("./" + GetDirName(), true);
    checkBaseStructure(res, true);
}

TEST_F(TreeTestCase, FilterEmptyNodes) {
    FileNode res = GetTree("./" + GetDirName(), false);
    FilterEmptyNodes(res, "./" + GetDirName());

    std::string dirname = GetDirName();
    ASSERT_EQ(true, boost::filesystem::exists("./" + dirname));
    ASSERT_EQ(true, boost::filesystem::exists("./" + dirname + "/" + SUBDIR));
    ASSERT_EQ(false, boost::filesystem::exists("./" + dirname + "/" + EMPTY_SUBDIR));
    ASSERT_EQ(true, boost::filesystem::exists("./" + dirname + "/" + SUBDIR + "/" + COMMON_FILE));
}

TEST(FileNodeTest, EqualFileNodes) {
    FileNode first;
    first.name = "node";
    first.is_dir = false;

    FileNode second;
    second.name = "node";
    second.is_dir = false;

    ASSERT_EQ(true, first == second);
}

TEST(FileNodeTest, NotEqualFileNodes) {
    FileNode first;
    first.name = "first";
    first.is_dir = false;

    FileNode second;
    second.name = "second";
    second.is_dir = false;

    ASSERT_EQ(false, first == second);
}