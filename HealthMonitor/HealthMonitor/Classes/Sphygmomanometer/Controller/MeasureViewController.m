//
//  MeasureViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/13.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "MeasureViewController.h"

@interface MeasureViewController ()
@property (weak, nonatomic) IBOutlet UIView *UserView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;

@property (weak, nonatomic) IBOutlet UILabel *highLabel;
@property (weak, nonatomic) IBOutlet UILabel *hLabel;

@property (weak, nonatomic) IBOutlet UILabel *lowLabel;
@property (weak, nonatomic) IBOutlet UILabel *lLabel;

@property (weak, nonatomic) IBOutlet UILabel *heartLabel;
@property (weak, nonatomic) IBOutlet UILabel *heLabel;

@property (weak, nonatomic) IBOutlet UIView *MIView;

@property (weak, nonatomic) IBOutlet UIImageView *bluetoothImageView;

@end

@implementation MeasureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}








- (IBAction)ceshiBtn:(UIButton *)sender {
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
