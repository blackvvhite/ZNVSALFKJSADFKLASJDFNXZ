//
//  XLayoutBase.m
//  XLayout
//
//  Created by B&W on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XLayoutBase.h"
#import "XLayoutConstraintPrivate.h"
#import "UIView+XLayout.h"
#import <UIKit/UIView.h>

@interface XLayoutBase ()

@property (nonatomic, readwrite, weak) UIView *view;

@property (nonatomic, strong) XLayoutConstraint *layout_topConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_bottomConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_leftConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_rightConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_leadingConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_trailingConstraint;

@property (nonatomic, strong) XLayoutConstraint *layout_widthConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_heightConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_aspectRatioConstraint;

@property (nonatomic, strong) XLayoutConstraint *layout_aboveConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_belowConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_inLeadingConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_inTrailingConstraint;

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

#pragma mark - Private

- (void)assert {
    NSAssert1(self.view.superview, @"There (%@) is no parent view",self.view.layout_id);
}

- (NSArray *)parserParameterWithLayoutAttribute:(NSString *)layoutAttribute {
    NSRange r = [layoutAttribute rangeOfString:@"(^\\{.+,.+\\}$)|(^\\{.+,.+,.+,.+\\}$)" options:NSRegularExpressionSearch];
    NSArray *component = nil;
    if (r.location != NSNotFound && r.length != 0) {
        r.location += 1;
        r.length -= 1;
        component = [[layoutAttribute substringWithRange:r] componentsSeparatedByString:@","];
    }
    NSAssert(([component count] == 2 || [component count] == 4), @"Parameter format error. attribute:%@",layoutAttribute);
    return component;
}

#pragma mark - Public

- (void)activate {
    [self assert];
    
    [self.layout_topConstraint activate];
    [self.layout_bottomConstraint activate];
    [self.layout_leftConstraint activate];
    [self.layout_rightConstraint activate];
    [self.layout_leadingConstraint activate];
    [self.layout_trailingConstraint activate];
    
    [self.layout_widthConstraint activate];
    [self.layout_heightConstraint activate];
    [self.layout_aspectRatioConstraint activate];
    
    [self.layout_aboveConstraint activate];
    [self.layout_belowConstraint activate];
    [self.layout_inLeadingConstraint activate];
    [self.layout_inTrailingConstraint activate];
    
    [self.layout_baselineConstraint activate];
    
    [self.layout_centerXConstraint activate];
    [self.layout_centerYConstraint activate];
}

- (void)deactivate {
    [self.layout_topConstraint deactivate];
    [self.layout_bottomConstraint deactivate];
    [self.layout_leftConstraint deactivate];
    [self.layout_rightConstraint deactivate];
    [self.layout_leadingConstraint deactivate];
    [self.layout_trailingConstraint deactivate];
    
    [self.layout_widthConstraint deactivate];
    [self.layout_heightConstraint deactivate];
    [self.layout_aspectRatioConstraint deactivate];
    
    [self.layout_aboveConstraint deactivate];
    [self.layout_belowConstraint deactivate];
    [self.layout_inLeadingConstraint deactivate];
    [self.layout_inTrailingConstraint deactivate];
    
    [self.layout_baselineConstraint deactivate];
    
    [self.layout_centerXConstraint deactivate];
    [self.layout_centerYConstraint deactivate];
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
    self.layout_inLeadingConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    self.layout_inTrailingConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    
    self.layout_baselineConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    
    self.layout_centerXConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
    self.layout_centerYConstraint.deleteEexistingWhenUpdating = deleteEexistingWhenUpdating;
}

- (void)setLayout_top:(NSString *)layout_top {
    if (!self.layout_topConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_top];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeTop;
        constraint.layoutPosition = @"layout_top";
        self.layout_topConstraint = constraint;
    }else {
        [self.layout_topConstraint updateConstraintWithLayoutAttributes:layout_top];
    }
    _layout_top = layout_top;
}

- (void)setLayout_bottom:(NSString *)layout_bottom {
    if (!self.layout_bottomConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_bottom];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        constraint.layoutPosition = @"layout_bottom";
        self.layout_bottomConstraint = constraint;
    }else {
        [self.layout_bottomConstraint updateConstraintWithLayoutAttributes:layout_bottom];
    }
    _layout_bottom = layout_bottom;
}

- (void)setLayout_left:(NSString *)layout_left {
    if (!self.layout_leftConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_left];
        constraint.firstAttribute = NSLayoutAttributeLeft;
        constraint.secondAttribute = NSLayoutAttributeLeft;
        constraint.layoutPosition = @"layout_left";
        self.layout_leftConstraint = constraint;
    }else {
        [self.layout_leftConstraint updateConstraintWithLayoutAttributes:layout_left];
    }
    _layout_left = layout_left;
}

- (void)setLayout_right:(NSString *)layout_right {
    if (!self.layout_rightConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_right];
        constraint.firstAttribute = NSLayoutAttributeRight;
        constraint.secondAttribute = NSLayoutAttributeRight;
        constraint.layoutPosition = @"layout_right";
        self.layout_rightConstraint = constraint;
    }else {
        [self.layout_rightConstraint updateConstraintWithLayoutAttributes:layout_right];
    }
    _layout_right = layout_right;
}


- (void)setLayout_leading:(NSString *)layout_leading {
    if (!self.layout_leadingConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_leading];
        constraint.firstAttribute = NSLayoutAttributeLeading;
        constraint.secondAttribute = NSLayoutAttributeLeading;
        constraint.layoutPosition = @"layout_leading";
        self.layout_leadingConstraint = constraint;
    }else {
        [self.layout_leadingConstraint updateConstraintWithLayoutAttributes:layout_leading];
    }
    _layout_leading = layout_leading;
}

- (void)setLayout_trailing:(NSString *)layout_trailing {
    if (!self.layout_trailingConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_trailing];
        constraint.firstAttribute = NSLayoutAttributeTrailing;
        constraint.secondAttribute = NSLayoutAttributeTrailing;
        constraint.layoutPosition = @"layout_trailing";
        self.layout_trailingConstraint = constraint;
    }else {
        [self.layout_trailingConstraint updateConstraintWithLayoutAttributes:layout_trailing];
    }
    _layout_trailing = layout_trailing;
}

- (void)setLayout_top_leading:(NSString *)layout_top_leading {
    NSArray *attribute = [self parserParameterWithLayoutAttribute:layout_top_leading];
    [self setLayout_top:[attribute firstObject]];
    [self setLayout_left:[attribute lastObject]];
    _layout_top_leading = layout_top_leading;
}

- (void)setLayout_bottom_trailing:(NSString *)layout_bottom_trailing {
    NSArray *attribute = [self parserParameterWithLayoutAttribute:layout_bottom_trailing];
    [self setLayout_bottom:[attribute firstObject]];
    [self setLayout_right:[attribute lastObject]];
    _layout_bottom_trailing = layout_bottom_trailing;
}

- (void)setLayout_top_bottom:(NSString *)layout_top_bottom {
    NSArray *attribute = [self parserParameterWithLayoutAttribute:layout_top_bottom];
    [self setLayout_top:[attribute firstObject]];
    [self setLayout_bottom:[attribute lastObject]];
    _layout_top_bottom = layout_top_bottom;
}

- (void)setLayout_leading_trailing:(NSString *)layout_leading_trailing {
    NSArray *attribute = [self parserParameterWithLayoutAttribute:layout_leading_trailing];
    [self setLayout_left:[attribute firstObject]];
    [self setLayout_right:[attribute lastObject]];
    _layout_leading_trailing = layout_leading_trailing;
}

- (void)setLayout_width:(NSString *)layout_width {
    if (!self.layout_widthConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_width];
        constraint.firstAttribute = NSLayoutAttributeWidth;
        constraint.secondAttribute = NSLayoutAttributeNotAnAttribute;
        constraint.layoutPosition = @"layout_width";
        self.layout_widthConstraint = constraint;
    }else {
        [self.layout_widthConstraint updateConstraintWithLayoutAttributes:layout_width];
    }
    _layout_width = layout_width;
}

- (void)setLayout_height:(NSString *)layout_height {
    if (!self.layout_heightConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_height];
        constraint.firstAttribute = NSLayoutAttributeHeight;
        constraint.secondAttribute = NSLayoutAttributeNotAnAttribute;
        constraint.layoutPosition = @"layout_height";
        self.layout_heightConstraint = constraint;
    }else {
        [self.layout_heightConstraint updateConstraintWithLayoutAttributes:layout_height];
    }
    _layout_height = layout_height;
}

- (void)setLayout_size:(NSString *)layout_size {
    NSArray *attribute = [self parserParameterWithLayoutAttribute:layout_size];
    [self setLayout_width:[attribute firstObject]];
    [self setLayout_height:[attribute lastObject]];
    _layout_size = layout_size;
}

- (void)setLayout_aspect_ratio:(NSString *)layout_aspect_ratio {
    if (!self.layout_aspectRatioConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_aspect_ratio];
        constraint.firstAttribute = NSLayoutAttributeHeight;
        constraint.secondAttribute = NSLayoutAttributeWidth;
        constraint.layoutPosition = @"layout_aspect_ratio";
        self.layout_aspectRatioConstraint = constraint;
    }else {
        [self.layout_aspectRatioConstraint updateConstraintWithLayoutAttributes:layout_aspect_ratio];
    }
    _layout_aspect_ratio = layout_aspect_ratio;
}

- (void)setLayout_above:(NSString *)layout_above {
    if (!self.layout_aboveConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_above];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeTop;
        constraint.layoutPosition = @"layout_above";
        self.layout_aboveConstraint = constraint;
    }else {
        [self.layout_aboveConstraint updateConstraintWithLayoutAttributes:layout_above];
    }
    _layout_above = layout_above;
}

- (void)setLayout_below:(NSString *)layout_below {
    if (!self.layout_belowConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_below];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        constraint.layoutPosition = @"layout_below";
        self.layout_belowConstraint = constraint;
    }else {
        [self.layout_belowConstraint updateConstraintWithLayoutAttributes:layout_below];
    }
    _layout_below = layout_below;
}

- (void)setLayout_in_leading:(NSString *)layout_in_leading {
    if (!self.layout_inLeadingConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_in_leading];
        constraint.firstAttribute = NSLayoutAttributeTrailing;
        constraint.secondAttribute = NSLayoutAttributeLeading;
        constraint.layoutPosition = @"layout_in_leading";
        self.layout_inLeadingConstraint = constraint;
    }else {
        [self.layout_inLeadingConstraint updateConstraintWithLayoutAttributes:layout_in_leading];
    }
    _layout_in_leading = layout_in_leading;
}

- (void)setLayout_in_trailing:(NSString *)layout_in_trailing {
    if (!self.layout_inTrailingConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_in_trailing];
        constraint.firstAttribute = NSLayoutAttributeLeading;
        constraint.secondAttribute = NSLayoutAttributeTrailing;
        constraint.layoutPosition = @"layout_in_trailing";
        self.layout_inTrailingConstraint = constraint;
    }else {
        [self.layout_inTrailingConstraint updateConstraintWithLayoutAttributes:layout_in_trailing];
    }
    _layout_in_trailing = layout_in_trailing;
}

- (void)setLayout_baseline:(NSString *)layout_baseline {
    if (!self.layout_baselineConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_baseline];
        constraint.firstAttribute = NSLayoutAttributeBaseline;
        constraint.secondAttribute = NSLayoutAttributeBaseline;
        constraint.layoutPosition = @"layout_baseline";
        self.layout_baselineConstraint = constraint;
    }else {
        [self.layout_baselineConstraint updateConstraintWithLayoutAttributes:layout_baseline];
    }
    _layout_baseline = layout_baseline;
}

- (void)setLayout_centerX:(NSString *)layout_centerX {
    if (!self.layout_centerXConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_centerX];
        constraint.firstAttribute = NSLayoutAttributeCenterX;
        constraint.secondAttribute = NSLayoutAttributeCenterX;
        constraint.layoutPosition = @"layout_centerX";
        self.layout_centerXConstraint = constraint;
    }else {
        [self.layout_centerXConstraint updateConstraintWithLayoutAttributes:layout_centerX];
    }
    _layout_centerX = layout_centerX;
}

- (void)setLayout_centerY:(NSString *)layout_centerY {
    if (!self.layout_centerYConstraint) {
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.view layoutAttributes:layout_centerY];
        constraint.firstAttribute = NSLayoutAttributeCenterY;
        constraint.secondAttribute = NSLayoutAttributeCenterY;
        constraint.layoutPosition = @"layout_centerY";
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

- (void)setLayout_equal:(NSString *)layout_equal {
    [self setLayout_width:layout_equal];
    [self setLayout_height:layout_equal];
    _layout_equal = layout_equal;
}

- (void)setLayout_edge:(NSString *)layout_edge {
    NSArray *attribute = [self parserParameterWithLayoutAttribute:layout_edge];
    [self setLayout_top:[attribute firstObject]];
    [self setLayout_left:[attribute objectAtIndex:1]];
    [self setLayout_bottom:[attribute objectAtIndex:2]];
    [self setLayout_right:[attribute lastObject]];
    _layout_edge = layout_edge;
}

@end
