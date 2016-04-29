//
//  XLayoutConstraint.m
//  XLayout
//
//  Created by admin on 16/4/27.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XLayoutConstraint.h"

#import <UIKit/UIView.h>

#import "UIView+XLayout.h"
#import "XLayoutViewService.h"

@interface XLayoutConstraint ()

@property (nonatomic, copy) NSString *attributes;
@property (nonatomic, strong) NSMutableArray *constraint;

@end

@implementation XLayoutConstraint

- (NSMutableArray *)constraint {
    if (!_constraint) {
        _constraint = [[NSMutableArray alloc] init];
    }
    return _constraint;
}

+ (instancetype)constraintWithView:(UIView *)view layoutAttributes:(NSString *)attributes {
    XLayoutConstraint *constraint = [[XLayoutConstraint alloc] init];
    constraint.firstView = view;
    constraint.attributes = attributes;
    return constraint;
}

- (void)activate {
    [self updateConstraintWithLayoutAttributes:self.attributes];
    [self updateOrNew];
}

- (void)updateOrNew {
    if (self.secondView && self.secondAttribute == NSLayoutAttributeNotAnAttribute) {
        self.secondAttribute = self.firstAttribute;
    }else if (self.secondAttribute != NSLayoutAttributeNotAnAttribute && !self.secondView) {
        self.secondView = self.firstView.superview;
    }
    
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"firstItem == %@ and firstAttribute == %d and relation == %d and secondItem == %@ and secondAttribute == %d and multiplier == %f",self.firstView,self.firstAttribute,self.relation,self.secondView,self.secondAttribute,self.multiplier];
    
    NSLayoutConstraint *constraint = [[self.constraint filteredArrayUsingPredicate:pre] firstObject];
    
    if (constraint) {
        if (self.relation != constraint.relation || self.multiplier != constraint.multiplier || ![self.secondView isEqual:constraint.secondItem]) {
            [self createNewConstraint];
        }else {
            if (self.priority != constraint.priority) {
                constraint.priority = self.priority;
            }
            if (self.constant != constraint.constant) {
                constraint.constant = self.constant;
            }
        }
    }else {
        [self createNewConstraint];
    }
}

- (void)createNewConstraint {
    if (self.deleteEexistingWhenUpdating) {
        [self deactivate];
    }
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.firstView attribute:self.firstAttribute relatedBy:self.relation toItem:self.secondView attribute:self.secondAttribute multiplier:self.multiplier constant:self.constant];
    [constraint setPriority:self.priority];
    [self.firstView.viewService.contentView addConstraint:constraint];
    [self.constraint addObject:constraint];
}

- (void)deactivate {
    [self.firstView.viewService.contentView removeConstraints:self.constraint];
}

- (void)updateConstraintWithLayoutAttributes:(NSString *)attributes immediately:(BOOL)immediately {
    NSString *layoutId = nil;
    
    UIView *secondView = nil;
    CGFloat constant = 0.0;
    CGFloat multiplier = 1.0f;
    NSLayoutRelation relation = NSLayoutRelationEqual;
    UILayoutPriority priority = UILayoutPriorityRequired;
    
    NSRange layoutIdRange = [attributes rangeOfString:@":\\w+[:*@]?" options:NSRegularExpressionSearch];
    NSRange relationRange = [attributes rangeOfString:@"[><]=" options:NSRegularExpressionSearch];
    NSRange constantRange = [attributes rangeOfString:@"[:=]*-*\\d+.*\\d*[*@]*" options:NSRegularExpressionSearch];
    NSRange multiplierRange = [attributes rangeOfString:@"\\*-?\\d+.?\\d*@?" options:NSRegularExpressionSearch];
    NSRange priorityRange = [attributes rangeOfString:@"\\@-?\\d+.?\\d+" options:NSRegularExpressionSearch];
    
    if (layoutIdRange.location != NSNotFound  && layoutIdRange.length != 0) {
        layoutId = [attributes substringWithRange:layoutIdRange];
        layoutId = [layoutId stringByReplacingOccurrencesOfString:@"[:*@]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, layoutId.length)];
    }
    
    if (relationRange.location != NSNotFound && relationRange.length != 0) {
        NSString *relationString = [attributes substringWithRange:relationRange];
        if ([relationString isEqualToString:@">="]) {
            relation = NSLayoutRelationGreaterThanOrEqual;
        }else if ([relationString isEqualToString:@"<="]) {
            relation = NSLayoutRelationLessThanOrEqual;
        }
    }
    
    if (constantRange.location != NSNotFound && constantRange.length != 0) {
        NSString *constantString = [attributes substringWithRange:constantRange];
        constantString = [constantString stringByReplacingOccurrencesOfString:@"[:=*@]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, constantString.length)];
        
        constant = [constantString doubleValue];
    }
    
    if (multiplierRange.location != NSNotFound && multiplierRange.length != 0) {
        NSString *multiplierString = [attributes substringWithRange:multiplierRange];
        multiplierString = [multiplierString stringByReplacingOccurrencesOfString:@"[*@]" withString:@"" options:NSRegularExpressionSearch range:NSMakeRange(0, multiplierString.length)];
        
        multiplier = [multiplierString doubleValue];
    }
    
    if (priorityRange.location != NSNotFound  && priorityRange.length != 0) {
        NSString *priorityString = [attributes substringWithRange:priorityRange];
        priorityString = [priorityString stringByReplacingOccurrencesOfString:@"@" withString:@""];
        
        priority = [priorityString doubleValue];
    }
    
    if (layoutId) {
        secondView = self.firstView.viewService.viewWithLayoutId(layoutId);
        NSAssert(secondView, @"Failed to get associated view");
    }
    
    self.attributes = attributes;
    
    self.secondView = secondView;
    self.constant   = constant;
    self.multiplier = multiplier;
    self.relation   = relation;
    self.priority   = priority;
    
    if (immediately) {
        [self updateOrNew];
    }
}

- (void)updateConstraintWithLayoutAttributes:(NSString *)attributes {
    [self updateConstraintWithLayoutAttributes:attributes immediately:YES];
}

@end
