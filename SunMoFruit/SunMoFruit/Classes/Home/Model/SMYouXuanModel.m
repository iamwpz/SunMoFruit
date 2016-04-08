//
//  SMYouXuanModel.m
//  SunMoFruit
//
//  Created by 猎人 on 16/1/20.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "SMYouXuanModel.h"

@implementation SMYouXuanModel
- (NSString *)description {
    return [NSString stringWithFormat:@"水果ID:%d, 水果名称:%@, 商品图片:%@, 水果价格:%f, 水果详细信息接口:%@, 每份重量:%@",self.fruitsId, self.goodsName, self.goodsPath, self.fruitsPrice, self.goodsDetailPath, self.fruitsStandard];
}
@end
