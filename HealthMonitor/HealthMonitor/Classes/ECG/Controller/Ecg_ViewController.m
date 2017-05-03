//
//  Ecg_ViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/21.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "Ecg_ViewController.h"
#import "ECGTableViewCell.h"
#import "Ecg_structureModel.h"
#import "ECG_DetailsViewController.h"
@interface Ecg_ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIView *UserView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UITableView *ListTableView;

@property (strong, nonatomic)NSMutableArray *ECGListDataArr;//模型对象数组（ 列表数据源）
@property (strong, nonatomic)NSMutableArray *picturedataArr;//模型对象数组（ 心电图列表数据源）


@end

@implementation Ecg_ViewController

- (NSMutableArray *)ECGListDataArr{
    
    if (!_ECGListDataArr) {
        
        _ECGListDataArr = [NSMutableArray array];
    }
    return _ECGListDataArr;
}

- (NSMutableArray *)picturedataArr{
    
    if (!_picturedataArr) {
        
        _picturedataArr = [NSMutableArray array];
    }
    return _picturedataArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self TableView];
    [self setNetWorkData];
}


- (void)TableView{
    
    self.ListTableView.delegate = self;
    self.ListTableView.dataSource = self;
    self.ListTableView.tableFooterView = [UIView new];
}


//数据列表网络请求
- (void)setNetWorkData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"cardId"] = @"8e0de850";
    params[@"member_id"] = @"25";
    
    [RequestManager httpPOST:Request_Method_Ecg_structure parameters:params success:^(id responseObject) {
        
        if ([[responseObject objectForKey:@"flag"]integerValue]){
            
            _ECGListDataArr = [Ecg_structureModel mj_objectArrayWithKeyValuesArray:responseObject[@"Datas"]];
            
            [self.ListTableView reloadData];//刷新
        }else{
            
            [MBProgressHUD showMessage:@"暂时还没有数据！" toView:self.view afterDelty:1.0];
        }
        
        
    } failure:^(NSError *error) {
        
    }];
    
    [RequestManager httpPOST:Request_Method_Ecg_picture parameters:params success:^(id responseObject) {
        
        if ([[responseObject objectForKey:@"flag"]integerValue]){
            
            _picturedataArr = [Ecg_structureModel mj_objectArrayWithKeyValuesArray:responseObject[@"Datas"]];
            
            //[self.ListTableView reloadData];//刷新
        }else{
            
            
        }
        
    } failure:^(NSError *error) {
        
        
    }];
    
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return _ECGListDataArr.count;
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Ecg_structureModel *ECGModel = self.ECGListDataArr[indexPath.item];
    ECGTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EcgCell" forIndexPath:indexPath];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;//设置cell点击效果
    
    cell.TimeLabel.text = ECGModel.collectdate;
    cell.waveformLabel.text = ECGModel.waveform;
    cell.isarrhythmiaLabel.text = ECGModel.isarrhythmia;
    cell.wholewaveLabel.text = ECGModel.wholewave;
    cell.heartrateLabel.text = ECGModel.avr_heartrate;
    cell.xinlvLabel.text = @"心率";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Ecg_structureModel *ECGModel = self.ECGListDataArr[indexPath.item];
    Ecg_structureModel *EcgModel = self.picturedataArr[indexPath.item];
    
    UIStoryboard *storboard = self.storyboard;
    ECG_DetailsViewController *ECG_Deta = [storboard instantiateViewControllerWithIdentifier:@"detaVc"];
    
    ECG_Deta.collectdate = ECGModel.collectdate;
    ECG_Deta.waveform = ECGModel.waveform;
    ECG_Deta.isarrhythmia = ECGModel.isarrhythmia;
    ECG_Deta.wholewave = ECGModel.wholewave;
    ECG_Deta.heartrate = ECGModel.avr_heartrate;
    ECG_Deta.stisnormal = ECGModel.stisnormal;
    ECG_Deta.picturedata = EcgModel.picturedata;
    
    [self presentViewController:ECG_Deta animated:YES completion:nil];
    
    
}


- (IBAction)UserBtn:(UIButton *)sender {
}
- (IBAction)backBtn:(UIButton *)sender {
    
    [self  dismissViewControllerAnimated:YES completion:nil];
    
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
