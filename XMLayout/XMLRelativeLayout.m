//
//  XMLRelativeLayout.m
//  XMLayout
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XMLRelativeLayout.h"
#import "UIView+XMLayoutExtension.h"

@interface XMLRelativeLayout ()

@property (nonatomic, weak) NSLayoutConstraint *layout_aboveConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_belowConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_toLeftOfConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_toRightOfConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_alignBaselineConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_alignTopConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_alignBottomConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_alignLeftConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_alignRightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_alignParentTopConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_alignParentBottomConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_alignParentLeftConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_alignParentRightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_centerHorizontalConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_centerVerticalConstraint;
@property (nonatomic, weak) NSLayoutConstraint *layout_centerInParentConstraint;

@end

@implementation XMLRelativeLayout

#pragma mark - Private

- (NSLayoutConstraint *)constraintWithAttribute:(NSLayoutAttribute)attribute
                                         toView:(id)toView
                                      attribute:(NSLayoutAttribute)attribute2
                                       constant:(CGFloat)constant {
    
    return [NSLayoutConstraint constraintWithItem:self.relationshipView
                                        attribute:attribute
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:toView
                                        attribute:attribute2
                                       multiplier:1
                                         constant:constant];
}

- (void)getViewAndConstantWithLayout:(NSString *)layout
                          outputView:(UIView **)outputView
                      outputConstant:(CGFloat *)outputConstant
{
    NSString *layoutId = layout;
    
    NSRange r = [layout rangeOfString:@":"];
    if (r.location != NSNotFound) {
        layoutId = [layout substringToIndex:r.location];
        *outputConstant = [[layout substringFromIndex:(r.location + 1)] floatValue];
    }
    
    UIView *toView = [self.relationshipView viewByLayoutId:layoutId];
    
    NSAssert(toView, @"Failed to get associated view");
    
    *outputView = toView;
}

#pragma mark - Public Getter / Setter

- (void)setLayout_above:(NSString *)layout_above {
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_above, @"The below attribute cannot be empty");
    
    UIView *toView = nil;
    CGFloat constant = 0.0;
    
    [self getViewAndConstantWithLayout:layout_above
                            outputView:&toView
                        outputConstant:&constant];
    
    [self deactivateConstraint:self.layout_aboveConstraint];
    
    NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeBottom
                                                            toView:toView
                                                         attribute:NSLayoutAttributeTop
                                                          constant:-constant];
    [self activateConstraint:constraint];
    [self setLayout_aboveConstraint:constraint];
    
    _layout_above = layout_above;
}

- (void)setLayout_below:(NSString *)layout_below {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_below, @"The below attribute cannot be empty");
    
    UIView *toView = nil;
    CGFloat constant = 0.0;
    
    [self getViewAndConstantWithLayout:layout_below
                            outputView:&toView
                        outputConstant:&constant];
    
    [self deactivateConstraint:self.layout_belowConstraint];
    
    NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeTop
                                                            toView:toView
                                                         attribute:NSLayoutAttributeBottom
                                                          constant:constant];
    [self activateConstraint:constraint];
    [self setLayout_belowConstraint:constraint];
    
    _layout_below = layout_below;
}

- (void)setLayout_toLeftOf:(NSString *)layout_toLeftOf {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_toLeftOf, @"The below attribute cannot be empty");
    
    UIView *toView = nil;
    CGFloat constant = 0.0;
    
    [self getViewAndConstantWithLayout:layout_toLeftOf
                            outputView:&toView
                        outputConstant:&constant];
    
    [self deactivateConstraint:self.layout_toLeftOfConstraint];
    
    NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeLeading
                                                            toView:toView
                                                         attribute:NSLayoutAttributeLeading
                                                          constant:constant];
    [self activateConstraint:constraint];
    [self setLayout_toLeftOfConstraint:constraint];
    
    _layout_toLeftOf = layout_toLeftOf;
}

- (void)setLayout_toRightOf:(NSString *)layout_toRightOf {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_toRightOf, @"The below attribute cannot be empty");
    
    UIView *toView = nil;
    CGFloat constant = 0.0;
    
    [self getViewAndConstantWithLayout:layout_toRightOf
                            outputView:&toView
                        outputConstant:&constant];
    
    [self deactivateConstraint:self.layout_toRightOfConstraint];
    
    NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeTrailing
                                                            toView:toView
                                                         attribute:NSLayoutAttributeTrailing
                                                          constant:constant];
    [self activateConstraint:constraint];
    [self setLayout_toRightOfConstraint:constraint];
    
    _layout_toRightOf = layout_toRightOf;
}

- (void)setLayout_alignBaseline:(NSString *)layout_alignBaseline {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    NSAssert(layout_alignBaseline, @"The below attribute cannot be empty");
    
    UIView *toView = nil;
    CGFloat constant = 0.0;
    
    [self getViewAndConstantWithLayout:layout_alignBaseline
                            outputView:&toView
                        outputConstant:&constant];
    
    [self deactivateConstraint:self.layout_alignBaselineConstraint];
    
    NSLayoutConstraint *constraint = [self constraintWithAttribute:NSLayoutAttributeBaseline
                                                            toView:toView
                                                         attribute:NSLayoutAttributeBaseline
                                                          constant:constant];
    [self activateConstraint:constraint];
    [self setLayout_alignBaselineConstraint:constraint];
    
    _layout_alignBaseline = layout_alignBaseline;
}


















@end
