//
//  OneTableViewCell.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/28.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;//时间
//身高
@property (weak, nonatomic) IBOutlet UILabel *SGLabel;

//体重
@property (weak, nonatomic) IBOutlet UILabel *TZLabel;

//bmi
@property (weak, nonatomic) IBOutlet UILabel *BMILabel;

//收缩压
@property (weak, nonatomic) IBOutlet UILabel *SSYLabel;

//舒张压
@property (weak, nonatomic) IBOutlet UILabel *SZYLabel;

//脉搏
@property (weak, nonatomic) IBOutlet UILabel *MBLabel;

//体脂含量
@property (weak, nonatomic) IBOutlet UILabel *TZFLabel;

//体脂肪率
@property (weak, nonatomic) IBOutlet UILabel *TZFLLabel;

//除脂肪量
@property (weak, nonatomic) IBOutlet UILabel *CZFLLabel;

//体水分量
@property (weak, nonatomic) IBOutlet UILabel *TSFLabel;

//体水分率
@property (weak, nonatomic) IBOutlet UILabel *TSFLLabel;

//体骨骼量
@property (weak, nonatomic) IBOutlet UILabel *TGGLLabel;

//体肌肉量
@property (weak, nonatomic) IBOutlet UILabel *TJRLLabel;

//细胞外液
@property (weak, nonatomic) IBOutlet UILabel *XBWYLabel;

//细胞内液
@property (weak, nonatomic) IBOutlet UILabel *XBNYLabel;

//蛋白质量
@property (weak, nonatomic) IBOutlet UILabel *DBZLLabel;

//矿物质量
@property (weak, nonatomic) IBOutlet UILabel *KWZLLabel;

//其他成分
@property (weak, nonatomic) IBOutlet UILabel *QTCFLabel;

//基础代谢
@property (weak, nonatomic) IBOutlet UILabel *JCDXLabel;

//脂肪调节
@property (weak, nonatomic) IBOutlet UILabel *ZFTJLabel;

//肌肉调节
@property (weak, nonatomic) IBOutlet UILabel *JRTJLabel;

//氧饱和度
@property (weak, nonatomic) IBOutlet UILabel *YBHDLabel;

//血糖
@property (weak, nonatomic) IBOutlet UILabel *XTLabel;

//体温
@property (weak, nonatomic) IBOutlet UILabel *TWLabel;






@end
