//
//  UIView+Config.m
//  XMLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UIView+Config.h"

#import "HexColors.h"

@implementation UIView (Config)

- (void)setMarginTop:(CGFloat)marginTop {
    NSAssert(self.superview, @"没有父视图");
    
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1
                                                                constant:marginTop]];
}

- (CGFloat)marginTop {
    return 10;
}


- (void)setMarginBottom:(CGFloat)marginBottom {
    NSAssert(self.superview, @"没有父视图");
    
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1
                                                                constant:marginBottom]];
}

- (CGFloat)marginBottom {
    return 10;
}

- (void)setMarginLeft:(CGFloat)marginLeft {
    NSAssert(self.superview, @"没有父视图");
    
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeLeft
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeLeft
                                                              multiplier:1
                                                                constant:marginLeft]];
}

- (CGFloat)marginLeft {
    return 10;
}

- (void)setMarginRight:(CGFloat)marginRight {
    NSAssert(self.superview, @"没有父视图");
    
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeRight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeRight
                                                              multiplier:1
                                                                constant:marginRight]];
}

- (CGFloat)marginRight {
    return 10;
}

- (void)setWidth:(CGFloat)width {
    NSAssert(self.superview, @"没有父视图");
    
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeWidth
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                              multiplier:1
                                                                constant:width]];
}

- (CGFloat)width {
    return 10;
}

- (void)setHeight:(CGFloat)height {
    NSAssert(self.superview, @"没有父视图");
    
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeHeight
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:nil
                                                               attribute:NSLayoutAttributeNotAnAttribute
                                                              multiplier:1
                                                                constant:height]];
}

- (CGFloat)height {
    return 10;
}

- (void)setXml_backgroundColor:(NSString *)xml_backgroundColor {
    NSLog(@"=============%@",NSStringFromClass(self.class));
    self.backgroundColor = [UIColor hx_colorWithHexRGBAString:xml_backgroundColor];
    
}

- (NSString *)xml_backgroundColor {
    return @"sdaf";
}

@end
