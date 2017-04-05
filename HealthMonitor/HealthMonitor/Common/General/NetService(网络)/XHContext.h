//
//  XHContext.h
//  XHApp
//
//  Created by chenhe on 16/6/2.
//  Copyright © 2016年 THkeji. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "UIViewController+TopBarMessage.h"
#import "User.h"

#define Context [XHContext sharedInstance]

#define TOPMESSAGEBAR  //切换信息提示样式

typedef void(^CompleteBlock)(BOOL done);


@interface XHContext : NSObject


@property (nonatomic,assign) NSString *isLogin;                                  //是否登录
@property (nonatomic,assign) BOOL cancelLogin;                              //取消了登录，用于自动跳页。


@property (nonatomic,strong) NSString *code;                                //会话id
@property (nonatomic,strong) NSString *appVersion;                          //app版本

@property (nonatomic,strong) NSString *userType;                            //用户类型

@property (nonatomic,strong) User *user;//用户信息类



+(instancetype)sharedInstance;

//退出登录
-(void)logout;
@end
