//
//  ValidateHelper.h
//  MommySecure
//
//  Created by ShinSoft on 14-6-26.
//  Copyright (c) 2014年 shinsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidateHelper : NSObject

//邮箱
+ (BOOL) validateEmail:(NSString *)email;
//手机号码验证
+ (BOOL) validateMobile1:(NSString *)mobile;
//车牌号验证
+ (BOOL) validateCarNo:(NSString *)carNo;
//车型
+ (BOOL) validateCarType:(NSString *)CarType;
//用户名
+ (BOOL) validateUserName:(NSString *)name;
//密码
+ (BOOL) validatePassword:(NSString *)passWord;
//昵称
+ (BOOL) validateNickname:(NSString *)nickname;
//身份证号
+ (BOOL) validateIdentityCardLength: (NSString *)identityCard;
/**
 * 功能:验证身份证是否合法
 * 参数:输入的身份证号
 */

+ (BOOL) validateIdentityCard:(NSString *) sPaperId;
//手机号码验证
+ (BOOL)validateMobile:(NSString *)mobileNum;


//银行卡
+ (BOOL) validateBankCardNumber: (NSString *)bankCardNumber;
//根据当前日期 作对比  返回日期
+ (NSString *)showWeekByDate:(NSString *)dateStr;
//和当前时间对比
+(NSString *) compareCurrentTime:(NSDate*) compareDate;
//去除两边空格的字符串
+(NSString *)getTextByTrim:(NSString *)string;

//md5加密
+(NSString *)md5HexDigest:(NSString *)inPutText;
//时间戳转时间
+(NSString *)getSince1970ToDate:(NSString *)dateStr;


@end
