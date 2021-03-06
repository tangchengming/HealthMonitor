//
//  ECG_DetailsViewController.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/12.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ECG_DetailsViewController : UIViewController
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
