//
//  OpenCVWrapper.h
//  TestOpenCV
//
//  Define functions that will be use in the app.

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface OpenCVWrapper : NSObject

// Get version of OpenCV
+(NSString *) OpenCVVersionString;

// Turn image to gray scale.
+(UIImage *) MakeGrayof: (UIImage *) image;

@end
