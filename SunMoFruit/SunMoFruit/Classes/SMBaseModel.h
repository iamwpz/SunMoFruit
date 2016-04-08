//
//  SMBaseModel.h
//  SunMoFruit
//
//  Created by 猎人 on 16/1/20.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMBaseModel : NSObject

// json数据转模型
- (id)initContentWithDic:(NSDictionary *)json;

@end
