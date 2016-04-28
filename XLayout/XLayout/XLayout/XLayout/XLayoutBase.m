//
//  XLayoutBase.m
//  XLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XLayoutBase.h"

#import "UIView+XLayout.h"
#import "XLayoutConstraint.h"

@interface XLayoutBase ()

@property (nonatomic, readwrite, weak) UIView *relationshipView;

@property (nonatomic, strong) XLayoutConstraint *layout_marginTopConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_marginBottomConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_marginLeftConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_marginRightConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_widthConstraint;
@property (nonatomic, strong) XLayoutConstraint *layout_heightConstraint;

@end

@implementation XLayoutBase

#pragma mark- Init

- (instancetype)initWithRelationshipView:(UIView *)relationshipView {
    
    self = [super init];
    if (self) {
        
        self.relationshipView = relationshipView;
    }
    return self;
}

#pragma mark - Private


#pragma mark - Public

#pragma mark - Public Getter / Setter

- (void)setLayout_marginTop:(NSString *)layout_marginTop {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_marginTopConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_marginTop];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeTop;
        
        self.layout_marginTopConstraint = constraint;
        
    }else {
        
        [self.layout_marginTopConstraint updateConstraintWithLayoutAttributes:layout_marginTop];
    }
    
    _layout_marginTop = layout_marginTop;
}

- (void)setLayout_marginBottom:(NSString *)layout_marginBottom {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_marginBottomConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_marginBottom];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        
        self.layout_marginBottomConstraint = constraint;
        
    }else {
        
        [self.layout_marginBottomConstraint updateConstraintWithLayoutAttributes:layout_marginBottom];
    }

    
    _layout_marginBottom = layout_marginBottom;
}

- (void)setLayout_marginLeft:(NSString *)layout_marginLeft{
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_marginLeftConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_marginLeft];
        constraint.firstAttribute = NSLayoutAttributeLeading;
        constraint.secondAttribute = NSLayoutAttributeLeading;
        
        self.layout_marginLeftConstraint = constraint;
        
    }else {
        
        [self.layout_marginLeftConstraint updateConstraintWithLayoutAttributes:layout_marginLeft];
    }
    
    _layout_marginLeft = layout_marginLeft;
}

- (void)setLayout_marginRight:(NSString *)layout_marginRight {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_marginRightConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_marginRight];
        constraint.firstAttribute = NSLayoutAttributeTrailing;
        constraint.secondAttribute = NSLayoutAttributeTrailing;
        
        self.layout_marginRightConstraint = constraint;
        
    }else {
        
        [self.layout_marginRightConstraint updateConstraintWithLayoutAttributes:layout_marginRight];
    }
    
    _layout_marginRight = layout_marginRight;
}

- (void)setLayout_width:(NSString *)layout_width {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_widthConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_width];
        constraint.firstAttribute = NSLayoutAttributeWidth;
        constraint.secondAttribute = NSLayoutAttributeNotAnAttribute;
        
        self.layout_widthConstraint = constraint;
        
    }else {
        
        [self.layout_widthConstraint updateConstraintWithLayoutAttributes:layout_width];
    }
    
    _layout_width = layout_width;
}

- (void)setLayout_height:(NSString *)layout_height {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_heightConstraint) {
        
        XLayoutConstraint *constraint = [XLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_height];
        constraint.firstAttribute = NSLayoutAttributeHeight;
        constraint.secondAttribute = NSLayoutAttributeNotAnAttribute;
        
        self.layout_heightConstraint = constraint;
        
    }else {
        
        [self.layout_heightConstraint updateConstraintWithLayoutAttributes:layout_height];
    }
    
    _layout_height = layout_height;
}

- (void)activate {
    
    [self.layout_marginTopConstraint activate];
    [self.layout_marginBottomConstraint activate];
    [self.layout_marginLeftConstraint activate];
    [self.layout_marginRightConstraint activate];
    [self.layout_widthConstraint activate];
    [self.layout_heightConstraint activate];
}

- (void)deactivate {
    
    [self.layout_marginTopConstraint deactivate];
    [self.layout_marginBottomConstraint deactivate];
    [self.layout_marginLeftConstraint deactivate];
    [self.layout_marginRightConstraint deactivate];
    [self.layout_widthConstraint deactivate];
    [self.layout_heightConstraint deactivate];
}

@end
