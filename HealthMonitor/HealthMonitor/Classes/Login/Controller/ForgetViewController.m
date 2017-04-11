//
//  ForgetViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/6.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "ForgetViewController.h"

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



- (IBAction)registAndLoginBtn:(UIButton *)sender {
}

- (IBAction)codeBtn:(UIButton *)sender {
}

- (IBAction)backBtn:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
