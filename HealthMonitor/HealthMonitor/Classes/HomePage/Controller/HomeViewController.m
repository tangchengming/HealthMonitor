//
//  HomeViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/7.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "HomeViewController.h"
#import "UserViewController.h"
#import "EarMeasureViewController.h"
#import "WeighViewController.h"
#import "MeasureViewController.h"
#import "Blood_ViewController.h"
#import "PulseMeterViewController.h"
#import "AlkBGMViewController.h"
#import "FatMonitorViewController.h"
#import "Ecg_ViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//跳转用户管理
- (IBAction)UserBtn:(UIButton *)sender {
    
    // 获取指定的Storyboard，name填写Storyboard的文件名
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"User" bundle:nil];
    // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
    UserViewController *UserVC = [storyboard instantiateViewControllerWithIdentifier:@"UserVC"];
    [self presentViewController:UserVC animated:YES completion:nil];
    
    
    
    
}
//跳转耳温计
- (IBAction)EarBtn:(UIButton *)sender {
    
    // 获取指定的Storyboard，name填写Storyboard的文件名
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Ear" bundle:nil];
    // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
    EarMeasureViewController *EarVC = [storyboard instantiateViewControllerWithIdentifier:@"EarVC"];
    [self presentViewController:EarVC animated:YES completion:nil];

}

//跳转脂肪称
- (IBAction)FatScaleBtn:(UIButton *)sender {
    
    // 获取指定的Storyboard，name填写Storyboard的文件名
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"FatScale" bundle:nil];
    // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
    WeighViewController *FatScaleVC = [storyboard instantiateViewControllerWithIdentifier:@"FatScaleVC"];
    [self presentViewController:FatScaleVC animated:YES completion:nil];

    
    
}

//跳转血压计
- (IBAction)SphyBtn:(UIButton *)sender {
    
    // 获取指定的Storyboard，name填写Storyboard的文件名
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"BPM" bundle:nil];
    // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
    MeasureViewController *BPMVC = [storyboard instantiateViewControllerWithIdentifier:@"BPMVC"];
    [self presentViewController:BPMVC animated:YES completion:nil];

}

//跳转血糖仪
- (IBAction)BloodBtn:(UIButton *)sender {
    
    // 获取指定的Storyboard，name填写Storyboard的文件名
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"BGM" bundle:nil];
    // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
    Blood_ViewController *BgmVC = [storyboard instantiateViewControllerWithIdentifier:@"BGMVC"];
    [self presentViewController:BgmVC animated:YES completion:nil];

}

//跳转脉搏仪
- (IBAction)pulseBtn:(UIButton *)sender {
    
    // 获取指定的Storyboard，name填写Storyboard的文件名
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Pulse" bundle:nil];
    // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
    PulseMeterViewController *PulseVC = [storyboard instantiateViewControllerWithIdentifier:@"PulseVC"];
    [self presentViewController:PulseVC animated:YES completion:nil];

}

//跳转爱立康
- (IBAction)ALKbtn:(UIButton *)sender {
    
    // 获取指定的Storyboard，name填写Storyboard的文件名
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Alk" bundle:nil];
    // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
    AlkBGMViewController *AlkVC = [storyboard instantiateViewControllerWithIdentifier:@"AlkVC"];
    [self presentViewController:AlkVC animated:YES completion:nil];

}

//跳转脂肪仪
- (IBAction)FatBtn:(UIButton *)sender {
    
    // 获取指定的Storyboard，name填写Storyboard的文件名
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Fat" bundle:nil];
    // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
    FatMonitorViewController *FatVC = [storyboard instantiateViewControllerWithIdentifier:@"FatVC"];
    [self presentViewController:FatVC animated:YES completion:nil];

}

//跳转心电监测
- (IBAction)ECGBtn:(UIButton *)sender {
    
     //获取指定的Storyboard，name填写Storyboard的文件名
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"ECG" bundle:nil];
    // 从Storyboard上按照identifier获取指定的界面（VC），identifier必须是唯一的
    Ecg_ViewController *EcgVC = [storyboard instantiateViewControllerWithIdentifier:@"ECGVC"];
    [self presentViewController:EcgVC animated:YES completion:nil];

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
