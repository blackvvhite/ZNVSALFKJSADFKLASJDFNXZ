//
//  UITableView+XLayout.m
//  XLayout
//
//  Created by bateng on 16/4/29.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UITableView+XLayout.h"
#import "UIView+XLayout.h"
#import "ONOXMLDocument.h"

@implementation UITableView (XLayout)

+ (instancetype)viewWithXMLElementObject:(ONOXMLElement *)element {
    NSAssert(element, @"The element cannot be empty");
    
    UITableView *view = nil;
    NSString *style = [element valueForAttribute:@"style"];
    if ([style isEqualToString:@"group"]) {
        view = [[[view class] alloc] initWithStyle:UITableViewStyleGrouped];
    }else {
        view = [[[view class] alloc] initWithStyle:UITableViewStylePlain];
    }
    return view;
}

@end
