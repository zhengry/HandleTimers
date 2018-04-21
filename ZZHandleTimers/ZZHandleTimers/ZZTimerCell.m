//
//  ZZTimerCell.m
//  ZZHandleTimers
//
//  Created by zry on 2018/4/21.
//  Copyright © 2018年 zry. All rights reserved.
//

#import "ZZTimerCell.h"

@interface ZZTimerCell()

@property (nonatomic, assign) NSTimeInterval totalInterval;
@end


@implementation ZZTimerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)configCell:(NSInteger)index interval:(NSInteger)interval
{
    self.totalInterval = interval;
    self.textLabel.text = [NSString stringWithFormat:@"第%ld个timer",index];
    self.detailTextLabel.text = [self stringFromInterval:interval];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTimer:) name:@"kTimerNotification" object:nil];
}

-(NSString *)stringFromInterval:(NSTimeInterval)interval
{
    NSInteger minute = (NSInteger)self.totalInterval / 60;
    NSInteger second = (NSInteger)self.totalInterval % 60;
    NSString *timeStr = [NSString stringWithFormat:@"%02ld:%02ld",(long)minute,(long)second];
    return timeStr;
}

-(void)handleTimer:(NSNotification *)notification
{
    //如果需要用到当前时间来进行比较和计算，取出当前时间的interval
//    NSDictionary *userInfo = notification.userInfo;
//    NSTimeInterval now = [userInfo[@"now"] integerValue];

    if (self.totalInterval >0) {
        self.totalInterval--;
        self.detailTextLabel.text = [self stringFromInterval:self.totalInterval];
    }else{
        self.detailTextLabel.text = @"倒计时已结束";
    }
   

}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
