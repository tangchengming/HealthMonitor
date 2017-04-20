//
//  Ecg_structureModel.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/20.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ecg_structureModel : NSObject


@property (nonatomic, strong) NSArray *Datas;//返回数据信息列表

/** 心律 */
@property (nonatomic, copy) NSString   *avr_heartrate;

/** 检测时间 */
@property (nonatomic, copy) NSString   *collectdate;

/** ST段 */
@property (nonatomic, copy) NSString   *stisnormal;

/** 心率是否失常 */
@property (nonatomic, copy) NSString   *isarrhythmia;

/** 波形质量 */
@property (nonatomic, copy) NSString   *waveform;

/** 心率快慢 */
@property (nonatomic, copy) NSString   *heartrate;

/** 整体波形 */
@property (nonatomic, copy) NSString   *wholewave;

/** 波形图片字符串 需要转成图片  Base64字符串转UIImage图片*/
@property (nonatomic, copy) NSString   *picturedata;

@end
