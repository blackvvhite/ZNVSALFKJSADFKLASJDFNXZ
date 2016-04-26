//
//  XMLBaseLayout.H
//  XMLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMLayoutProtocol.h"

@interface XMLBaseLayout : NSObject<XMLayoutProtocol>

- (instancetype)initWithRelationshipView:(UIView *)relationshipView;

@property (nonatomic, assign) CGFloat layout_marginTop;
@property (nonatomic, assign) CGFloat layout_marginBottom;
@property (nonatomic, assign) CGFloat layout_marginLeft;
@property (nonatomic, assign) CGFloat layout_marginRight;
@property (nonatomic, assign) CGFloat layout_width;
@property (nonatomic, assign) CGFloat layout_height;

- (void)activateConstraint:(NSLayoutConstraint *)constraint;
- (void)deactivateConstraint:(NSLayoutConstraint *)constraint;

@end
