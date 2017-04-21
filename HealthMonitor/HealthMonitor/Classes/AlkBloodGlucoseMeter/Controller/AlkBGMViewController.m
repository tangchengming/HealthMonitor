//
//  AlkBGMViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/11.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "AlkBGMViewController.h"

@interface AlkBGMViewController ()
@property (weak, nonatomic) IBOutlet UIView *UserView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;

@property (weak, nonatomic) IBOutlet UIView *highView;
@property (weak, nonatomic) IBOutlet UILabel *highLabel;

@property (weak, nonatomic) IBOutlet UIView *lowView;
@property (weak, nonatomic) IBOutlet UILabel *lowLabel;

@property (weak, nonatomic) IBOutlet UIView *heartView;
@property (weak, nonatomic) IBOutlet UILabel *heartLabel;

@end

@implementation AlkBGMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

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
