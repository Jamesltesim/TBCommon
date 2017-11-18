//
//  ViewController.m
//  Test897
//
//  Created by Toby on 2017/11/18.
//  Copyright © 2017年 Verge. All rights reserved.
//

#import "ViewController.h"
#import "PayOrderTableViewCell.h"
#import "PayOrderHeaderView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,PayOrderTableViewCellDelegate>

@property (nonatomic,strong) UITableView *tabView;
@property(nonatomic,strong) NSArray *payTypeArray;
@property(nonatomic,strong) NSArray *payImageArray;
@property (nonatomic,strong) UIButton *confirmButton;

@property(nonatomic,strong) PayOrderTableViewCell *selectedCell;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.payTypeArray = @[@[@"货到付款"],@[@"微信支付",@"支付宝支付"]];
    self.payImageArray = @[@[[UIImage imageNamed:@"huodaofukuan"]],
                           @[[UIImage imageNamed:@"wechatPay"],[UIImage imageNamed:@"aliPay"]]
                           ];
    
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1];
    
    [self.view addSubview:self.tabView];
    
    [self.view addSubview:self.confirmButton];
    
    
    NSString *price = @"22.7";
    NSString *storeName = @"黄金翅吧";
    NSString *number = @"28618300076016602";
    UIImage *iconImg = [UIImage imageNamed:@""];
    
    PayOrderHeaderView *headerView = [[PayOrderHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.tabView.frame.size.width, 80)];
    headerView.priceLab.text = price;
    headerView.storeNameAndNumberLab.text = [NSString stringWithFormat:@"%@ - %@",storeName,number];
    headerView.imgView.image = iconImg;
    
    self.tabView.tableHeaderView = headerView;
    
    
}

- (UIButton *)confirmButton{
    if(!_confirmButton){
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.frame = CGRectMake(10, self.tabView.frame.origin.y+self.tabView.frame.size.height+25, self.view.frame.size.width-20, 45);
        _confirmButton.backgroundColor = [UIColor greenColor];
        _confirmButton.layer.cornerRadius = 3;
        [_confirmButton setTitle:[NSString stringWithFormat:@"货到付款 %@",@"22.7"] forState:UIControlStateNormal];
        [_confirmButton setTitleColor:[UIColor colorWithRed:68/255.0 green:68/255.0 blue:68/255.0 alpha:1] forState:UIControlStateNormal];
        _confirmButton.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [_confirmButton addTarget:self action:@selector(confirmPress:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
    
}

- (void)confirmPress:(UIButton *)sender {
    
}

- (UITableView *)tabView{
    if(!_tabView){
        _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 280) style:UITableViewStyleGrouped];
        _tabView.delegate = self;
        _tabView.dataSource = self;
        _tabView.scrollEnabled = YES;
    }
    return _tabView;
}

//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    return 1;//section头部高度
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view ;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.payTypeArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *data = self.payTypeArray[section];
    return data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PayOrderTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"PayOrderTableViewCell" owner:nil options:nil] firstObject];
    cell.delegate = self;
    cell.indexPath = indexPath;
    
    NSArray *data = self.payTypeArray[indexPath.section];
    NSArray *imgs = self.payImageArray[indexPath.section];
    
    cell.payTypeLab.text = data[indexPath.row];
    cell.payImage.image = imgs[indexPath.row];
    
    if(self.selectedCell == nil){
        self.selectedCell = cell;
        self.selectedCell.sselectImage.image = [UIImage imageNamed:@"cross_selected"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)payOrderCellAtIndex:(NSIndexPath *)indexpath{
    self.selectedCell.sselectImage.image = [UIImage imageNamed:@"cross_normal"];
    
    PayOrderTableViewCell *cell = [self.tabView cellForRowAtIndexPath:indexpath];
    self.selectedCell = cell;
    self.selectedCell.sselectImage.image =[UIImage imageNamed:@"cross_selected"];
    
    if([indexpath isEqual:[NSIndexPath indexPathForRow:0 inSection:0]]){
        [self.confirmButton setTitle:[NSString stringWithFormat:@"货到付款 %@",@"22.7"] forState:UIControlStateNormal];
    }else{
        [self.confirmButton setTitle:[NSString stringWithFormat:@"确认付款 %@ ",@"22.7"] forState:UIControlStateNormal];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

