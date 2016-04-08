//
//  SMBaseModel.m
//  SunMoFruit
//
//  Created by 猎人 on 16/1/20.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import "SMBaseModel.h"
#import <MJExtension.h>

@implementation SMBaseModel

- (id)initContentWithDic:(NSDictionary *)json {

    self = [SMBaseModel mj_objectWithKeyValues:json];
    return self;
}
@end
