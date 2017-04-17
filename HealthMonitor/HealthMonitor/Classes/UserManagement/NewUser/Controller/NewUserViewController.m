//
//  NewUserViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/11.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "NewUserViewController.h"

@interface NewUserViewController ()
@property (weak, nonatomic) IBOutlet UIView *NameView;
@property (weak, nonatomic) IBOutlet UITextField *NameTextField;

@property (weak, nonatomic) IBOutlet UIView *SexView;
@property (weak, nonatomic) IBOutlet UILabel *SexLabel;

@property (weak, nonatomic) IBOutlet UIView *AgeView;
@property (weak, nonatomic) IBOutlet UILabel *AgeLabel;


@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UITextField *cardTextField;

@property (weak, nonatomic) IBOutlet UIButton *SaveBtn;

@end

@implementation NewUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)SaveButton:(UIButton *)sender {
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
