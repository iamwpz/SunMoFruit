//
//  SMYouXuanModel.h
//  SunMoFruit
//
//  Created by 猎人 on 16/1/20.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMBaseModel.h"

@interface SMYouXuanModel : SMBaseModel

/**
 * 水果ID
 */
@property (nonatomic, assign) int fruitsId;
/**
 * 水果名称
 */
@property (nonatomic, copy) NSString *goodsName;
/**
 * 商品图片
 */
@property (nonatomic, copy) NSString *goodsPath;
/**
 * 水果价格
 */
@property (nonatomic, assign) double fruitsPrice;
/**
 * 水果详细信息接口
 */
@property (nonatomic, copy) NSString *goodsDetailPath;
/**
 * 每份重量
 */
@property (nonatomic, copy) NSString *fruitsStandard;
/**
 * 水果描述信息
 */
@property (nonatomic, copy) NSString *fruitsDescribe;
/**
 * 打折信息
 */
@property (nonatomic, copy) NSString *discountDescribe;
//- (NSString *)description;
@end
