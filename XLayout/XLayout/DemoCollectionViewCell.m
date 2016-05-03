//
//  DemoCollectionViewCell.m
//  XLayout
//
//  Created by B&W on 16/4/30.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import "DemoCollectionViewCell.h"
#import "UICollectionReusableView+XLayout.h"
#import "XLayoutViewService.h"

@implementation DemoCollectionViewCell

#pragma mark - Init

XLAYOUT_COLLECTION_VIEW_CELL_FROM_XML_NAME(@"collection_view_cell")

#pragma mark - Getter

- (UILabel *)label {
    return self.viewService.getViewById(@"label");
}


@end
