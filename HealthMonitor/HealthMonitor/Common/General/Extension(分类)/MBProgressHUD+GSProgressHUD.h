//
//  MainTabbarViewController.m
//  ELHome
//
//  Created by Atohuyo on 2016/11/17.
//  Copyright © 2016年 Atohuyo. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (GSProgressHUD)
+ (void)showSuccess:(NSString *)success;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

+ (void)showError:(NSString *)error;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message;
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;

+ (void)hideHUD;
+ (void)hideHUDForView:(UIView *)view;

+ (void)showAlertMessage:(NSString *)alert;

@end
