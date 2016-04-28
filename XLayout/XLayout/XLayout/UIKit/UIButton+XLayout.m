//
//  UIButton+XLayout.m
//  XLayout
//
//  Created by bateng on 16/4/28.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIButton+XLayout.h"

#import <objc/runtime.h>

#import "UIView+XLayout.h"
#import "UIColor+XLayout.h"
#import "XLayoutViewService.h"

@implementation UIButton (XLayout)

+ (instancetype)xLayoutInit {
    return [UIButton buttonWithType:UIButtonTypeCustom];
}

#pragma mark - Title

- (void)setNormalTitle:(NSString *)normalTitle {
    [self setTitle:normalTitle forState:UIControlStateNormal];
}

- (NSString *)normalTitle {
    return [self titleForState:UIControlStateNormal];
}

- (void)setHighlightedTitle:(NSString *)highlightedTitle {
    [self setTitle:highlightedTitle forState:UIControlStateHighlighted];
}

- (NSString *)highlightedTitle {
    return [self titleForState:UIControlStateHighlighted];
}

- (void)setSelectedTitle:(NSString *)selectedTitle{
    [self setTitle:selectedTitle forState:UIControlStateSelected];
}

- (NSString *)selectedTitle {
    return [self titleForState:UIControlStateSelected];
}

#pragma mark - Color

- (void)setNormalTitleColor:(UIColor *)normalTitleColor {
    [self setTitleColor:normalTitleColor forState:UIControlStateNormal];
}

- (UIColor *)normalTitleColor {
    return [self titleColorForState:UIControlStateNormal];
}

- (void)setHighlightedTitleColor:(UIColor *)highlightedTitleColor {
    [self setTitleColor:highlightedTitleColor forState:UIControlStateHighlighted];
}

- (UIColor *)highlightedTitleColor {
    return [self titleColorForState:UIControlStateHighlighted];
}

- (void)setSelectedTitleColor:(UIColor *)selectedTitleColor {
    [self setTitleColor:selectedTitleColor forState:UIControlStateSelected];
}

- (UIColor *)selectedTitleColor {
    return [self titleColorForState:UIControlStateSelected];
}

#pragma mark - Image

- (void)setNormalImage:(UIImage *)normalImage {
    [self setImage:normalImage forState:UIControlStateNormal];
}

- (UIImage *)normalImage {
    return [self imageForState:UIControlStateNormal];
}

- (void)setHighlightedImage:(UIImage *)highlightedImage {
    [self setImage:highlightedImage forState:UIControlStateHighlighted];
}

- (UIImage *)highlightedImage {
    return [self imageForState:UIControlStateHighlighted];
}

- (void)setSelectedImage:(UIImage *)selectedImage {
    [self setImage:selectedImage forState:UIControlStateSelected];
}

- (UIImage *)selectedImage {
    return [self imageForState:UIControlStateSelected];
}

#pragma mark - Background Image

- (void)setNormalBackgroundImage:(UIImage *)normalBackgroundImage {
    [self setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
}

- (UIImage *)normalBackgroundImage {
    return [self backgroundImageForState:UIControlStateNormal];
}

- (void)setHighlightedBackgroundImage:(UIImage *)highlightedBackgroundImage {
    [self setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
}

- (UIImage *)highlightedBackgroundImage {
    return [self backgroundImageForState:UIControlStateHighlighted];
}

- (void)setSelectedBackgroundImage:(UIImage *)selectedBackgroundImage {
    [self setBackgroundImage:selectedBackgroundImage forState:UIControlStateSelected];
}

- (UIImage *)selectedBackgroundImage {
    return [self backgroundImageForState:UIControlStateSelected];
}

#pragma mark - Event

- (void)setOnClick:(NSString *)onClick{
    
    NSAssert(self.viewService.eventHandler, @"You set up an onclick method But the event handler is nil");
    
    [self addTarget:self.viewService.eventHandler action:NSSelectorFromString(onClick) forControlEvents:UIControlEventTouchUpInside];
    
    objc_setAssociatedObject(self, @selector(onClick), onClick, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)onClick {
    
    return objc_getAssociatedObject(self, _cmd);
}

@end
