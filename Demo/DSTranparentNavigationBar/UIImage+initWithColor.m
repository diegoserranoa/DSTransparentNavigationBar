//
//  UIImage+initWithColor.m
//  suyana
//
//  Created by Brounie on 10/13/14.
//  Copyright (c) 2014 Brounie. All rights reserved.
//
#import "UIImage+initWithColor.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIImage (initWithColor)

+(UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithGradients:(NSArray *)colours
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    
    CGFloat lineWidth = 0.1f;
    
    // create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    
    
    //    set RGB color space
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //    set draw context
    CGContextRef context = UIGraphicsGetCurrentContext();
    //    set two color for gradient
    //    if you need more color gradient
    //    just add it
    UIColor * beginColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f];
    UIColor * endColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.95f];
    
    //    set color to array
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)beginColor.CGColor, (id)endColor.CGColor, nil];
    CGFloat gradientLocation[] = {0, 1};
    //    set gradient info
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocation);
    
    //    set rectangle path for bezier path
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    CGContextSaveGState(context);
    [bezierPath addClip];
    
    //    set gradient start point and end point
    CGPoint beginPoint = CGPointMake(rect.size.width/2, 0);
    CGPoint endPoint = CGPointMake(rect.size.width/2, rect.size.height/2);
    
    //    add position to linear gradient
    CGContextDrawLinearGradient(context, gradient, beginPoint, endPoint, 0);
    //    set sideline info
    CGContextSetStrokeColorWithColor(context, [[UIColor clearColor] CGColor]);
    //    draw sideline
    [bezierPath setLineWidth:lineWidth];
    //    fill gradient color
    [bezierPath stroke];
    
    CGContextRestoreGState(context);
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

