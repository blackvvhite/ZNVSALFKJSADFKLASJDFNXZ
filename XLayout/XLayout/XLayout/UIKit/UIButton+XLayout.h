//
//  UIButton+XLayout.h
//  XLayout
//
//  Created by B&W on 16/4/28.
//  Copyright © 2016年 B&W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XLayout)

@property (nonatomic, weak, readonly) NSString *n_title;
@property (nonatomic, weak, readonly) NSString *h_title;
@property (nonatomic, weak, readonly) NSString *s_title;

@property (nonatomic, weak, readonly) UIColor *nt_color;
@property (nonatomic, weak, readonly) UIColor *ht_color;
@property (nonatomic, weak, readonly) UIColor *st_color;

@property (nonatomic, weak, readonly) UIImage *n_image;
@property (nonatomic, weak, readonly) UIImage *h_image;
@property (nonatomic, weak, readonly) UIImage *s_image;

@property (nonatomic, weak, readonly) UIImage *nb_image;
@property (nonatomic, weak, readonly) UIImage *hb_image;
@property (nonatomic, weak, readonly) UIImage *sb_image;

@property (nonatomic, copy, readonly) NSString *onClick;

@end
