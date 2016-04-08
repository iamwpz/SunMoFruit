//
//  GDYXCollectionViewCell.h
//  SunMoFruit
//
//  Created by 猎人 on 16/1/19.
//  Copyright © 2016年 hunter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMYouXuanModel.h"
@interface GDYXCollectionViewCell : UICollectionViewCell
/**
 * 果兜优选每个水果信息
 */
@property (strong, nonatomic) SMYouXuanModel *gdyxModel;
@end
