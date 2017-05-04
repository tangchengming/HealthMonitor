//
//  OneViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/28.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "OneViewController.h"
#import "OneTableViewCell.h"
#import "OneModel.h"
#import "ListViewController.h"
@interface OneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *UserView;

@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UITableView *ListTableView;
@property (strong, nonatomic) NSMutableArray *DatasArr;//返回数据
@end

@implementation OneViewController
- (NSMutableArray *)DatasArr{
    
    if (!_DatasArr) {
        
        _DatasArr = [NSMutableArray array];
    }
    
    return _DatasArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNetWorkData];
    
    [self tableview];
    
}

- (void)tableview{

    self.ListTableView.delegate = self;
    self.ListTableView.dataSource = self;
    self.ListTableView.tableFooterView = [UIView new];
    //注册cell
    [self.ListTableView registerNib:[UINib nibWithNibName:@"OneTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}

//数据列表网络请求
- (void)setNetWorkData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"UID"] = @"510104196601151890";//身份证
    params[@"member_id"] = @"55";
    
    [RequestManager httpPOST:Request_Method_One parameters:params success:^(id responseObject) {
        
        
        
        if ([[responseObject objectForKey:@"flag"]integerValue]) {
            
            NSLog(@"一体机数据：%@",responseObject);
            self.DatasArr = [OneModel mj_objectArrayWithKeyValuesArray:responseObject[@"listIntegrated"]];
            
            [self.ListTableView reloadData];//刷新
        }else{
            
            
            [MBProgressHUD showMessage:responseObject[@"msg"] toView:self.view afterDelty:1.0];
            
            
        }

        
        
        
        
    } failure:^(NSError *error) {
        
        
    }];
    
}




#pragma make ++  tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 560;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    return cell;
    
    
    if (self.DatasArr == 0) {
        
        OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        
        return cell;
    }else{
    
    OneModel *oneModel = self.DatasArr[indexPath.item];
    
    OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
        cell.timeLabel.text = oneModel.measureTime;
        cell.SGLabel.text = [NSString stringWithFormat:@"%@cm",oneModel.bmi_height];
        cell.TZLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bmi_weight];
        cell.BMILabel.text = oneModel.bmi_BMI;
        cell.SSYLabel.text = [NSString stringWithFormat:@"%@mmHg",oneModel.bp_sbp];
        cell.SZYLabel.text = [NSString stringWithFormat:@"%@mmHg",oneModel.bp_dbp];
        cell.MBLabel.text = oneModel.bp_hr;
        cell.TZFLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_fm];
        cell.TZFLLabel.text = [NSString stringWithFormat:@"%@%%",oneModel.bf_fp];
        cell.CZFLLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_lbm];
        cell.TSFLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_tbw];
        cell.TSFLLabel.text = [NSString stringWithFormat:@"%@%%",oneModel.bf_tbwc];
        cell.TGGLLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_sm];
        cell.TJRLLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_mm];
        cell.XBWYLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_ecf];
        cell.XBNYLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_icf];
        cell.DBZLLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_protein];
        cell.KWZLLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_minerals];
        cell.QTCFLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_other];
        cell.JCDXLabel.text = [NSString stringWithFormat:@"%@kcl",oneModel.bf_bmr];
        cell.ZFTJLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_fmAdjus];
        cell.JRTJLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.bf_mmAdjus];
        cell.YBHDLabel.text = [NSString stringWithFormat:@"%@%%",oneModel.bo_os];
        cell.XTLabel.text = oneModel.bs_value;
        cell.TWLabel.text = [NSString stringWithFormat:@"%@°C",oneModel.temp_tempv];
    
    return cell;
    }
    return nil;
     
    
}






//sb 同个sb里面两个界面的跳转
- (IBAction)gengduo:(UIButton *)sender {
    
    UIStoryboard *storboard = self.storyboard;
    ListViewController *listVC = [storboard instantiateViewControllerWithIdentifier:@"list"];
    
    //editVC.userModel = UserInfoModel;
    
    [self presentViewController:listVC animated:YES completion:nil];
}




- (IBAction)fanhui:(UIButton *)sender {
    
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
