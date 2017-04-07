//
//  User.m
//  XHApp
//
//  Created by chenhe on 16/6/16.
//  Copyright © 2016年 THkeji. All rights reserved.
//

#import "User.h"
#import "CZUserDefalt.h"

@implementation User


/*
 *  用户信息
 */
-(instancetype)init{
    self = [super init];
    _idUser = [CZUserDefalt readDataWithKey:@"idUser"];
    _iconURL = [CZUserDefalt readDataWithKey:@"iconURL"];
    _nameUser = [CZUserDefalt readDataWithKey:@"nameUser"];
    _VerificationCode = [CZUserDefalt readDataWithKey:@"VerificationCode"];
    _phoneNumber = [CZUserDefalt readDataWithKey:@"phoneNumber"];
    
    _experienceUser = [CZUserDefalt readDataWithKey:@"experience"];
    _integralUser = [CZUserDefalt readDataWithKey:@"integral"];
    
    NSString *sex = [CZUserDefalt readDataWithKey:@"sex"];
    if ([sex isEqualToString:@"2"]) {
        _sex = @"男";
    }else{
        _sex = @"女";
    }
    _lock = [CZUserDefalt readDataWithKey:@"lock"];

    _introduction = [CZUserDefalt readDataWithKey:@"introduction"];
    _birthday = [CZUserDefalt readDataWithKey:@"birthday"];

    
    return self;
}

@end
