//
//  UserInfoModel.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/17.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

/*
 flag = 1;
 listMemberlist =     (
 {
 avatar = "front/images/tp1.png";
 avatarFile = "<null>";
 birth = "1998-10-09";
 cardId = "<null>";
 height = 187;
 level = "<null>";
 "member_id" = 21;
 name = 123;
 sex = 0;
 userId = 2;
 weight = "<null>";
 },
 {
 avatar = "front/images/tp1.png";
 avatarFile = "<null>";
 birth = "1993-09-09";
 cardId = "<null>";
 height = 175;
 level = "<null>";
 "member_id" = 22;
 name = 123;
 sex = 0;
 userId = 2;
 weight = "<null>";
 }
 );
 */


#import <Foundation/Foundation.h>

@interface UserInfoModel : NSObject

@property (nonatomic, strong) NSArray *listMemberlist;//返回数据信息列表

/** 生日 */
@property (nonatomic, copy) NSString   *birth;

/** 成员id */
@property (nonatomic, copy) NSString   *member_id;

/** 用户ID */
@property (nonatomic, assign) NSString   *userId;

/** 主播名 */
@property (nonatomic, copy) NSString   *name;

/** 性别 */
@property (nonatomic, strong)NSNumber *sex;




@end
