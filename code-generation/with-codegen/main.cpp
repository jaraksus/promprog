#include <iostream>
#include <chrono>

#include <opencv2/opencv.hpp>

#include "x.hpp"

using namespace cv;
using namespace std;

void Show(Mat im, string name) {
    namedWindow(name, WINDOW_NORMAL);
    resizeWindow(name, 400, 400);
    imshow(name, im);
}

int main() {
	std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();

	int h = arr[0].size();
	int w = arr[0][0].size();
	Mat image(h, w, CV_8UC3);
	Vec3b intensity = image.at<Vec3b>(0, 0);
	uchar blue = intensity[0];
	uchar green = intensity[0];
	uchar red = intensity[0];

	for (int i = 0; i < image.rows; ++i) {
		for (int j = 0; j < image.cols; ++j) {
			Vec3b intensity = image.at<Vec3b>(i, j);
			for (int ch = 0; ch < 3; ++ch) {
				intensity[ch] = arr[2 - ch][i][j];
			}
			image.at<Vec3b>(i, j) = intensity;
		}
	}

	Show(image, "after");

	std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
	std::cout << "Time difference = " << std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count() << "[µs]" << std::endl;

	waitKey(0);
	return 0;
}