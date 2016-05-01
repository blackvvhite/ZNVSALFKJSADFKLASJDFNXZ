//
//  UICollectionView+XLayout.h
//  XLayout
//
//  Created by B&W on 16/4/29.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (XLayout)

@property (nonatomic, copy) NSString *minimumLineSpacing;
@property (nonatomic, copy) NSString *minimumInteritemSpacing;
@property (nonatomic, copy) NSString *itemSize;
@property (nonatomic, copy) NSString *scrollDirection;
@property (nonatomic, copy) NSString *headerReferenceSize;
@property (nonatomic, copy) NSString *footerReferenceSize;
@property (nonatomic, copy) NSString *sectionInset;

@end
