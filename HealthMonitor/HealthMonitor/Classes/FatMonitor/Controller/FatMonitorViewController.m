//
//  FatMonitorViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/17.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "FatMonitorViewController.h"
#import "FatMonitorModel.h"
@interface FatMonitorViewController ()
@property (weak, nonatomic) IBOutlet UIView *UserView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UIButton *ChartBtn;//折线按钮
@property (weak, nonatomic) IBOutlet UIButton *ListBtn;//列表按钮
@property (weak, nonatomic) IBOutlet UIButton *FatBtn;//脂肪含量btn
@property (weak, nonatomic) IBOutlet UIButton *BmiBtn;//体质指数btn
@property (weak, nonatomic) IBOutlet UIButton *BmrBtn;//基础代谢btn
@property (weak, nonatomic) IBOutlet UIButton *weekBtn;//周
@property (weak, nonatomic) IBOutlet UIButton *MonthBtn;//月
@property (weak, nonatomic) IBOutlet PNLineChartView *lineChartView;



@end

@implementation FatMonitorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




//折线
- (IBAction)ChartButton:(UIButton *)sender {
}

//列表
- (IBAction)ListButton:(UIButton *)sender {
}

//脂肪含量
- (IBAction)FatButton:(UIButton *)sender {
}

//体质指数
- (IBAction)BmiButton:(UIButton *)sender {
}

//基础代谢
- (IBAction)BmrButton:(UIButton *)sender {
}

//周
- (IBAction)WeekButton:(UIButton *)sender {
}

//月
- (IBAction)MonthButton:(UIButton *)sender {
}

//用户
- (IBAction)UserBtn:(UIButton *)sender {
}


- (IBAction)BackBtn:(UIButton *)sender {
    
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
