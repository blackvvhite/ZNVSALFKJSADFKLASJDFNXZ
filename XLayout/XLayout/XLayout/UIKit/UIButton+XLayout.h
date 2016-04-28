//
//  UIButton+XLayout.h
//  XLayout
//
//  Created by bateng on 16/4/28.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XLayout)

@property (nonatomic, weak, readonly) NSString *normalTitle;
@property (nonatomic, weak, readonly) NSString *highlightedTitle;
@property (nonatomic, weak, readonly) NSString *selectedTitle;

@property (nonatomic, weak, readonly) UIColor *normalTitleColor;
@property (nonatomic, weak, readonly) UIColor *highlightedTitleColor;
@property (nonatomic, weak, readonly) UIColor *selectedTitleColor;

@property (nonatomic, weak, readonly) UIImage *normalImage;
@property (nonatomic, weak, readonly) UIImage *highlightedImage;
@property (nonatomic, weak, readonly) UIImage *selectedImage;

@property (nonatomic, weak, readonly) UIImage *normalBackgroundImage;
@property (nonatomic, weak, readonly) UIImage *highlightedBackgroundImage;
@property (nonatomic, weak, readonly) UIImage *selectedBackgroundImage;

@property (nonatomic, copy, readonly) NSString *onClick;

@end
