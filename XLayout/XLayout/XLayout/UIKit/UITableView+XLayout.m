//
//  UITableView+XLayout.m
//  XLayout
//
//  Created by B&W on 16/4/29.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "UITableView+XLayout.h"
#import "UIView+XLayout.h"
#import "ONOXMLDocument.h"

@implementation UITableView (XLayout)

+ (instancetype)viewWithXMLElementObject:(ONOXMLElement *)element {
    NSAssert(element, @"The element cannot be empty");
    id view = nil;
    NSString *style = [element valueForAttribute:@"style"];
    if ([style isEqualToString:@"group"]) {
        view = [[NSClassFromString(element.tag) alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }else {
        view = [[NSClassFromString(element.tag) alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    return view;
}

- (void)setEventHandler:(id)eventHandler {
    self.dataSource = eventHandler;
    self.delegate = eventHandler;
}

@end
