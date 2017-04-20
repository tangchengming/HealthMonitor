//
//  BgmModel.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/20.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BgmModel : NSObject
/** 检测时间 */
@property (nonatomic, copy) NSString   *collectdate;

/** 血糖含量 */
@property (nonatomic, copy) NSString   *bloodsugar;
@end
