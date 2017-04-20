//
//  PulseMeterModel.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/20.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PulseMeterModel : NSObject

@property (nonatomic, strong) NSArray *Datas;//返回数据信息列表


/** 检测时间 */
@property (nonatomic, copy) NSString   *collectdate;

/** 脉搏 */
@property (nonatomic, copy) NSString   *pulse;

/** 血氧 */
@property (nonatomic, copy) NSString   *oxygen;




@end
