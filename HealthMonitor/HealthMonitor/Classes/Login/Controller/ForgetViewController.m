//
//  ForgetViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/6.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "ForgetViewController.h"
#import "HomeController.h"
@interface ForgetViewController ()
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIView *NewPasswordView1;
@property (weak, nonatomic) IBOutlet UIView *NewPasswordView2;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *codeTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled1;
@property (weak, nonatomic) IBOutlet UIButton *codeButton;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置边框
    [LayerCoreRadius setUpBorder:self.phoneView];
    [LayerCoreRadius setUpBorder:self.passwordView];
    [LayerCoreRadius setUpBorder:self.NewPasswordView1];
    [LayerCoreRadius setUpBorder:self.NewPasswordView2];
    [LayerCoreRadius setUpBorder:self.loginBtn];
}


//确认修改并登录
- (IBAction)registAndLoginBtn:(UIButton *)sender {
    
    if (![ValidateHelper validatePassword:self.passwordTextFiled.text]) {
        
        [MBProgressHUD showMessage:@"输入密码格式错误" toView:self.view afterDelty:1.0];
        
        return;
    }else if ([self.passwordTextFiled.text isEqualToString:self.passwordTextFiled1.text]){
    
        [self setNetWorkData];
    }
    
}



- (void) setNetWorkData {
    
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    param[@"userName"] = self.phoneTextFiled.text;
    param[@"userPassword"] = self.passwordTextFiled.text;
    
    
    
    
    [RequestManager httpRequestPOST:Request_Method_XGMM  parameters:param success:^(id responseObject) {
        
        NSLog(@"数据：%@",responseObject);
        if ([[responseObject objectForKey:@"flag"]integerValue]) {
            
            [MBProgressHUD showMessage:@"修改成功" toView:self.view afterDelty:1.0];
            
            UIStoryboard *storboard = self.storyboard;
            HomeController *home = [storboard instantiateViewControllerWithIdentifier:@"HomeVC"];
            [self presentViewController:home animated:YES completion:nil];
            
        }else{
            
            
            [MBProgressHUD showMessage:responseObject[@"msg"] toView:self.view afterDelty:1.0];
            
            
        }
    } failure:^(NSError *error) {
        
    }];
    
}




//发送验证码
- (IBAction)codeBtn:(UIButton *)sender {
    
    if (![ ValidateHelper validateMobile1:self.phoneTextFiled.text] || [self.phoneTextFiled.text isEqualToString: @""]) {
        
        [MBProgressHUD showMessage:@"手机号输入错误" toView:self.view afterDelty:1.0];
        return;
    }else{
    
        [self checkTel];
    }
    
    
}

//返回
- (IBAction)backBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//验证手机号码 是否被注册
- (void)checkTel{
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"tel"] = self.phoneTextFiled.text;
    
    
    [RequestManager httpRequestPOST:Request_Method_checkverify  parameters:param success:^(id responseObject) {
        
        
        if ([[responseObject objectForKey:@"flag"]integerValue]) {
            
            [self code];
            [self codeNet];
            
        }else{
            
            
            [MBProgressHUD showMessage:@"该手机号码已被注册" toView:self.view afterDelty:1.0];
            
            
        }
        
    } failure:^(NSError *error) {
        
    }];
}


//发送验证码
-(void)codeNet{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"tel"] = self.phoneTextFiled.text;
    //params[@"tel"] = @"18502846532";
    [RequestManager httpRequestPOST:Request_Method_getsmscode  parameters:params success:^(id responseObject) {
        
        [MBProgressHUD showSuccess:@"短信发送成功"];
        
        [CZUserDefalt writeDataWithKey:@"VerificationCode" andValue:responseObject[@"code"]];
        
        NSLog(@"验证码：%@",responseObject[@"code"]);
    } failure:^(NSError *error) {
        
    }];
    
}


//验证码倒计时
-(void)code{
    
    __block int time = 60;
    
    self.codeButton.enabled = NO;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(time<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.codeButton setTitle:@"重发验证码" forState:UIControlStateNormal];
                self.codeButton.enabled = YES;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                
                //NSString *strTime = [NSString stringWithFormat:@"获取验证码(%d)",time];
                [self.codeButton setTitle:[NSString stringWithFormat:@"获取验证码(%d)",time] forState:UIControlStateNormal];
                self.codeButton.titleLabel.textColor = [UIColor whiteColor];
            });
            time--;
        }
    });
    dispatch_resume(_timer);
    
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
