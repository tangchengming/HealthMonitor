//
//  Blood_ViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/21.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "Blood_ViewController.h"
#import "BgmModel.h"
@interface Blood_ViewController ()
@property (weak, nonatomic) IBOutlet UIView *UserView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;

@property (weak, nonatomic) IBOutlet UILabel *highLabel;
@property (weak, nonatomic) IBOutlet UILabel *hLabel;

@property (weak, nonatomic) IBOutlet UILabel *AverageLabel;
@property (weak, nonatomic) IBOutlet UILabel *aLabel;

@property (weak, nonatomic) IBOutlet UILabel *lowLabel;
@property (weak, nonatomic) IBOutlet UILabel *lLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@property (weak, nonatomic) IBOutlet PNLineChartView *lineChartView;

@property (strong, nonatomic) NSMutableArray *DatasArr;//返回数据
@property (strong, nonatomic) NSMutableArray *collectdateArr;//检测时间
@property (strong, nonatomic) NSMutableArray *bloodsugarArr;//脉搏

@end

@implementation Blood_ViewController

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

- (NSMutableArray *)bloodsugarArr{
    
    if (!_bloodsugarArr) {
        _bloodsugarArr = [NSMutableArray array];
    }
    
    return _bloodsugarArr;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hLabel.text = @"最高/mmol/l";
    self.lLabel.text = @"平均/mmol/l";
    self.aLabel.text = @"最低/mmol/l";
    [self setNetWorkData];
    self.segment.selectedSegmentIndex = 0;//默认第一个segment被选中
    [self  lineChart];
    
    [self.segment addTarget:self action:@selector(changesegment:) forControlEvents:UIControlEventValueChanged];//监听事件,当控件值改变时调用

    
    
    
    
    
    
}

-(void)changesegment:(UISegmentedControl *)segment{
    
    int Index = (int)self.segment.selectedSegmentIndex;
    
    switch (Index) {
        case 0:
            
            //选中第一个segment
            
            [self lineChartView];
            
            break;
            
        case 1:
            
            
            
            //选中第二个segment
            [self lineChartView];
            
            break;
            
        default:
            break;
    }
    
}





//数据列表网络请求
- (void)setNetWorkData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"cardId"] = @"32200236";
    params[@"member_id"] = @"55";
    
    [RequestManager httpPOST:Request_Method_BloodSugar parameters:params success:^(id responseObject) {
        
        
        NSLog(@"血糖仪数据：%@",responseObject);
        _DatasArr = [BgmModel mj_objectArrayWithKeyValuesArray:responseObject[@"listBlood_pressure"]];
        
        
        
        for (BgmModel *bgmModel in self.DatasArr) {
            NSString *value = bgmModel.bloodsugar;
            
            NSString *value1 = bgmModel.collectdate;
            
            [self.bloodsugarArr addObject:value];
            
            [self.collectdateArr addObject:value1];
        }
        
        if (self.collectdateArr.count == 0) {
            self.highLabel.text = @"000";
            self.lowLabel.text = @"000";
            self.AverageLabel.text = @"000";
        }else{
            //CGFloat all_value = [[ary valueForKeyPath:@"@sum.floatValue"] floatValue];  //总和
            CGFloat mid_value = [[_bloodsugarArr valueForKeyPath:@"@avg.floatValue"] floatValue];  //平均数
            CGFloat max_value = [[_bloodsugarArr valueForKeyPath:@"@max.floatValue"] floatValue];  //最大值
            CGFloat min_value = [[_bloodsugarArr valueForKeyPath:@"@min.floatValue"] floatValue];  //最小值
            
            self.highLabel.text = [NSString stringWithFormat:@"%.2f",max_value];
            self.lowLabel.text = [NSString stringWithFormat:@"%.2f",min_value];
            self.AverageLabel.text = [NSString stringWithFormat:@"%.2f",mid_value];
            
        }

        
        
        
    } failure:^(NSError *error) {
        
    }];
    
}


- (void)lineChart{
    
    
    
    self.lineChartView.max = 10;
    self.lineChartView.min = 2;
    
    
    self.lineChartView.interval = 2;
    
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
    plot1.plottingValues = self.bloodsugarArr;
    
    plot1.lineColor = [UIColor blueColor];
    plot1.lineWidth = 0.5;
    
    [self.lineChartView addPlot:plot1];
    
    
    PNPlot *plot2 = [[PNPlot alloc] init];
    
    plot2.plottingValues = _bloodsugarArr;
    
    plot2.lineColor = [UIColor redColor];
    plot2.lineWidth = 1;
    
    [self.lineChartView  addPlot:plot2];
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
