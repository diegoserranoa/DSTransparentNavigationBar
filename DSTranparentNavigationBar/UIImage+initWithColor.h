//
//  UIImage+initWithColor.h
//  suyana
//
//  Created by Brounie on 10/13/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIImage (initWithColor)

//programmatically create an UIImage with 1 pixel of a given color
+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithGradients:(NSArray *)colours;

@end
