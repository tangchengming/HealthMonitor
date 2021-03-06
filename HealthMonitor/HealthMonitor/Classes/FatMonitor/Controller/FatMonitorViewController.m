//
//  FatMonitorViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/17.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "FatMonitorViewController.h"
#import "FatMonitorModel.h"
#import "ListTableViewCell.h"
@interface FatMonitorViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *UserView;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment1;//折线列表
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment2;//脂肪，体质，基础
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment3;//周 月

@property (weak, nonatomic) IBOutlet UIView *XzView;

@property (strong, nonatomic) IBOutlet PNLineChartView *lineChartView;

@property (strong, nonatomic) UITableView *ListTableView;
//@property (strong, nonatomic) PNLineChartView *lineChartView1;

@property (strong, nonatomic) NSMutableArray *DatasArr;//返回数据
@property (strong, nonatomic) NSMutableArray *collectdateArr;//检测时间
@property (strong, nonatomic) NSMutableArray *fatcontentArr;//脂肪含量
@property (strong, nonatomic) NSMutableArray *bmiArr;//体质指数
@property (strong, nonatomic) NSMutableArray *bmrArr;//基础代谢值


@end

@implementation FatMonitorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



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

- (NSMutableArray *)fatcontentArr{

    if (!_fatcontentArr) {
        _fatcontentArr = [NSMutableArray array];
    }
    
    return _fatcontentArr;
}

- (NSMutableArray *)bmiArr{

    if (!_bmiArr) {
        
        _bmiArr = [NSMutableArray array];
    }
    
    return _bmiArr;
}

- (NSMutableArray *)bmrArr{

    if (!_bmrArr) {
        _bmrArr = [NSMutableArray array];
    }
    
    return _bmrArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self loadcenterView];
    
   // [self setNetWorkData];
    
}

//数据列表网络请求
- (void)setNetWorkData{
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"cardId"] = @"32200236";
    params[@"member_id"] = @"55";
    
    [RequestManager httpPOST:Request_Method_Fat parameters:params success:^(id responseObject) {
        NSLog(@"脂肪仪数据：%@",responseObject);
        self.DatasArr = [FatMonitorModel mj_objectArrayWithKeyValuesArray:responseObject[@"listBlood_pressure"]];
        
        
       
        for (FatMonitorModel *fatModel in self.DatasArr) {
            NSString *value = fatModel.bmi;
            NSString *value1 = fatModel.bmr;
            NSString *value2 = fatModel.collectdate;
            
            [self.bmiArr addObject:value];
            [self.bmrArr addObject:value1];
            [self.collectdateArr addObject:value2];
        }
        
        [self.ListTableView reloadData];//刷新
    } failure:^(NSError *error) {
        
    }];
    
}


-(void)loadcenterView{
    
    _segment1.selectedSegmentIndex = 0;//默认第一个segment被选中
    [self FatLine];
    _segment2.selectedSegmentIndex = 0;
    _segment3.selectedSegmentIndex = 0;
    
    [_segment1 addTarget:self action:@selector(changesegment1:) forControlEvents:UIControlEventValueChanged];//监听事件,当控件值改变时调用
    [_segment2 addTarget:self action:@selector(changesegment2:) forControlEvents:UIControlEventValueChanged];//监听事件,当控件值改变时调用
    [_segment3 addTarget:self action:@selector(changesegment3:) forControlEvents:UIControlEventValueChanged];//监听事件,当控件值改变时调用

}





-(void)changesegment1:(UISegmentedControl *)segment{

    int Index = (int)_segment1.selectedSegmentIndex;
    
    switch (Index) {
        case 0:
            
            self.XzView.hidden = NO;
            self.lineChartView.hidden = NO;
            self.ListTableView.hidden = YES;
            
            //选中第一个segment
            [self XzView];
            [self lineChartView];
            
            break;
         
        case 1:
            
            self.XzView.hidden = YES;
            self.lineChartView.hidden = YES;
            self.ListTableView.hidden = NO;
            
            //选中第二个segment
            [self ListTableView];
            [self TableView];
            [self setNetWorkData];
            break;
        
        default:
            break;
    }

}

-(void)changesegment2:(UISegmentedControl *)segment{
    
    int Index = (int)_segment2.selectedSegmentIndex;
    
    switch (Index) {
        case 0:
            
           
            
            //选中第一个segment
            
            [self lineChartView];
            [self FatLine];
            break;
            
        case 1:
            
            
            
            //选中第二个segment
            [self lineChartView];
            [self  BmiLine];
            break;
           
        case 2:
            
            
            
            //选中第三个segment
            [self lineChartView];
            [self BmrLine];
            break;
            
        default:
            break;
    }



}

-(void)changesegment3:(UISegmentedControl *)segment{
    
    int Index = (int)_segment1.selectedSegmentIndex;
    
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




- (void)TableView{
    
    self.ListTableView = [[UITableView alloc] init];
    [self.view addSubview:_ListTableView];
       [self.ListTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.XzView).with.offset(0);
        make.left.right.equalTo(@0);
        
        make.bottom.equalTo(@0);
        
    }];
    
    
    self.ListTableView.delegate = self;
    self.ListTableView.dataSource = self;
    self.ListTableView.tableFooterView = [UIView new];
    //注册cell
    [self.ListTableView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}

#pragma make ++  tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.DatasArr.count;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    FatMonitorModel *fatModel = self.DatasArr[indexPath.item];
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    for (FatMonitorModel *fatModel in self.DatasArr) {
        
        NSString *value2 = fatModel.collectdate;
        NSString *b = [value2 substringFromIndex:5];
        NSLog(@"时间：%@",b);
        cell.collectdateLabel.text = b;
    }
    
    
    
    cell.bodytypeLabel.text = fatModel.bodytype;
    cell.fatcontentLabel.text = fatModel.fatcontent;
    cell.fatLabel.text = @"脂肪含量";
    cell.bmiLabel.text = fatModel.bmi;
    cell.biLabel.text = @"体质指数";
    cell.bmrLabel.text = fatModel.bmr;
    cell.brLabel.text = @"基础代谢值";
    
    return cell;
    
}



//脂肪含量
- (void)FatLine{
    
    self.lineChartView.max = 50;
    self.lineChartView.min = 10;
    self.lineChartView.interval = 10;
    
    NSMutableArray *yAxisValues = [@[] mutableCopy];
    for (int i=0; i<6; i++) {
        NSString* str = [NSString stringWithFormat:@"%.2f", self.lineChartView.min+self.lineChartView.interval*i];
        [yAxisValues addObject:str];
    }
    
    //横坐标
    self.lineChartView.xAxisValues = @[@"2017-04-21 11:34:50", @"2017-04-21 11:34:50", @"2017-04-21 11:34:50",@"2017-04-21 11:34:50", @"2017-04-21 11:34:50", @"2017-04-21 11:34:50",@"2017-04-21 11:34:50", @"2017-04-21 11:34:50", @"2017-04-21 11:34:50",@"2017-04-21 11:34:50", @"2017-04-21 11:34:50"];
    
    //正式 self.lineChartView.xAxisValues = _collectdateArr;
    
    //值
    // test line chart
    NSArray* plottingDataValues1 =@[@12, @20, @25, @18,@33, @45,@22, @33, @54,@15, @43];//蓝色
    
    
    
    self.lineChartView.yAxisValues = yAxisValues;
    self.lineChartView.axisLeftLineWidth = 39;
    
    PNPlot *plot1 = [[PNPlot alloc] init];
    plot1.plottingValues = plottingDataValues1;
    //正式 plot1.plottingValues = _fatcontentArr;
    
    plot1.lineColor = [UIColor blueColor];
    plot1.lineWidth = 1;
    
    [self.lineChartView addPlot:plot1];
    
}
//体质指数
- (void)BmiLine{

    self.lineChartView.max = 30;
    self.lineChartView.min = 10;
    self.lineChartView.interval = 5;
    
    NSMutableArray *yAxisValues = [@[] mutableCopy];
    for (int i=0; i<6; i++) {
        NSString* str = [NSString stringWithFormat:@"%.2f", self.lineChartView.min+self.lineChartView.interval*i];
        [yAxisValues addObject:str];
    }
    
    //横坐标
    self.lineChartView.xAxisValues = @[@"2017-04-21 11:34:50", @"2017-04-21 11:34:50", @"2017-04-21 11:34:50",@"2017-04-21 11:34:50", @"2017-04-21 11:34:50", @"2017-04-21 11:34:50",@"2017-04-21 11:34:50", @"2017-04-21 11:34:50", @"2017-04-21 11:34:50",@"2017-04-21 11:34:50", @"2017-04-21 11:34:50"];
    
    //正式 self.lineChartView.xAxisValues = _collectdateArr;
    
    //值
    // test line chart
    NSArray* plottingDataValues1 =@[@12, @20, @25, @18,@23, @25,@22, @13, @24,@15, @13];//蓝色
    
    
    
    self.lineChartView.yAxisValues = yAxisValues;
    self.lineChartView.axisLeftLineWidth = 39;
    
    PNPlot *plot1 = [[PNPlot alloc] init];
    plot1.plottingValues = plottingDataValues1;
    //正式 plot1.plottingValues = _bmiArr;
    
    plot1.lineColor = [UIColor redColor];
    plot1.lineWidth = 1;
    
    [self.lineChartView addPlot:plot1];

}

//基础代谢
- (void)BmrLine{
    self.lineChartView.max = 2000;
    self.lineChartView.min = 800;
    self.lineChartView.interval = 300;
    
    NSMutableArray *yAxisValues = [@[] mutableCopy];
    for (int i=0; i<6; i++) {
        NSString* str = [NSString stringWithFormat:@"%.2f", self.lineChartView.min+self.lineChartView.interval*i];
        [yAxisValues addObject:str];
    }
    
    //横坐标
    self.lineChartView.xAxisValues = @[@"2017-04-21 11:34:50", @"2017-04-21 11:34:50", @"2017-04-21 11:34:50",@"2017-04-21 11:34:50", @"2017-04-21 11:34:50", @"2017-04-21 11:34:50",@"2017-04-21 11:34:50", @"2017-04-21 11:34:50", @"2017-04-21 11:34:50",@"2017-04-21 11:34:50", @"2017-04-21 11:34:50"];
    
    //正式 self.lineChartView.xAxisValues = _collectdateArr;
    
    //值
    // test line chart
    NSArray* plottingDataValues1 =@[@1200, @2000, @825, @918,@1133, @1545,@1122, @1433, @1154,@1715, @843];//蓝色
    
    
    
    self.lineChartView.yAxisValues = yAxisValues;
    self.lineChartView.axisLeftLineWidth = 39;
    
    PNPlot *plot1 = [[PNPlot alloc] init];
    plot1.plottingValues = plottingDataValues1;
    //正式 plot1.plottingValues = _bmrArr;
    
    plot1.lineColor = [UIColor redColor];
    plot1.lineWidth = 1;
    
    [self.lineChartView addPlot:plot1];

}

//周
- (void)WeekLine{
    
}

//月
- (void)MonthLine{

    
}

//用户
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
