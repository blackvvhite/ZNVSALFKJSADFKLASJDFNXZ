//
//  XMLRelativeLayout.m
//  XMLayout
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XMLRelativeLayout.h"

#import <UIKit/UIView.h>

#import "XMLayoutConstraint.h"

@interface XMLRelativeLayout ()

@property (nonatomic, strong) XMLayoutConstraint *layout_aboveConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_belowConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_alignBaselineConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_alignTopConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_alignBottomConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_alignLeftConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_alignRightConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_alignParentTopConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_alignParentBottomConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_alignParentLeftConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_alignParentRightConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_centerHorizontalConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_centerVerticalConstraint;

@end

@implementation XMLRelativeLayout

#pragma mark - Public Getter / Setter

- (void)setLayout_above:(NSString *)layout_above {
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_above, @"The layout_above attribute cannot be empty");
    
    if (!self.layout_aboveConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_above];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeTop;
        
        [constraint activate];
        
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
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_below];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        
        [constraint activate];
        
        self.layout_belowConstraint = constraint;
        
    }else {
        
        [self.layout_belowConstraint updateConstraintWithLayoutAttributes:layout_below];
    }
    
    _layout_below = layout_below;
}

- (void)setLayout_alignBaseline:(NSString *)layout_alignBaseline {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignBaseline, @"The below attribute cannot be empty");
    
    if (!self.layout_alignBaselineConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_alignBaseline];
        constraint.firstAttribute = NSLayoutAttributeBaseline;
        constraint.secondAttribute = NSLayoutAttributeBaseline;
        
        [constraint activate];
        
        self.layout_alignBaselineConstraint = constraint;
        
    }else {
        
        [self.layout_alignBaselineConstraint updateConstraintWithLayoutAttributes:layout_alignBaseline];
    }
    
    _layout_alignBaseline = layout_alignBaseline;
}

- (void)setLayout_alignTop:(NSString *)layout_alignTop {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignTop, @"The below attribute cannot be empty");
    
    if (!self.layout_alignTopConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_alignTop];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeTop;
        
        [constraint activate];
        
        self.layout_alignTopConstraint = constraint;
        
    }else {
        
        [self.layout_alignTopConstraint updateConstraintWithLayoutAttributes:layout_alignTop];
    }

    _layout_alignTop = layout_alignTop;
}

- (void)setLayout_alignBottom:(NSString *)layout_alignBottom {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignBottom, @"The below attribute cannot be empty");
    
    if (!self.layout_alignBottomConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_alignBottom];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        
        [constraint activate];
        
        self.layout_alignBottomConstraint = constraint;
        
    }else {
        
        [self.layout_alignBottomConstraint updateConstraintWithLayoutAttributes:layout_alignBottom];
    }
    
    _layout_alignBottom = layout_alignBottom;
}

- (void)setLayout_alignLeft:(NSString *)layout_alignLeft {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignLeft, @"The below attribute cannot be empty");
    
    if (!self.layout_alignLeftConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_alignLeft];
        constraint.firstAttribute = NSLayoutAttributeLeading;
        constraint.secondAttribute = NSLayoutAttributeLeading;
        
        [constraint activate];
        
        self.layout_alignLeftConstraint = constraint;
        
    }else {
        
        [self.layout_alignLeftConstraint updateConstraintWithLayoutAttributes:layout_alignLeft];
    }
    
    _layout_alignLeft = layout_alignLeft;
}

- (void)setLayout_alignRight:(NSString *)layout_alignRight{
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignRight, @"The below attribute cannot be empty");
    
    if (!self.layout_alignRightConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_alignRight];
        constraint.firstAttribute = NSLayoutAttributeTrailing;
        constraint.secondAttribute = NSLayoutAttributeTrailing;
        
        [constraint activate];
        
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
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeTop;
        
        [constraint activate];
        
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
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        
        [constraint activate];
        
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
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeLeading;
        constraint.secondAttribute = NSLayoutAttributeLeading;
        
        [constraint activate];
        
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
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeTrailing;
        constraint.secondAttribute = NSLayoutAttributeTrailing;
        
        [constraint activate];
        
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
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeCenterX;
        constraint.secondAttribute = NSLayoutAttributeCenterX;
        
        [constraint updateConstraintWithLayoutAttributes:nil];
        [constraint activate];
        
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
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:nil];
        constraint.firstAttribute = NSLayoutAttributeCenterY;
        constraint.secondAttribute = NSLayoutAttributeCenterY;
        
        [constraint updateConstraintWithLayoutAttributes:nil];
        [constraint activate];
        
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















@end
