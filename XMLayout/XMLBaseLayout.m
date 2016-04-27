//
//  XMLBaseLayout.m
//  XMLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "XMLBaseLayout.h"

#import "UIView+XMLayout.h"
#import "XMLayoutConstraint.h"

@interface XMLBaseLayout ()

@property (nonatomic, readwrite, weak) UIView *relationshipView;

@property (nonatomic, strong) XMLayoutConstraint *layout_marginTopConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_marginBottomConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_marginLeftConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_marginRightConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_widthConstraint;
@property (nonatomic, strong) XMLayoutConstraint *layout_heightConstraint;

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


#pragma mark - Public

#pragma mark - Public Getter / Setter

- (void)setLayout_marginTop:(NSString *)layout_marginTop {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_marginTopConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_marginTop];
        constraint.firstAttribute = NSLayoutAttributeTop;
        constraint.secondAttribute = NSLayoutAttributeTop;
        
        [constraint activate];
        
        self.layout_marginTopConstraint = constraint;
        
    }else {
        
        [self.layout_marginTopConstraint updateConstraintWithLayoutAttributes:layout_marginTop];
    }
    
    _layout_marginTop = layout_marginTop;
}

- (void)setLayout_marginBottom:(NSString *)layout_marginBottom {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_marginBottomConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_marginBottom];
        constraint.firstAttribute = NSLayoutAttributeBottom;
        constraint.secondAttribute = NSLayoutAttributeBottom;
        
        [constraint activate];
        
        self.layout_marginBottomConstraint = constraint;
        
    }else {
        
        [self.layout_marginBottomConstraint updateConstraintWithLayoutAttributes:layout_marginBottom];
    }

    
    _layout_marginBottom = layout_marginBottom;
}

- (void)setLayout_marginLeft:(NSString *)layout_marginLeft{
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_marginLeftConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_marginLeft];
        constraint.firstAttribute = NSLayoutAttributeLeading;
        constraint.secondAttribute = NSLayoutAttributeLeading;
        
        [constraint activate];
        
        self.layout_marginLeftConstraint = constraint;
        
    }else {
        
        [self.layout_marginLeftConstraint updateConstraintWithLayoutAttributes:layout_marginLeft];
    }
    
    _layout_marginLeft = layout_marginLeft;
}

- (void)setLayout_marginRight:(NSString *)layout_marginRight {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_marginRightConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_marginRight];
        constraint.firstAttribute = NSLayoutAttributeTrailing;
        constraint.secondAttribute = NSLayoutAttributeTrailing;
        
        [constraint activate];
        
        self.layout_marginRightConstraint = constraint;
        
    }else {
        
        [self.layout_marginRightConstraint updateConstraintWithLayoutAttributes:layout_marginRight];
    }
    
    _layout_marginRight = layout_marginRight;
}

- (void)setLayout_width:(NSString *)layout_width {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_widthConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_width];
        constraint.firstAttribute = NSLayoutAttributeWidth;
        constraint.secondAttribute = NSLayoutAttributeNotAnAttribute;
        
        [constraint activate];
        
        self.layout_widthConstraint = constraint;
        
    }else {
        
        [self.layout_widthConstraint updateConstraintWithLayoutAttributes:layout_width];
    }
    
    _layout_width = layout_width;
}

- (void)setLayout_height:(NSString *)layout_height {
    
    NSAssert(self.relationshipView.superview, @"There is no parent view");
    
    if (!self.layout_heightConstraint) {
        
        XMLayoutConstraint *constraint = [XMLayoutConstraint constraintWithView:self.relationshipView
                                                               layoutAttributes:layout_height];
        constraint.firstAttribute = NSLayoutAttributeHeight;
        constraint.secondAttribute = NSLayoutAttributeNotAnAttribute;
        
        [constraint activate];
        
        self.layout_heightConstraint = constraint;
        
    }else {
        
        [self.layout_heightConstraint updateConstraintWithLayoutAttributes:layout_height];
    }
    
    _layout_height = layout_height;
}

@end
