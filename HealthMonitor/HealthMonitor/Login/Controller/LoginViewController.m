//
//  LoginViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/5.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled;
@property (weak, nonatomic) IBOutlet UIView *RegistView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager];
    keyboardManager.shouldResignOnTouchOutside = YES;
    //关闭toolbar
    keyboardManager.enableAutoToolbar = NO;
    
    //网络请求
    [self setNetWorkData];
    
    //设置边框
    [LayerCoreRadius setUpBorder:self.phoneView];
    [LayerCoreRadius setUpBorder:self.passwordView];
    [LayerCoreRadius setUpBorder:self.loginBtn];
    
   
}




- (IBAction)loginBtn:(UIButton *)sender {
    
    if ([self.phoneTextFiled.text isEqualToString: @""]  || [self.passwordTextFiled.text isEqualToString: @""]) {
       
        [MBProgressHUD showMessage:@"手机号或密码不能为空" toView:self.view afterDelty:1.0];
        return;
    }
    if (![ ValidateHelper validateMobile1:self.phoneTextFiled.text]) {
        
        [MBProgressHUD showMessage:@"手机号或密码输入错误" toView:self.view afterDelty:1.0];
        return;
    }
    if (![ValidateHelper validatePassword:self.passwordTextFiled.text]) {
       
        [MBProgressHUD showMessage:@"手机号或密码输入错误" toView:self.view afterDelty:1.0];
        
        return;
    }
    
    
}

- (void) setNetWorkData {
    
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    param[@"userName"] = self.phoneTextFiled.text;
    param[@"userPassword"] = self.passwordTextFiled.text;
    
   
    
    
    [RequestManager httpRequestPOST:Request_Method_Login parameters:param success:^(id responseObject) {
        
        NSLog(@"数据：%@",responseObject);
        if ([[responseObject objectForKey:@"flag"]integerValue]) {
            
            [MBProgressHUD showMessage:@"登录成功" toView:self.view afterDelty:1.0];

        }else{
            
           
            [MBProgressHUD showMessage:@"手机号或密码输入错误" toView:self.view afterDelty:1.0];

            
        }
    } failure:^(NSError *error) {
        
    }];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
