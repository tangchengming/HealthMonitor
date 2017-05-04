//
//  AlkBGMViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/11.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "AlkBGMViewController.h"
#import "BloodModel.h"
@interface AlkBGMViewController ()
@property (weak, nonatomic) IBOutlet UIView *UserView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;

@property (weak, nonatomic) IBOutlet UIView *highView;
@property (weak, nonatomic) IBOutlet UILabel *highLabel;
@property (weak, nonatomic) IBOutlet UILabel *hLabel;

@property (weak, nonatomic) IBOutlet UIView *lowView;
@property (weak, nonatomic) IBOutlet UILabel *lowLabel;
@property (weak, nonatomic) IBOutlet UILabel *lLabel;

@property (weak, nonatomic) IBOutlet UIView *heartView;
@property (weak, nonatomic) IBOutlet UILabel *heartLabel;
@property (weak, nonatomic) IBOutlet UILabel *heLabel;

@property (strong, nonatomic) IBOutlet PNLineChartView *lineChartView;



@property (strong, nonatomic) NSMutableArray *DatasArr;//返回数据
@property (strong, nonatomic) NSMutableArray *collectdateArr;//时间返回数据
@property (strong, nonatomic) NSMutableArray *systolicpressureArr;//高压返回数据
@property (strong, nonatomic) NSMutableArray *diastolicpressureArr;//低压返回数据
@property (strong, nonatomic) NSMutableArray *pulseArr;//低压返回数据


@end

@implementation AlkBGMViewController




- (NSMutableArray *)DatasArr{

    if (!_DatasArr) {
        
        _DatasArr = [NSMutableArray array];
    }
    return _DatasArr;
}


-(NSMutableArray *)collectdateArr{
    
    if (!_collectdateArr) {
        
        _collectdateArr = [NSMutableArray array];
    }
    
    return _collectdateArr;
}

- (NSMutableArray *)systolicpressureArr{
    
    if (!_systolicpressureArr) {
        _systolicpressureArr = [NSMutableArray array];
    }
    
    return _systolicpressureArr;
}

- (NSMutableArray *)diastolicpressureArr{
    
    if (!_diastolicpressureArr) {
        
        _diastolicpressureArr = [NSMutableArray array];
    }
    
    return _diastolicpressureArr;
}

- (NSMutableArray *)pulseArr{
    
    if (!_pulseArr) {
        
        _pulseArr = [NSMutableArray array];
    }
    
    return _pulseArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hLabel.text = @"高压/mmhg";
    self.lLabel.text = @"低压/mmhg";
    self.heLabel.text = @"心率/bpm";
    
    [self setNetWorkData];
    
    
    
    
    [self lineChart];
}


//数据列表网络请求
- (void)setNetWorkData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"cardId"] = @"32200236";
    params[@"member_id"] = @"55";
    
    [RequestManager httpPOST:Request_Method_Blood_pressure parameters:params success:^(id responseObject) {
        NSLog(@"爱立康数据：%@",responseObject);
        _DatasArr = [BloodModel mj_objectArrayWithKeyValuesArray:responseObject[@"listBlood_pressure"]];
        
        for (BloodModel *bloodModel in self.DatasArr) {
            NSString *value = bloodModel.systolicpressure;
            NSString *value1 = bloodModel.diastolicpressure;
            NSString *value2 = bloodModel.collectdate;
            NSString *value3 = bloodModel.pulse;
            
            [self.systolicpressureArr addObject:value];
            [self.diastolicpressureArr addObject:value1];
            [self.collectdateArr addObject:value2];
            [self.pulseArr addObject:value3];
            
            NSLog(@"数组数据：%@",self.systolicpressureArr);
            NSLog(@"数组数据：%@",self.diastolicpressureArr);
            NSLog(@"数组数据：%@",self.pulseArr);
            
        }

        if (self.collectdateArr.count == 0) {
            
            self.heartLabel.text = @"000";
            
            
            self.lowLabel.text = @"000";
            
            
            self.heartLabel.text = @"000";
            
        }else{
            
            //取数组最后一个元素
            self.heartLabel.text = [self.systolicpressureArr objectAtIndex:self.systolicpressureArr.count-1];
            
            
            self.lowLabel.text = [self.diastolicpressureArr objectAtIndex:self.diastolicpressureArr.count-1];
            
            
            self.heartLabel.text = [self.pulseArr objectAtIndex:self.pulseArr.count-1];
            
        }

        
        
    } failure:^(NSError *error) {
        
    }];
    
}


- (void)lineChart{

    
    
    self.lineChartView.max = 150;
    self.lineChartView.min = 30;
    
    
    self.lineChartView.interval = 30;
    
    NSMutableArray* yAxisValues = [@[] mutableCopy];
    for (int i=0; i<6; i++) {
        NSString* str = [NSString stringWithFormat:@"%.2f", self.lineChartView.min+self.lineChartView.interval*i];
        [yAxisValues addObject:str];
    }
    
    //横坐标
    self.lineChartView.xAxisValues = self.collectdateArr;
    self.lineChartView.yAxisValues = yAxisValues;
    self.lineChartView.axisLeftLineWidth = 39;
    
    
    PNPlot *plot1 = [[PNPlot alloc] init];
    plot1.plottingValues = self.diastolicpressureArr;
    
    
    plot1.lineColor = [UIColor blueColor];
    plot1.lineWidth = 0.5;
    
    [self.lineChartView addPlot:plot1];
    
    
    PNPlot *plot2 = [[PNPlot alloc] init];
    
    plot2.plottingValues = self.systolicpressureArr;
    plot2.lineColor = [UIColor redColor];
    plot2.lineWidth = 1;
    
    [self.lineChartView  addPlot:plot2];
}

//点击按钮 弹出选择设备项目
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
