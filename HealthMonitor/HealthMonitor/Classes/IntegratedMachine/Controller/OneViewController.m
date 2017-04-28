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
    self.ListTableView.delegate = self;
    self.ListTableView.dataSource = self;
    self.ListTableView.tableFooterView = [UIView new];
    //注册cell
    [self.ListTableView registerNib:[UINib nibWithNibName:@"OneTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    [self setNetWorkData];
}



//数据列表网络请求
- (void)setNetWorkData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"UID"] = @"32200236";//身份证
    params[@"member_id"] = @"55";
    
    [RequestManager httpPOST:Request_Method_One parameters:params success:^(id responseObject) {
        
        self.DatasArr = [OneModel mj_objectArrayWithKeyValuesArray:responseObject[@"listIntegrated"]];
        
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
    
    OneModel *oneModel = self.DatasArr[indexPath.item];
    
    OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.timeLabel.text = oneModel.measureTime;
    cell.SGLabel.text = [NSString stringWithFormat:@"%@cm",oneModel.BMI_height];
    cell.TZLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BMI_weight];
    cell.BMILabel.text = oneModel.BMI_BMI;
    cell.SSYLabel.text = [NSString stringWithFormat:@"%@mmHg",oneModel.BP_sbp];
    cell.SZYLabel.text = [NSString stringWithFormat:@"%@mmHg",oneModel.BP_dbp];
    cell.MBLabel.text = oneModel.BP_hr;
    cell.TZFLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_fm];
    cell.TZFLLabel.text = [NSString stringWithFormat:@"%@%%",oneModel.BF_fp];
    cell.CZFLLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_lbm];
    cell.TSFLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_tbw];
    cell.TSFLLabel.text = [NSString stringWithFormat:@"%@%%",oneModel.BF_tbwc];
    cell.TGGLLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_sm];
    cell.TJRLLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_mm];
    cell.XBWYLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_ecf];
    cell.XBNYLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_icf];
    cell.DBZLLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_protein];
    cell.KWZLLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_minerals];
    cell.QTCFLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_other];
    cell.JCDXLabel.text = [NSString stringWithFormat:@"%@kcl",oneModel.BF_bmr];
    cell.ZFTJLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_fmAdjus];
    cell.JRTJLabel.text = [NSString stringWithFormat:@"%@kg",oneModel.BF_mmAdjus];
    cell.YBHDLabel.text = [NSString stringWithFormat:@"%@%%",oneModel.bo_os];
    cell.XTLabel.text = oneModel.bs_value;
    cell.TWLabel.text = [NSString stringWithFormat:@"%@°C",oneModel.temp_tempv];
    
    
    
    
    return cell;
    
}








- (IBAction)gengduoBtn:(UIButton *)sender {
    
    ListViewController *list = [[ListViewController alloc]init];
    [self presentViewController:list animated:NO completion:nil];
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
