//
//  XMLayout.m
//  XMLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XMLayout.h"

#import <UIKit/NSLayoutConstraint.h>

@interface XMLayout ()

@property (nonatomic, readwrite, weak) UIView *relationshipView;

@property (nonatomic, weak) NSLayoutConstraint *topConstraint;
@property (nonatomic, weak) NSLayoutConstraint *bottomConstraint;
@property (nonatomic, weak) NSLayoutConstraint *leftConstraint;
@property (nonatomic, weak) NSLayoutConstraint *rightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *widthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *heightConstraint;

@end

@implementation XMLayout

#pragma mark- Init

- (instancetype)initWithRelationshipView:(UIView *)relationshipView {
    self = [super init];
    if (self) {
        self.relationshipView = relationshipView;
    }
    return self;
}

#pragma mark - Public

- (NSLayoutConstraint *)constraintWithAttribute:(NSLayoutAttribute)attribute
                                       constant:(CGFloat)constant {
    
    return [NSLayoutConstraint constraintWithItem:self.relationshipView
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:self.relationshipView.superview
                                        attribute:attribute
                                       multiplier:1
                                         constant:constant];
}

- (NSLayoutConstraint *)constraintWithAttribute:(NSLayoutAttribute)attribute
                                     attribute2:(NSLayoutAttribute)attribute2
                                       constant:(CGFloat)constant {
    
    return [NSLayoutConstraint constraintWithItem:self.relationshipView
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                        attribute:attribute2
                                       multiplier:1
                                         constant:constant];
}


- (void)setMargin_top:(CGFloat)margin_top {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.topConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeTop
                                                              constant:margin_top];
        [self.relationshipView.superview addConstraint:constraint];
        [self setTopConstraint:constraint];
    }else {
        
        self.topConstraint.constant = margin_top;
    }
    
    _margin_top = margin_top;
}

- (void)setMargin_bottom:(CGFloat)margin_bottom {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.bottomConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeBottom
                                                              constant:-margin_bottom];
        [self.relationshipView.superview addConstraint:constraint];
        [self setBottomConstraint:constraint];
    }else {
        
        self.bottomConstraint.constant = -margin_bottom;
    }
    
    _margin_bottom = -margin_bottom;
}

- (void)setMargin_left:(CGFloat)margin_left {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.leftConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeLeading
                                                              constant:margin_left];
        [self.relationshipView.superview addConstraint:constraint];
        [self setLeftConstraint:constraint];
    }else {
        
        self.leftConstraint.constant = margin_left;
    }
    
    _margin_left = margin_left;
}

- (void)setMargin_right:(CGFloat)margin_right {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.rightConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeTrailing
                                                              constant:-margin_right];
        [self.relationshipView.superview addConstraint:constraint];
        [self setRightConstraint:constraint];
    }else {
        
        self.rightConstraint.constant = -margin_right;
    }
    
    _margin_right = -margin_right;
}

- (void)setWidth:(CGFloat)width {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.widthConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeWidth
                                                            attribute2:NSLayoutAttributeNotAnAttribute
                                                              constant:width];
        [self.relationshipView.superview addConstraint:constraint];
        [self setWidthConstraint:constraint];
    }else {
        
        self.widthConstraint.constant = width;
    }
    
    _width = width;
}

- (void)setHeight:(CGFloat)height {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.heightConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeHeight
                                                            attribute2:NSLayoutAttributeNotAnAttribute
                                                              constant:height];
        [self.relationshipView.superview addConstraint:constraint];
        [self setHeightConstraint:constraint];
    }else {
        
        self.heightConstraint.constant = height;
    }
    
    _height = height;
}

@end
