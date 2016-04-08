//
//  UIImage+Ex.m
//  SunMoFruit
//
//  Created by 猎人 on 16/1/6.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "UIImage+Ex.h"

@implementation UIImage (Ex)
+ (instancetype)originalImage:(NSString *)name{
    UIImage *image = [self imageNamed:name];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
