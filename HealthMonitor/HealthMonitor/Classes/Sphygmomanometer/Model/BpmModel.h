//
//  BpmModel.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/20.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BpmModel : NSObject
/** 检测时间 */
@property (nonatomic, copy) NSString   *createTime;
/** 成员id */
@property (nonatomic, copy) NSString   *member_id;

/** 低压 */
@property (nonatomic, copy) NSString   *low;
/** 高压 */
@property (nonatomic, copy) NSString   *high;

/** 心率 */
@property (nonatomic, copy) NSString   *heart;
@end
