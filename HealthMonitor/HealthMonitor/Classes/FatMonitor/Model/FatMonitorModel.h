//
//  FatMonitorModel.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/20.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FatMonitorModel : NSObject

@property (nonatomic, strong) NSArray *Datas;//返回数据信息列表



/** 检测时间 */
@property (nonatomic, copy) NSString   *collectdate;

/** 胖瘦 */
@property (nonatomic, copy) NSString   *bodytype;

/** 脂肪含量 */
@property (nonatomic, copy) NSString   *fatcontent;

/** 体质指数 */
@property (nonatomic, copy) NSString   *bmi;

/** 基础代谢值 */
@property (nonatomic, copy) NSString   *bmr;




@end
