//
//  ViewController.m
//  Component
//
//  Created by harsons on 2020/12/31.
//

#import "ViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) NSArray *headTitleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setData];
    
    [self createTableView];
}

- (void)setData {
    self.dataArray = @[@[@"A-无参数",@"AA-有参数",@"AAA-参数+block"],
                       @[@"B-无参数",@"BB-有参数",@"BBB-参数+block"]];
    self.headTitleArray = @[@"MGJRouter (url-block)", @"CTMediator (target-action)"];
}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 44;
    self.tableView.sectionHeaderHeight = 30;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UILabel *headTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    headTitleLab.text = self.headTitleArray[section];
    headTitleLab.textAlignment = NSTextAlignmentCenter;
    return headTitleLab;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [MGJRouter openURL:MGJ_AVC withUserInfo:@{@"nav": self.navigationController} completion:nil];
        } else if (indexPath.row == 1) {
            [MGJRouter openURL:MGJ_AAVC withUserInfo:@{@"nav": self.navigationController, @"des": @"desTitle-A"} completion:nil];
        } else {
            [MGJRouter openURL:MGJ_AAAVC withUserInfo:@{@"nav": self.navigationController, @"des": @"desTitle-A", @"block": ^(NSString *des){
                NSLog(@"---des = %@",des);
            }} completion:nil];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //target  Target_BModule后面这部分，即BModule
            //action  Target_BModule中的方法Action_AVC的后半部分，即AVC
            UIViewController *vc = [[CTMediator sharedInstance] performTarget:Module_B action:Action_B params:nil shouldCacheTarget:YES];
            [self.navigationController pushViewController:vc animated:NO];
        } else if (indexPath.row == 1) {
            UIViewController *vc = [[CTMediator sharedInstance] performTarget:Module_B action:Action_BB params:@{@"des": @"desTitle-B"} shouldCacheTarget:YES];
            [self.navigationController pushViewController:vc animated:NO];
        } else {
            UIViewController *vc = [[CTMediator sharedInstance] performTarget:Module_B action:Action_BBB params:@{@"des": @"desTitle-B", @"block": ^(NSString *des){
                NSLog(@"---des = %@",des);
            }} shouldCacheTarget:YES];
            [self.navigationController pushViewController:vc animated:NO];
        }
    }
}

@end
