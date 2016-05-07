//
//  SMVarityGoodsModel.h
//  SunMoFruit
//
//  Created by 猎人 on 16/5/7.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "SMBaseModel.h"

@interface SMVarityGoodsModel : SMBaseModel
/**
 * 坚果ID
 */
@property (nonatomic, assign) int nutId;
/**
 * 坚果名称
 */
@property (nonatomic, copy) NSString *goodsName;
/**
 * 商品图片
 */
@property (nonatomic, copy) NSString *goodsPath;
/**
 * 坚果价格
 */
@property (nonatomic, assign) double nutPrice;
/**
 * 坚果详细信息接口
 */
@property (nonatomic, copy) NSString *goodsDetailPath;
/**
 * 每份重量
 */
@property (nonatomic, copy) NSString *nutStandard;
/**
 * 坚果描述信息
 */
@property (nonatomic, copy) NSString *nutDescribe;
/**
 * 打折信息
 */
@property (nonatomic, copy) NSString *discountDescribe;

@end
