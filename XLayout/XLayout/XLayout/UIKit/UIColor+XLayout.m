//
//  UIColor+XLayout.m
//  XLayout
//
//  Created by bateng on 16/4/28.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIColor+XLayout.h"

#import "HexColors.h"

@implementation UIColor (XLayout)

+ (UIColor *)colorWithString:(NSString *)string {
    return [UIColor hx_colorWithHexRGBAString:string];
}

@end
