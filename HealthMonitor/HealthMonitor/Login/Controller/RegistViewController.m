//
//  RegistViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/6.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIView *codeView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextFiled;
@property (weak, nonatomic) IBOutlet UITextField *codeTextFiled;
@property (weak, nonatomic) IBOutlet UIButton *codeButton;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置边框
    [LayerCoreRadius setUpBorder:self.phoneView];
    [LayerCoreRadius setUpBorder:self.passwordView];
    [LayerCoreRadius setUpBorder:self.codeView];
    [LayerCoreRadius setUpBorder:self.loginBtn];
    

   


}



- (IBAction)registAndLoginBtn:(UIButton *)sender {
}

- (IBAction)codeBtn:(UIButton *)sender {
    
    [self code];
}

- (IBAction)backBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void)code{

    __block int time = 10;
    
    self.codeButton.enabled = NO;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(time<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                 [self.codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
                self.codeButton.enabled = YES;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                
                NSString *strTime = [NSString stringWithFormat:@"获取验证码(%d)",time];
                [self.codeButton setTitle:strTime forState:UIControlStateNormal];
                self.codeButton.titleLabel.textColor = [UIColor yellowColor];
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
