//
//  XMLBaseLayout.m
//  XMLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XMLBaseLayout.h"

#import <UIKit/NSLayoutConstraint.h>

@interface XMLBaseLayout ()

@property (nonatomic, readwrite, weak) UIView *relationshipView;

@property (nonatomic, weak) NSLayoutConstraint *layout_topConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_bottomConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_leftConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_rightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_widthConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_heightConstraint;

@end

@implementation XMLBaseLayout

#pragma mark- Init

- (instancetype)initWithRelationshipView:(UIView *)relationshipView {
    self = [super init];
    if (self) {
        self.relationshipView = relationshipView;
    }
    return self;
}

#pragma mark - Private

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
                                      attribute:(NSLayoutAttribute)attribute2
                                       constant:(CGFloat)constant {
    
    return [NSLayoutConstraint constraintWithItem:self.relationshipView
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                        attribute:attribute2
                                       multiplier:1
                                         constant:constant];
}

#pragma mark - Public

- (void)activateConstraint:(NSLayoutConstraint *)constraint {
    
    NSAssert(constraint, @"The constraint cannot be empty");
    
    [self.relationshipView.superview addConstraint:constraint];
}

- (void)deactivateConstraint:(NSLayoutConstraint *)constraint {
    
    if (constraint)
        return;
    [self.relationshipView.superview removeConstraint:constraint];
}

#pragma mark - Public Getter / Setter

- (void)setLayout_marginTop:(CGFloat)layout_marginTop {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_topConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeTop
                                                              constant:layout_marginTop];
        [self activateConstraint:constraint];
        [self setLayout_topConstraint:constraint];
    }else {
        
        self.layout_topConstraint.constant = layout_marginTop;
    }
    
    _layout_marginTop = layout_marginTop;
}

- (void)setLayout_marginBottom:(CGFloat)layout_marginBottom {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_bottomConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeBottom
                                                              constant:-layout_marginBottom];
        [self activateConstraint:constraint];
        [self setLayout_bottomConstraint:constraint];
    }else {
        
        self.layout_bottomConstraint.constant = -layout_marginBottom;
    }
    
    _layout_marginBottom = -layout_marginBottom;
}

- (void)setLayout_marginLeft:(CGFloat)layout_marginLeft{
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_leftConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeLeading
                                                              constant:layout_marginLeft];
        [self activateConstraint:constraint];
        [self setLayout_leftConstraint:constraint];
    }else {
        
        self.layout_leftConstraint.constant = layout_marginLeft;
    }
    
    _layout_marginLeft = layout_marginLeft;
}

- (void)setLayout_marginRight:(CGFloat)layout_marginRight {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_rightConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeTrailing
                                                              constant:-layout_marginRight];
        [self activateConstraint:constraint];
        [self setLayout_rightConstraint:constraint];
    }else {
        
        self.layout_rightConstraint.constant = -layout_marginRight;
    }
    
    _layout_marginRight = -layout_marginRight;
}

- (void)setLayout_width:(CGFloat)layout_width {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_widthConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeWidth
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                              constant:layout_width];
        [self activateConstraint:constraint];
        [self setLayout_widthConstraint:constraint];
    }else {
        
        self.layout_widthConstraint.constant = layout_width;
    }
    
    _layout_width = layout_width;
}

- (void)setLayout_height:(CGFloat)layout_height {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_heightConstraint) {
        
        NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeHeight
                                                             attribute:NSLayoutAttributeNotAnAttribute
                                                              constant:layout_height];
        [self activateConstraint:constraint];
        [self setLayout_heightConstraint:constraint];
    }else {
        
        self.layout_heightConstraint.constant = layout_height;
    }
    
    _layout_height = layout_height;
}

@end
