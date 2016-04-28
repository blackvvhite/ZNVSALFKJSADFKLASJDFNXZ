//
//  XLayoutRelative.m
//  XLayout
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XLayoutRelative.h"

#import <UIKit/UIView.h>

#import "XLayoutConstraint.h"

@interface XLayoutRelative ()

@property (nonatomic, strong) XLayoutConstraint *layout_aboveConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_belowConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_alignBaselineConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_alignTopConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_alignBottomConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_alignLeftConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_alignRightConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_alignParentTopConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_alignParentBottomConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_alignParentLeftConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_alignParentRightConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_centerHorizontalConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_centerVerticalConstraint;

@end

@implementation XLayoutRelative

#pragma mark - Public Getter / Setter

- (void)setLayout_above:(NSString *)layout_above {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_above, @"The layout_above attribute cannot be empty");
    
    if (!self.layout_aboveConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_above];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeTop;
        
        self.layout_aboveConstraint = constraint;
        
    }else {
        
        [self.layout_aboveConstraint updateConstraintWithLayoutAttributes:layout_above];
    }
    
    _layout_above = layout_above;
}

- (void)setLayout_below:(NSString *)layout_below {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_below, @"The layout_below attribute cannot be empty");
    
    if (!self.layout_belowConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_below];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeBottom;

        self.layout_belowConstraint = constraint;
        
    }else {
        
        [self.layout_belowConstraint updateConstraintWithLayoutAttributes:layout_below];
    }
    
    _layout_below = layout_below;
}

- (void)setLayout_alignBaseline:(NSString *)layout_alignBaseline {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignBaseline, @"The layout_alignBaseline attribute cannot be empty");
    
    if (!self.layout_alignBaselineConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_alignBaseline];
        constraint.firstAttribute = NSLayoutAttributeBaseline;
        constraint.secondAttribute = NSLayoutAttributeBaseline;
        
        self.layout_alignBaselineConstraint = constraint;
        
    }else {
        
        [self.layout_alignBaselineConstraint updateConstraintWithLayoutAttributes:layout_alignBaseline];
    }
    
    _layout_alignBaseline = layout_alignBaseline;
}

- (void)setLayout_alignTop:(NSString *)layout_alignTop {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignTop, @"The layout_alignTop attribute cannot be empty");
    
    if (!self.layout_alignTopConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_alignTop];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeTop;
        
        self.layout_alignTopConstraint = constraint;
        
    }else {
        
        [self.layout_alignTopConstraint updateConstraintWithLayoutAttributes:layout_alignTop];
    }

    _layout_alignTop = layout_alignTop;
}

- (void)setLayout_alignBottom:(NSString *)layout_alignBottom {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignBottom, @"The layout_alignBottom attribute cannot be empty");
    
    if (!self.layout_alignBottomConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_alignBottom];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        
        self.layout_alignBottomConstraint = constraint;
        
    }else {
        
        [self.layout_alignBottomConstraint updateConstraintWithLayoutAttributes:layout_alignBottom];
    }
    
    _layout_alignBottom = layout_alignBottom;
}

- (void)setLayout_alignLeft:(NSString *)layout_alignLeft {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignLeft, @"The layout_alignLeft attribute cannot be empty");
    
    if (!self.layout_alignLeftConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_alignLeft];
        constraint.firstAttribute = NSLayoutAttributeLeading;
        constraint.secondAttribute = NSLayoutAttributeLeading;

        self.layout_alignLeftConstraint = constraint;
        
    }else {
        
        [self.layout_alignLeftConstraint updateConstraintWithLayoutAttributes:layout_alignLeft];
    }
    
    _layout_alignLeft = layout_alignLeft;
}

- (void)setLayout_alignRight:(NSString *)layout_alignRight{
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignRight, @"The layout_alignRight attribute cannot be empty");
    
    if (!self.layout_alignRightConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_alignRight];
        constraint.firstAttribute = NSLayoutAttributeTrailing;
        constraint.secondAttribute = NSLayoutAttributeTrailing;

        self.layout_alignRightConstraint = constraint;
        
    }else {
        
        [self.layout_alignRightConstraint updateConstraintWithLayoutAttributes:layout_alignRight];
    }
    
    _layout_alignRight = layout_alignRight;
}


#pragma mark - 相对于父组件

- (void)setLayout_alignParentTop:(BOOL)layout_alignParentTop {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_alignParentTopConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeTop;

        self.layout_alignParentTopConstraint = constraint;
        
    }else {
        
        if (!layout_alignParentTop) {
            
            [self.layout_alignParentTopConstraint deactivate];
        }
    }
    
    _layout_alignParentTop = layout_alignParentTop;
}

- (void)setLayout_alignParentBottom:(BOOL)layout_alignParentBottom {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_alignParentBottomConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        
        self.layout_alignParentBottomConstraint = constraint;
        
    }else {
        
        if (!layout_alignParentBottom) {
            
            [self.layout_alignParentBottomConstraint deactivate];
        }
    }
    
    _layout_alignParentBottom = layout_alignParentBottom;
}

- (void)setLayout_alignParentLeft:(BOOL)layout_alignParentLeft {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_alignParentLeftConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeLeading;
        constraint.secondAttribute = NSLayoutAttributeLeading;

        self.layout_alignParentLeftConstraint = constraint;
        
    }else {
        
        if (!layout_alignParentLeft) {
            
            [self.layout_alignParentLeftConstraint deactivate];
        }
    }
    
    _layout_alignParentLeft = layout_alignParentLeft;
}

- (void)setLayout_alignParentRight:(BOOL)layout_alignParentRight {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_alignParentRightConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeTrailing;
        constraint.secondAttribute = NSLayoutAttributeTrailing;

        self.layout_alignParentRightConstraint = constraint;
        
    }else {
        
        if (!layout_alignParentRight) {
            
            [self.layout_alignParentRightConstraint deactivate];
        }
    }
    
    _layout_alignParentRight = layout_alignParentRight;
}

#pragma mark - 居中

- (void)setLayout_centerHorizontal:(BOOL)layout_centerHorizontal {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_centerHorizontalConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeCenterX;
        constraint.secondAttribute = NSLayoutAttributeCenterX;
        
        self.layout_centerHorizontalConstraint = constraint;
        
    }else {
        
        if (!layout_centerHorizontal) {
            
            [self.layout_centerHorizontalConstraint deactivate];
        }
    }
    
    _layout_centerHorizontal = layout_centerHorizontal;
}

- (void)setLayout_centerVertical:(BOOL)layout_centerVertical {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_centerVerticalConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeCenterY;
        constraint.secondAttribute = NSLayoutAttributeCenterY;
        
        self.layout_centerVerticalConstraint = constraint;
        
    }else {
        
        if (!layout_centerVertical) {
            
            [self.layout_centerVerticalConstraint deactivate];
        }
    }
    
    _layout_centerVertical = layout_centerVertical;
}

- (void)setLayout_centerInParent:(BOOL)layout_centerInParent {
    
    [self setLayout_centerHorizontal:layout_centerInParent];
    [self setLayout_centerVertical:layout_centerInParent];
    
    _layout_centerInParent = layout_centerInParent;
}

- (void)activate {
    
    [super activate];

    [self.layout_aboveConstraint activate];
    [self.layout_belowConstraint activate];
    [self.layout_alignBaselineConstraint activate];
    [self.layout_alignTopConstraint activate];
    [self.layout_alignBottomConstraint activate];
    [self.layout_alignLeftConstraint activate];
    [self.layout_alignRightConstraint activate];
    [self.layout_alignParentTopConstraint activate];
    [self.layout_alignParentBottomConstraint activate];
    [self.layout_alignParentRightConstraint activate];
    [self.layout_alignParentRightConstraint activate];
    [self.layout_centerHorizontalConstraint activate];
    [self.layout_centerVerticalConstraint activate];
}

- (void)deactivate {
    
    [super deactivate];
    
    [self.layout_aboveConstraint deactivate];
    [self.layout_belowConstraint deactivate];
    [self.layout_alignBaselineConstraint deactivate];
    [self.layout_alignTopConstraint deactivate];
    [self.layout_alignBottomConstraint deactivate];
    [self.layout_alignLeftConstraint deactivate];
    [self.layout_alignRightConstraint deactivate];
    [self.layout_alignParentTopConstraint deactivate];
    [self.layout_alignParentBottomConstraint deactivate];
    [self.layout_alignParentRightConstraint deactivate];
    [self.layout_alignParentRightConstraint deactivate];
    [self.layout_centerHorizontalConstraint deactivate];
    [self.layout_centerVerticalConstraint deactivate];
}














@end
