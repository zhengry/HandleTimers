//
//  ViewController.m
//  ZZHandleTimers
//
//  Created by zry on 2018/4/21.
//  Copyright © 2018年 zry. All rights reserved.
//

#import "ViewController.h"
#import "ZZCountDownManger.h"
#import "ZZTimerCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *intervals;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.intervals = @[@(30*22),@(13*35),@(12*8),@(18*10),@(9*32),@(25*34),@(6*40),@(6*58),@(14*47),@(22*52)];
    [self configureTableView];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[ZZCountDownManger manager] startTimer];
    [self.tableView reloadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[ZZCountDownManger manager] stopTimer];
    
}

-(void)configureTableView
{
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds];
    table.backgroundColor = [UIColor clearColor];
    table.delegate = self;
    table.dataSource = self;
    table.rowHeight = 50;
    UIView *view = [UIView new];
    table.tableFooterView = view;
    
    [self.view addSubview:table];
    self.tableView = table;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.intervals.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZZTimerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (!cell) {
        cell = [[ZZTimerCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cellId"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell configCell:indexPath.row interval:[self.intervals[indexPath.row] integerValue]];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
