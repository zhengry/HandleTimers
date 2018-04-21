//
//  ZZCountDownManger.m
//  ZZHandleTimers
//
//  Created by zry on 2018/4/21.
//  Copyright © 2018年 zry. All rights reserved.
//

#import "ZZCountDownManger.h"

@interface ZZCountDownManger()
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ZZCountDownManger

+(instancetype)manager
{
    static ZZCountDownManger *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ZZCountDownManger alloc]init];
    });
    
    return manager;
}



-(void)startTimer
{
    [self timer];
}

-(NSTimer *)timer
{
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
    return _timer;
}

//计算当前时间
-(void)countDown
{
    //单位是秒
    self.timeInterval = ([[NSDate date] timeIntervalSince1970]);
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kTimerNotification" object:nil userInfo:@{@"now": @(self.timeInterval)}];
}


-(void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
    self.timeInterval = 0;
}


@end
