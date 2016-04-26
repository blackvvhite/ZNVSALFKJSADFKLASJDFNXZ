//
//  XMLRelativeLayoutProtocol.h
//  XMLayout
//
//  Created by admin on 16/4/26.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XMLRelativeLayoutProtocol <NSObject>


#pragma mark - 相对于给定ID控件

/// 将该控件的底部置于给定ID的控件之上
@property (nonatomic, copy) NSString *layout_above;

/// 将该控件的顶部置于给定ID的控件之下
@property (nonatomic, copy) NSString *layout_below;

/// 将该控件的左边缘与给定ID的控件左边缘对齐
@property (nonatomic, copy) NSString *layout_toLeftOf;

/// 将该控件的右边缘与给定ID的控件右边缘对齐
@property (nonatomic, copy) NSString *layout_toRightOf;

/// 将该控件的baseline与给定ID的baseline对齐
@property (nonatomic, copy) NSString *layout_alignBaseline;

/// 将该控件的顶部边缘与给定ID的顶部边缘对齐
@property (nonatomic, copy) NSString *layout_alignTop;

/// 将该控件的底部边缘与给定ID的底部边缘对齐
@property (nonatomic, copy) NSString *layout_alignBottom;

/// 将该控件的左边缘与给定ID的左边缘对齐
@property (nonatomic, copy) NSString *layout_alignLeft;

/// 将该控件的右边缘与给定ID的右边缘对齐
@property (nonatomic, copy) NSString *layout_alignRight;

#pragma mark - 相对于父组件

/// 如果为true,将该控件的顶部与其父控件的顶部对齐;
@property (nonatomic, copy) NSString *layout_alignParentTop;

/// 如果为true,将该控件的底部与其父控件的底部对齐
@property (nonatomic, copy) NSString *layout_alignParentBottom;

/// 如果为true,将该控件的左部与其父控件的左部对齐
@property (nonatomic, copy) NSString *layout_alignParentLeft;

/// 如果为true,将该控件的右部与其父控件的右部对齐
@property (nonatomic, copy) NSString *layout_alignParentRight;

#pragma mark - 居中

/// 如果为true,将该控件的置于水平居中
@property (nonatomic, copy) NSString *layout_centerHorizontal;

/// 如果为true,将该控件的置于垂直居中
@property (nonatomic, copy) NSString *layout_centerVertical;

/// 如果为true,将该控件的置于父控件的中央
@property (nonatomic, copy) NSString *layout_centerInParent;

@end
