//
//  OpenCVWrapper.m (change to .mm to use c++ function)
//  TestOpenCV
//
//  Implement functions defined in the .h file.

#import <opencv2/opencv.hpp>
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
    cv::cvtColor(imageMat, grayMat, cv::COLOR_BGR2GRAY);
    
    return MatToUIImage(grayMat);
}

@end
