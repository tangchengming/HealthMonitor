//
//  BloodModel.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/19.
//  Copyright © 2017年 Atohuyo. All rights reserved.
/*
 
 beg = 0;
 cardId = 8e0de850;
 count = 22;
 "listBlood_pressure" =     (
 {
 adddate = "2017-03-30 14:10:34";
 apptype = BloodPressureV1;
 bloodPressureId = 2;
 cardId = 8e0de850;
 collectdate = "2017-03-30 13:53:10";
 dataId = 32snXE9QRkg;
 datakey = 02000000003220023605030116472001910000000000008e0de850;
 diastolicpressure = 63;
 entAccount = TestTwo;
 gatewayId = 32200236;
 listBp = "<null>";
 pulse = 91;
 synced = 1;
 systolicpressure = 102;
 }
 */

#import <Foundation/Foundation.h>

@interface BloodModel : NSObject

@property (nonatomic, strong) NSArray *listBlood_pressure;//返回数据信息列表

/** 心律 */
@property (nonatomic, copy) NSString   *pulse;

/** 时间 */
@property (nonatomic, copy) NSString   *collectdate;

/** 低压 */
@property (nonatomic, copy) NSString   *diastolicpressure;

/** 高压 */
@property (nonatomic, copy) NSString   *systolicpressure;



@end
