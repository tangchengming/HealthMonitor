//
//  UserViewController.m
//  HealthMonitor
//
//  Created by Atohuyo on 2017/4/10.
//  Copyright © 2017年 Atohuyo. All rights reserved.
//

#import "UserViewController.h"
#import "UserTableViewCell.h"
#import "UserInfoModel.h"
@interface UserViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *UserListTableView;
@property (strong, nonatomic)NSMutableArray *UserListDataArr;//模型对象数组（ 用户列表数据源）
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self tableView];
    
    

}

- (void)tableView{

    self.UserListTableView.delegate = self;
    self.UserListTableView.dataSource = self;
    self.UserListTableView.tableFooterView = [UIView new];
    //注册cell
    [self.UserListTableView registerNib:[UINib nibWithNibName:@"UserTableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
}

//用户列表网络请求
- (void)setNetWorkData{

    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"userId"] = @"2";
    
    [RequestManager httpRequestPOST:Request_Method_UserList parameters:params success:^(id responseObject) {
        
        if ([[responseObject objectForKey:@"flag"]integerValue]){
            
            _UserListDataArr = [UserInfoModel mj_objectArrayWithKeyValuesArray:responseObject[@"listMemberlist"]];
            
        }else{
            
            [MBProgressHUD showMessage:@"暂无成员 请创建！" toView:self.view afterDelty:1.0];
        }
        
        
    } failure:^(NSError *error) {
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

















//退出登录
- (IBAction)ExitLoginBtn:(UIButton *)sender {
    
    UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"退出登录" message:@"是否确认退出登录！" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alertview show];

}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex;{
    
    
    
    if (buttonIndex == 0)
        
    {
        
        
        
    }else{
        
        NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
        [user removeObjectForKey:@"tel"];
        [user removeObjectForKey:@"name"];
        [user removeObjectForKey:@"userid"];
        [user synchronize];
        [CZUserDefalt writeDataWithKey:@"loginStatus" andValue:@"NO"];
        [CZUserDefalt removeAllData];
        
    }
    
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
