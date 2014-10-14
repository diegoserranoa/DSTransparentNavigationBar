//
//  DSNavigationBar.m
//  DSTranparentNavigationBar
//
//  Created by Diego Serrano on 10/13/14.
//  Copyright (c) 2014 Diego Serrano. All rights reserved.
//

#import "DSNavigationBar.h"
#import <QuartzCore/QuartzCore.h>
//#import "UIImage+initWithColor.h"

@implementation DSNavigationBar

- (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imageWithGradients:(NSArray *)colours
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
    UIColor * beginColor = [colours objectAtIndex:0];
    UIColor * endColor = [colours objectAtIndex:1];
    
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

-(void)setNavigationBarWithColor:(UIColor *)color
{
    UIImage *image = [self imageWithColor:color];
    
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self setBarStyle:UIBarStyleDefault];
    [self setShadowImage:[UIImage new]];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self setTintColor:[UIColor whiteColor]];
    [self setTranslucent:YES];

}

-(void)setNavigationBarWithColors:(NSArray *)colours
{
    UIImage *image = [self imageWithGradients:colours];
    
    [self setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self setBarStyle:UIBarStyleDefault];
    [self setShadowImage:[UIImage new]];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    [self setTintColor:[UIColor whiteColor]];
    [self setTranslucent:YES];
    
}


@end
