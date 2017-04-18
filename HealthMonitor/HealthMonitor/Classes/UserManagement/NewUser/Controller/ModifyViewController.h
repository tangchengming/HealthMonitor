//
//  ModifyViewController.h
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/17.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserInfoModel.h"
@interface ModifyViewController : UIViewController
@property (strong, nonatomic) UserInfoModel *userModel;
/** 生日 */
@property (nonatomic, copy) NSString   *birth;



/** 名字名 */
@property (nonatomic, copy) NSString   *name;

/** 性别 */
@property (nonatomic, assign)int sex;

@end
