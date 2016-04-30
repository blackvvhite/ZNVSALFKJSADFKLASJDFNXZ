//
//  DemoCollectionViewCell.m
//  XLayout
//
//  Created by admin on 16/4/30.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "DemoCollectionViewCell.h"
#import "UICollectionReusableView+XLayout.h"
#import "XLayoutViewService.h"

@implementation DemoCollectionViewCell

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadViewFromXMLName:@"collection_view_cell"];
    }
    return self;
}

#pragma mark - Getter

- (UILabel *)label {
    return self.viewService.viewById(@"label");
}


@end
