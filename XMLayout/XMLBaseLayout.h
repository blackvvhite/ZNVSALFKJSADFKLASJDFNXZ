//
//  XMLBaseLayout.H
//  XMLayout
//
//  Created by admin on 16/4/25.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIView;
@interface XMLBaseLayout : NSObject

- (instancetype)initWithRelationshipView:(UIView *)relationshipView;

@property (nonatomic, readonly, weak) UIView *relationshipView;

@property (nonatomic, copy) NSString *layout_marginTop;
@property (nonatomic, copy) NSString *layout_marginBottom;
@property (nonatomic, copy) NSString *layout_marginLeft;
@property (nonatomic, copy) NSString *layout_marginRight;
@property (nonatomic, copy) NSString *layout_width;
@property (nonatomic, copy) NSString *layout_height;

@end
