//
//  XLayoutBase.m
//  XLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XLayoutBase.h"
#import "XLayoutConstraint.h"

#import <UIKit/UIView.h>

@interface XLayoutBase ()

@property (nonatomic, readwrite, weak) UIView *view;

@property (nonatomic, strong) XLayoutConstraint *layout_topConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_bottomConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_leftConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_rightConstraint;

@property (nonatomic, strong) XLayoutConstraint *layout_widthConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_heightConstraint;

@property (nonatomic, strong) XLayoutConstraint *layout_aboveConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_belowConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_baselineConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_centerXConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_centerYConstraint;

@end

@implementation XLayoutBase

#pragma mark- Init

- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        self.view = view;
    }
    return self;
}

#pragma mark - Getter / Setter

- (void)setDeleteEexistingWhenUpdating:(BOOL)deleteEexistingWhenUpdating {
    _deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    
    self.layout_topConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    self.layout_bottomConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    self.layout_leftConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    self.layout_rightConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    
    self.layout_widthConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    self.layout_heightConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    
    self.layout_aboveConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    self.layout_belowConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    
    self.layout_baselineConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    
    self.layout_centerXConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    self.layout_centerYConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
}

- (void)setLayout_top:(NSString *)layout_top {
    [self assert];
    
    if (!self.layout_topConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_top];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeTop;
        self.layout_topConstraint = constraint;
    }else {
        [self.layout_topConstraint updateConstraintWithLayoutAttributes:layout_top];
    }
    _layout_top = layout_top;
}

- (void)setLayout_bottom:(NSString *)layout_bottom {
    [self assert];
    
    if (!self.layout_bottomConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_bottom];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        self.layout_bottomConstraint = constraint;
    }else {
        [self.layout_bottomConstraint updateConstraintWithLayoutAttributes:layout_bottom];
    }
    _layout_bottom = layout_bottom;
}

- (void)setLayout_left:(NSString *)layout_left {
    [self assert];
    
    if (!self.layout_leftConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_left];
        constraint.firstAttribute = NSLayoutAttributeLeading;
        constraint.secondAttribute = NSLayoutAttributeLeading;
        self.layout_leftConstraint = constraint;
    }else {
        [self.layout_leftConstraint updateConstraintWithLayoutAttributes:layout_left];
    }
    _layout_left = layout_left;
}

- (void)setLayout_right:(NSString *)layout_right {
    [self assert];
    
    if (!self.layout_rightConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_right];
        constraint.firstAttribute = NSLayoutAttributeTrailing;
        constraint.secondAttribute = NSLayoutAttributeTrailing;
        self.layout_rightConstraint = constraint;
    }else {
        [self.layout_rightConstraint updateConstraintWithLayoutAttributes:layout_right];
    }
    _layout_right = layout_right;
}

- (void)setLayout_width:(NSString *)layout_width {
    [self assert];
    
    if (!self.layout_widthConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_width];
        constraint.firstAttribute = NSLayoutAttributeWidth;
        constraint.secondAttribute = NSLayoutAttributeNotAnAttribute;
        self.layout_widthConstraint = constraint;
    }else {
        [self.layout_widthConstraint updateConstraintWithLayoutAttributes:layout_width];
    }
    _layout_width = layout_width;
}

- (void)setLayout_height:(NSString *)layout_height {
    [self assert];
    
    if (!self.layout_heightConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_height];
        constraint.firstAttribute = NSLayoutAttributeHeight;
        constraint.secondAttribute = NSLayoutAttributeNotAnAttribute;
        self.layout_heightConstraint = constraint;
    }else {
        [self.layout_heightConstraint updateConstraintWithLayoutAttributes:layout_height];
    }
    _layout_height = layout_height;
}

- (void)setLayout_above:(NSString *)layout_above {
    NSAssert(layout_above, @"The layout_above attribute cannot be empty");
    [self assert];
    
    if (!self.layout_aboveConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_above];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeTop;
        self.layout_aboveConstraint = constraint;
    }else {
        [self.layout_aboveConstraint updateConstraintWithLayoutAttributes:layout_above];
    }
    _layout_above = layout_above;
}

- (void)setLayout_below:(NSString *)layout_below {
    NSAssert(layout_below, @"The layout_below attribute cannot be empty");
    [self assert];
    
    if (!self.layout_belowConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_below];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        self.layout_belowConstraint = constraint;
    }else {
        [self.layout_belowConstraint updateConstraintWithLayoutAttributes:layout_below];
    }
    _layout_below = layout_below;
}

- (void)setLayout_baseline:(NSString *)layout_baseline {
    NSAssert(layout_baseline, @"The layout_baseline attribute cannot be empty");
    [self assert];
    
    if (!self.layout_baselineConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_baseline];
        constraint.firstAttribute = NSLayoutAttributeBaseline;
        constraint.secondAttribute = NSLayoutAttributeBaseline;
        self.layout_baselineConstraint = constraint;
    }else {
        [self.layout_baselineConstraint updateConstraintWithLayoutAttributes:layout_baseline];
    }
    _layout_baseline = layout_baseline;
}

- (void)setLayout_centerX:(NSString *)layout_centerX {
    [self assert];
    
    if (!self.layout_centerXConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_centerX];
        constraint.firstAttribute = NSLayoutAttributeCenterX;
        constraint.secondAttribute = NSLayoutAttributeCenterX;
        self.layout_centerXConstraint = constraint;
    }else {
        [self.layout_centerXConstraint updateConstraintWithLayoutAttributes:layout_centerX];
    }
    _layout_centerX = layout_centerX;
}

- (void)setLayout_centerY:(NSString *)layout_centerY {
    [self assert];
    
    if (!self.layout_centerYConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_centerY];
        constraint.firstAttribute = NSLayoutAttributeCenterY;
        constraint.secondAttribute = NSLayoutAttributeCenterY;
        self.layout_centerYConstraint = constraint;
    }else {
        [self.layout_centerXConstraint updateConstraintWithLayoutAttributes:layout_centerY];
    }
    _layout_centerY = layout_centerY;
}

- (void)setLayout_center:(NSString *)layout_center {
    [self setLayout_centerX:layout_center];
    [self setLayout_centerY:layout_center];
    _layout_center = layout_center;
}

#pragma mark - Public

- (void)assert {
    NSAssert(self.view.superview, @"There is no parent view");
}

- (void)activate {
    [self.layout_topConstraint activate];
    [self.layout_bottomConstraint activate];
    [self.layout_leftConstraint activate];
    [self.layout_rightConstraint activate];
    
    [self.layout_widthConstraint activate];
    [self.layout_heightConstraint activate];
    
    [self.layout_aboveConstraint activate];
    [self.layout_belowConstraint activate];
    
    [self.layout_baselineConstraint activate];
    
    [self.layout_centerXConstraint activate];
    [self.layout_centerYConstraint activate];
}

- (void)deactivate {
    [self.layout_topConstraint deactivate];
    [self.layout_bottomConstraint deactivate];
    [self.layout_leftConstraint deactivate];
    [self.layout_rightConstraint deactivate];
    
    [self.layout_widthConstraint deactivate];
    [self.layout_heightConstraint deactivate];
    
    [self.layout_aboveConstraint deactivate];
    [self.layout_belowConstraint deactivate];
    
    [self.layout_baselineConstraint deactivate];
    
    [self.layout_centerXConstraint deactivate];
    [self.layout_centerYConstraint deactivate];
}

@end
