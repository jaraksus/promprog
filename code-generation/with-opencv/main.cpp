#include <stdio.h>
#include <iostream>
#include <chrono>

#include <opencv2/opencv.hpp>

using namespace cv;
using namespace std;

void Show(Mat im, string name) {
    namedWindow(name, WINDOW_NORMAL);
    resizeWindow(name, 400, 400);
    imshow(name, im);
}

int main(int argc, char** argv )
{
    std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();

    if ( argc != 3 )
    {
        printf("usage: main <image_path> <map_file path>\n");
        return -1;
    }

    Mat image;
    image = imread(argv[1], 1);
    if (!image.data)
    {
        printf("No image data \n");
        return -1;
    }

    Mat mapper;
    mapper = imread(argv[2], 1);
    if (!mapper.data)
    {
        printf("No mapper data \n");
        return -1;
    }

    Show(image, "before");

    // transformation
    for (int i = 0; i < image.rows; ++i) {
        for (int j = 0; j < image.cols; ++j) {
            Vec3b intensity = image.at<Vec3b>(i, j);

            intensity.val[2] = mapper.at<Vec3b>(0, (int)intensity.val[2])[2]; // RED
            intensity.val[1] = mapper.at<Vec3b>(1, (int)intensity.val[1])[1]; // GREEN
            intensity.val[0] = mapper.at<Vec3b>(2, (int)intensity.val[0])[0]; // BLUE

            image.at<Vec3b>(i, j) = intensity;
        }
    }

    Show(image, "after");
    
    std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
    std::cout << "Time difference = " << std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count() << "[µs]" << std::endl;

    waitKey(0);
    return 0;
}