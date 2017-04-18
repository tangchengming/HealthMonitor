//
//  NewUserViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/11.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "NewUserViewController.h"
#import "NewUserViewController.h"
#import "WSDatePickerView.h"
#import "UserViewController.h"
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

@property (strong, nonatomic) NSString *sex;

@end

@implementation NewUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
    
    [self SexView1];
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
            _sex = @"1";
        }]];
        //按钮：拍照，类型：UIAlertActionStyleDefault
        [alert addAction:[UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
           
            _SexLabel.text = @"女";
            _sex = @"0";
            
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

- (IBAction)SaveButton:(UIButton *)sender {
    
    if ([self.NameTextField.text isEqualToString: @""]  || [self.SexLabel.text isEqualToString: @""]  || [self.AgeLabel.text isEqualToString: @""] || [self.cardTextField.text isEqualToString: @""]){
    
        [MBProgressHUD showMessage:@"请填写完整，选项不能为空！" toView:self.view afterDelty:1.0];
    }else{
    
        [self setNetWorkData];
    }
    
    
}

- (void)setNetWorkData{

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userId"] = @"2";
    params[@"name"] = _NameTextField.text;
    params[@"birth"] =  _AgeLabel.text;
    params[@"sex"] = _sex;
    NSLog(@"nsme:%@   birth:%@   sex:%@",_NameTextField.text,_AgeLabel.text,_sex);
    
    [RequestManager httpRequestPOST:Request_Method_NewUser parameters:params success:^(id responseObject) {
        
        UIStoryboard *storboard = self.storyboard;
        UserViewController *UserVC = [storboard instantiateViewControllerWithIdentifier:@"UserVC"];
        
        [self presentViewController:UserVC animated:YES completion:nil];;
        
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
