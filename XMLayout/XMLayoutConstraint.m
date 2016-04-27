//
//  XMLayoutConstraint.m
//  XMLayout
//
//  Created by admin on 16/4/27.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XMLayoutConstraint.h"

#import <UIKit/UIView.h>

#import "UIView+XMLayout.h"
#import "XMLViewService.h"

@interface XMLayoutConstraint ()

@property (nonatomic, weak) NSLayoutConstraint *constraint;

@end

@implementation XMLayoutConstraint

+ (instancetype)constraintWithView:(UIView *)view
                  layoutAttributes:(NSString *)attributes
{
    XMLayoutConstraint *constraint = [[XMLayoutConstraint alloc] init];
    constraint.firstView = view;
    
    [constraint updateConstraintWithLayoutAttributes:attributes immediately:NO];
    
    return constraint;
}

- (void)activate {
    
    if (self.secondView && self.secondAttribute == NSLayoutAttributeNotAnAttribute) {
        
        self.secondAttribute = self.firstAttribute;
        
    }else if (self.secondAttribute != NSLayoutAttributeNotAnAttribute && !self.secondView) {
        
        self.secondView = self.firstView.superview;
    }
    
    if (self.constraint) {
        
        if (self.relation != self.constraint.relation           ||
            self.multiplier != self.constraint.multiplier       ||
            ![self.secondView isEqual:self.constraint.secondItem])
        {
            
            [self newConstraint];
            
        }else {
            
            if (self.priority != self.constraint.priority) {
                
                 self.constraint.priority = self.priority;
            }
            
            if (self.constant != self.constraint.constant) {
                
                self.constraint.constant = self.constant;
            }
        }
    }else {
        
        [self newConstraint];
    }
     
}

- (void)newConstraint {
    
    [self deactivate];
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self.firstView
                                                                  attribute:self.firstAttribute
                                                                  relatedBy:self.relation
                                                                     toItem:self.secondView
                                                                  attribute:self.secondAttribute
                                                                 multiplier:self.multiplier
                                                                   constant:self.constant];
    
    [constraint setPriority:self.priority];
    [self.firstView.viewService.contentView addConstraint:constraint];
    [self setConstraint:constraint];
}

- (void)deactivate {

    [self.firstView.viewService.contentView removeConstraint:self.constraint];
}

- (void)updateConstraintWithLayoutAttributes:(NSString *)attributes immediately:(BOOL)immediately {
    
    NSString *layoutId = nil;
    
    UIView *secondView = nil;
    CGFloat constant = 0.0;
    CGFloat multiplier = 1.0f;
    NSLayoutRelation relation = NSLayoutRelationEqual;
    UILayoutPriority priority = UILayoutPriorityRequired;
    
    NSRange layoutIdRange = [attributes rangeOfString:@":\\w+[:*@]*" options:NSRegularExpressionSearch];
    NSRange relationRange = [attributes rangeOfString:@"[><]=" options:NSRegularExpressionSearch];
    NSRange constantRange = [attributes rangeOfString:@"=*-*\\d+[*@]*" options:NSRegularExpressionSearch];
    NSRange multiplierRange = [attributes rangeOfString:@"\\*-*\\d+@*" options:NSRegularExpressionSearch];
    NSRange priorityRange = [attributes rangeOfString:@"@-*\\d+" options:NSRegularExpressionSearch];
    
    if (layoutIdRange.location != NSNotFound  && layoutIdRange.length != 0) {
        
        layoutId = [attributes substringWithRange:layoutIdRange];
        layoutId = [layoutId stringByReplacingOccurrencesOfString:@"[:*@]"
                                            withString:@""
                                               options:NSRegularExpressionSearch
                                                 range:NSMakeRange(0, layoutId.length)];
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
        constantString = [constantString stringByReplacingOccurrencesOfString:@"[=*@]"
                                                                   withString:@""
                                                                      options:NSRegularExpressionSearch
                                                                        range:NSMakeRange(0, constantString.length)];
        
        constant = [constantString doubleValue];
    }
    
    if (multiplierRange.location != NSNotFound && multiplierRange.length != 0) {
        
        NSString *multiplierString = [attributes substringWithRange:multiplierRange];
        multiplierString = [multiplierString stringByReplacingOccurrencesOfString:@"[*@]"
                                                                       withString:@""
                                                                          options:NSRegularExpressionSearch
                                                                            range:NSMakeRange(0, multiplierString.length)];
        
        multiplier = [multiplierString doubleValue];
    }
    
    if (priorityRange.location != NSNotFound  && priorityRange.length != 0) {
        
        NSString *priorityString = [attributes substringWithRange:priorityRange];
        priorityString = [priorityString stringByReplacingOccurrencesOfString:@"[*@]"
                                                                   withString:@""
                                                                      options:NSRegularExpressionSearch
                                                                        range:NSMakeRange(0, priorityString.length)];
        
        priority = [priorityString doubleValue];
    }
    
    if (layoutId) {
        
        secondView = self.firstView.viewService.viewWithLayoutId(layoutId);
        NSAssert(secondView, @"Failed to get associated view");
    }
    
    self.secondView = secondView;
    self.constant   = constant;
    self.multiplier = multiplier;
    self.relation   = relation;
    self.priority   = priority;
    
    if (immediately) {
        [self activate];
    }
}

- (void)updateConstraintWithLayoutAttributes:(NSString *)attributes {
    
    [self updateConstraintWithLayoutAttributes:attributes immediately:YES];
}


@end
