//
//  ModifyViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/17.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "ModifyViewController.h"

@interface ModifyViewController ()
@property (weak, nonatomic) IBOutlet UIView *NameView;
@property (weak, nonatomic) IBOutlet UITextField *NameTextField;

@property (weak, nonatomic) IBOutlet UIView *SexView;
@property (weak, nonatomic) IBOutlet UILabel *SexLabel;

@property (weak, nonatomic) IBOutlet UIView *AgeView;
@property (weak, nonatomic) IBOutlet UILabel *AgeLabel;


@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UITextField *cardTextField;

@property (weak, nonatomic) IBOutlet UIButton *SaveBtn;

//@property (strong, nonatomic) NSString *sex;
@end

@implementation ModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _NameTextField.placeholder = _name;
    if (_sex == 1) {
        _SexLabel.text = @"男";
    }else{
        _SexLabel.text = @"女";
    }

    _AgeLabel.text = _birth;
    
    NSLog(@"名字：%@  性别：%d  年纪：%@",_name,_sex,_birth);
    
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
