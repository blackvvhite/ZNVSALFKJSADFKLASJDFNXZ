//
//  UIView+XMLayout.h
//  XMLayout
//
//  Created by bateng on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XMLRelativeLayout.h"

@class XMLViewService;
@interface UIView (XMLayout)

@property (nonatomic, copy  ) NSString *layout_id;
@property (nonatomic, strong) XMLRelativeLayout *layout;
@property (nonatomic, weak  ) XMLViewService *viewService;


@end
