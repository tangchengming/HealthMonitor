//
//  PulseMeterViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/17.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "PulseMeterViewController.h"
#import "PulseMeterModel.h"
@interface PulseMeterViewController ()
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;//名称
@property (weak, nonatomic) IBOutlet UIButton *weekBtn;//周
@property (weak, nonatomic) IBOutlet UIButton *MonthBtn;//月
@property (weak, nonatomic) IBOutlet UILabel *pulseLabel;//脉搏
@property (weak, nonatomic) IBOutlet UILabel *oxygenLabel;//血氧
@property (strong, nonatomic) IBOutlet PNLineChartView *lineChartView;


@property (strong, nonatomic) NSMutableArray *DatasArr;//返回数据
@property (strong, nonatomic) NSMutableArray *collectdateArr;//检测时间
@property (strong, nonatomic) NSMutableArray *pulseArr;//脉搏
@property (strong, nonatomic) NSMutableArray *oxygenArr;//血氧


@end

@implementation PulseMeterViewController

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

- (NSMutableArray *)pulseArr{
    
    if (!_pulseArr) {
        _pulseArr = [NSMutableArray array];
    }
    
    return _pulseArr;
}

- (NSMutableArray *)oxygenArr{
    
    if (!_oxygenArr) {
        
        _oxygenArr = [NSMutableArray array];
    }
    
    return _oxygenArr;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNetWorkData];
    
    //取数组最后一个元素
    _pulseLabel.text = [_pulseArr objectAtIndex:_pulseArr.count-1];
    _oxygenLabel.text = [_oxygenArr objectAtIndex:_oxygenArr.count-1];
    
    [self lineChart];
    
}


//数据列表网络请求
- (void)setNetWorkData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"cardId"] = @"8e0de850";
    params[@"member_id"] = @"25";
    
    [RequestManager httpPOST:Request_Method_Fat parameters:params success:^(id responseObject) {
        
        _DatasArr = [PulseMeterModel mj_objectArrayWithKeyValuesArray:responseObject[@"Datas"]];
        _collectdateArr = [PulseMeterModel mj_objectArrayWithKeyValuesArray:responseObject[@"Datas"][@"pulse"]];
        _pulseArr = [PulseMeterModel mj_objectArrayWithKeyValuesArray:responseObject[@"Datas"][@"fatcontent"]];
        _oxygenArr = [PulseMeterModel mj_objectArrayWithKeyValuesArray:responseObject[@"Datas"][@"oxygen"]];
       
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
    self.lineChartView.xAxisValues = _collectdateArr;
    self.lineChartView.yAxisValues = yAxisValues;
    self.lineChartView.axisLeftLineWidth = 39;
    
    
    PNPlot *plot1 = [[PNPlot alloc] init];
    plot1.plottingValues = _pulseArr;
    
    plot1.lineColor = [UIColor blueColor];
    plot1.lineWidth = 0.5;
    
    [self.lineChartView addPlot:plot1];
    
    
    PNPlot *plot2 = [[PNPlot alloc] init];
    
    plot2.plottingValues = _oxygenArr;
    
    plot2.lineColor = [UIColor redColor];
    plot2.lineWidth = 1;
    
    [self.lineChartView  addPlot:plot2];
}


- (IBAction)WeekButton:(UIButton *)sender {
    
    
}


- (IBAction)MonthButton:(UIButton *)sender {
}


- (IBAction)UserBtn:(UIButton *)sender {
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
