//
//  XMLayout.h
//  XMLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XMLBaseProtocol.h"

@interface XMLayout : NSObject<XMLBaseProtocol>

- (instancetype)initWithRelationshipView:(UIView *)relationshipView;

@property (nonatomic, readonly, weak) UIView *relationshipView;

@property (nonatomic, assign) CGFloat margin_top;
@property (nonatomic, assign) CGFloat margin_bottom;
@property (nonatomic, assign) CGFloat margin_left;
@property (nonatomic, assign) CGFloat margin_right;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@end
