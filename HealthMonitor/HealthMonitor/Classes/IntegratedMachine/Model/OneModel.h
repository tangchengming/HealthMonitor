//
//  OneModel.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/28.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OneModel : NSObject
//时间
@property (copy, nonatomic) NSString * measureTime;
//身高
@property (copy, nonatomic) NSString * bmi_height;
//体重
@property (copy, nonatomic) NSString * bmi_weight;
//bmi
@property (copy, nonatomic) NSString * bmi_BMI;
//收缩压
@property (copy, nonatomic) NSString * bp_sbp;
//舒张压
@property (copy, nonatomic) NSString * bp_dbp;
//脉搏
@property (copy, nonatomic) NSString * bp_hr;
//体脂肪量
@property (copy, nonatomic) NSString * bf_fm;
//体脂肪率
@property (copy, nonatomic) NSString * bf_fp;
//除脂肪量
@property (copy, nonatomic) NSString * bf_lbm;
//体水分量
@property (copy, nonatomic) NSString * bf_tbw;
//体水分率
@property (copy, nonatomic) NSString * bf_tbwc;
//体骨骼量
@property (copy, nonatomic) NSString * bf_sm;
//体肌肉量
@property (copy, nonatomic) NSString * bf_mm;
//细胞外液
@property (copy, nonatomic) NSString * bf_ecf;
//细胞内液
@property (copy, nonatomic) NSString * bf_icf;
//蛋白质量
@property (copy, nonatomic) NSString * bf_protein;
//矿物质量
@property (copy, nonatomic) NSString * bf_minerals;
//其他成分
@property (copy, nonatomic) NSString * bf_other;
//基础代谢
@property (copy, nonatomic) NSString * bf_bmr;
//脂肪调节
@property (copy, nonatomic) NSString * bf_fmAdjus;
//肌肉调节
@property (copy, nonatomic) NSString * bf_mmAdjus;
//氧饱和度
@property (copy, nonatomic) NSString * bo_os;
//血糖
@property (copy, nonatomic) NSString * bs_value;
//体温
@property (copy, nonatomic) NSString * temp_tempv;

@end
