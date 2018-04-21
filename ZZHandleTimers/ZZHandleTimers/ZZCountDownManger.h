//
//  ZZCountDownManger.h
//  ZZHandleTimers
//
//  Created by zry on 2018/4/21.
//  Copyright © 2018年 zry. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZZCountDownManger : NSObject

@property (nonatomic, assign) NSTimeInterval timeInterval;

+(instancetype)manager;

-(void)startTimer;

-(void)stopTimer;

@end
