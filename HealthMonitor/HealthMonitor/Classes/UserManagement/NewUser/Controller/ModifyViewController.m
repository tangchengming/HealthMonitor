//
//  ModifyViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/17.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "ModifyViewController.h"
#import "WSDatePickerView.h"
#import "UserViewController.h"
@interface ModifyViewController ()
@property (weak, nonatomic) IBOutlet UIView *NameView;
@property (weak, nonatomic) IBOutlet UITextField *NameTextField;

@property (weak, nonatomic) IBOutlet UIView *SexView;
@property (weak, nonatomic) IBOutlet UILabel *SexLabel;

@property (weak, nonatomic) IBOutlet UIView *AgeView;
@property (weak, nonatomic) IBOutlet UILabel *AgeLabel;

@property (weak, nonatomic) IBOutlet UIView *carView;
@property (weak, nonatomic) IBOutlet UITextField *carTextField;

@property (weak, nonatomic) IBOutlet UIView *SfzView;
@property (weak, nonatomic) IBOutlet UITextField *SfzTextField;


@property (weak, nonatomic) IBOutlet UIButton *SaveBtn;

@property (strong, nonatomic) NSString *sex1;
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


- (void)SexView1{
    
    /**
     *  添加手势：也就是当用户点击视图之后，对这个操作进行反应
     */
    
    
    //初始化一个手势
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(alterHeadPortrait:)];
    //给SexView添加手势
    [_SexView addGestureRecognizer:singleTap];
    
    //初始化一个手势
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(alterHeadPortrait1:)];
    //给SexView添加手势
    [_AgeView addGestureRecognizer:singleTap1];
}


//  方法：alterHeadPortrait
-(void)alterHeadPortrait:(UITapGestureRecognizer *)gesture{
    
    
    /**
     *  弹出提示框
     */
    //初始化提示框
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //按钮：从相册选择，类型：UIAlertActionStyleDefault
    [alert addAction:[UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        _SexLabel.text = @"男";
        _sex1 = @"1";
    }]];
    //按钮：拍照，类型：UIAlertActionStyleDefault
    [alert addAction:[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        
        _SexLabel.text = @"女";
        _sex1 = @"0";
        
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
}


-(void)alterHeadPortrait1:(UITapGestureRecognizer *)gesture{
    
    WSDatePickerView *datepicker = [[WSDatePickerView alloc] initWithDateStyle:DateStyleShowYearMonthDay CompleteBlock:^(NSDate *startDate) {
        NSString *date = [startDate stringWithFormat:@"yyyy-MM-dd"];
        
        _AgeLabel.text = date;
        
    }];
    datepicker.doneButtonColor = [UIColor orangeColor];//确定按钮的颜色
    [datepicker show];
    
}




- (void)setNetWorkData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userId"] = @"2";
    
    if ([self.NameTextField.text isEqualToString: @""]){
        
        params[@"name"] = _NameTextField.placeholder;
    }else{
        params[@"name"] = _NameTextField.text;
    }
    
    params[@"birth"] =  _AgeLabel.text;
    
    if ([_SexLabel.text isEqualToString:@"男"]) {
        params[@"sex"] = @"1";
    }else{
        params[@"sex"] = @"0";
    }
    
    [RequestManager httpRequestPOST:Request_Method_EditUser parameters:params success:^(id responseObject) {
        
        if ([[responseObject objectForKey:@"flag"]integerValue]){
            
            [MBProgressHUD showMessage:@"修改成功" toView:self.view afterDelty:1.0];
            
            //跳转
            UIStoryboard *storboard = self.storyboard;
            UserViewController *UserVC = [storboard instantiateViewControllerWithIdentifier:@"UserVC"];
            [self presentViewController:UserVC animated:YES completion:nil];
            
            
        }else{
            NSString *msg = responseObject[@"msg"];
            [MBProgressHUD showMessage:msg toView:self.view afterDelty:1.0];
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
