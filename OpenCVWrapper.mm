//
//  OpenCVWrapper.m (change to .mm to use c++ function)
//  TestOpenCV
//
//  Implement functions defined in the .h file.

#import <opencv2/opencv.hpp>
#import <opencv2/highgui/highgui.hpp>
#import <opencv2/imgproc/imgproc.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "OpenCVWrapper.h"

@implementation OpenCVWrapper

+(NSString *) OpenCVVersionString
{
    return [NSString stringWithFormat:@"OpenCV Version %s", CV_VERSION];
}

+(UIImage *) MakeGrayof: (UIImage *) image
{
    // Transform UIImage to cv::Mat.
    cv::Mat imageMat;
    UIImageToMat(image, imageMat);
    
    // If image is already grayscale.
    if(imageMat.channels() == 1)
    {
        return image;
    }
    
    // Transform the color to gray.
    cv::Mat grayMat;
    cvtColor(imageMat, grayMat, cv::COLOR_BGR2GRAY);
    
    return MatToUIImage(grayMat);
}

+(UIImage *) DetectCircleof: (UIImage *) image
{
    cv::Mat srcMat, src_grayMat;
    UIImageToMat(image, srcMat);
    
    /// Convert it to gray
    cvtColor( srcMat, src_grayMat, cv::COLOR_BGR2GRAY );
    
    /// Reduce the noise so we avoid false circle detection
    GaussianBlur( src_grayMat, src_grayMat, cv::Size(9,9), 2, 2 );
    
    std::vector<cv::Vec3f> circles;
    
    /// Apply the Hough Transform to find the circles
    HoughCircles( src_grayMat, circles, cv::HOUGH_GRADIENT, 1, src_grayMat.rows/8, 200, 100, 0, 0 );
    
    std::cout << "circle number:" << static_cast<int>(circles.size()) << std::endl;
    if(static_cast<int>(circles.size()) == 0)
    {
        return image;
    }
    
    /// Draw the circles detected
    for( size_t i = 0; i < circles.size(); i++ )
    {
        cv::Point center(cvRound(circles[i][0]), cvRound(circles[i][1]));
        int radius = cvRound(circles[i][2]);
        std::cout << "radius: " << static_cast<int>(radius) << std::endl;
        
        // circle center
        cv::circle(srcMat, center, 5, cv::Scalar(0,255,0,255), -1, 8, 0);
        // circle outline
        cv::circle(srcMat, center, radius, cv::Scalar(255,0,0,255), 5, 8, 0);
    }
    
    return MatToUIImage(srcMat);
}

@end
