//
//  GRBHomeHeadPageView.h
//  GuoRenBao
//
//  Created by LiYan on 15/12/9.
//  Copyright © 2015年 LiYan. All rights reserved.
//  创建者：李炎

#import <UIKit/UIKit.h>

@interface GRBHomeHeadPageView : UIView

+(instancetype)pageViewWithFrame:(CGRect)frame;

// 图片的url数组
@property (nonatomic,strong)NSArray *urlArray;


@end
