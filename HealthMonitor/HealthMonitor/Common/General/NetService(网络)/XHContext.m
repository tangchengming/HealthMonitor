//
//  XHContext.m
//  XHApp
//
//  Created by chenhe on 16/6/2.
//  Copyright © 2016年 THkeji. All rights reserved.
//

#import "XHContext.h"
#import <UIKit/UIKit.h>
#import "CZUserDefalt.h"

@implementation XHContext

//单例创建
+(instancetype)sharedInstance{
    static XHContext *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[XHContext alloc]init];
    });
    [sharedInstance readUserDefaltInfo];
    return sharedInstance;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

//读取信息
-(void)readUserDefaltInfo {
    //self.code = @"";
    self.isLogin =   [CZUserDefalt readDataWithKey:@"loginStatus"];;
    //用户类型
    NSString *type = [CZUserDefalt readDataWithKey:@"typeUser"];
//    if (type) {
//        self.userType = type;
//    }else{
//        self.userType = @"1";
//    }
    self.userType = type;
    
    //版本信息
    NSDictionary *dicInfo = [[NSBundle mainBundle] infoDictionary];
    _appVersion = [dicInfo objectForKey:@"CFBundleShortVersionString"];
    self.user = [[User alloc]init];
    
}


-(void)logout{
    [CZUserDefalt removeAllData];
}



@end
