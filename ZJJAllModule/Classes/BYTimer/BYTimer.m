//
//  BYTimer.m
//  007---Dispatch_source
//
//  Created by 赵静静 on 2020/2/25.
//  Copyright © 2020 Cooci. All rights reserved.
//

#import "BYTimer.h"

@interface BYTimer ()

@property (nonatomic, strong) dispatch_source_t source;
@property (nonatomic, strong) dispatch_queue_t queue;
@property (nonatomic) BOOL isRunning;
@property (copy, nonatomic) NSTimer *timer;

@property (copy, nonatomic)  void(^complateBlock)(BYTimer *timer);

@property (assign, nonatomic) NSTimeInterval timeInterval;

@end
@implementation BYTimer

+(BYTimer *)timerWithTimeInterval:(NSTimeInterval)timeInterval block:(void (^)(BYTimer *timer))block{

    BYTimer *timer = [[self alloc]init];
    timer.isRunning     = NO;
    timer.timeInterval = timeInterval;
    timer.source = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,dispatch_get_main_queue());

    uint64_t interval = (uint64_t)(timeInterval * NSEC_PER_SEC);
    dispatch_source_set_timer(timer.source, DISPATCH_TIME_NOW, interval, 0);

    dispatch_source_set_event_handler(timer.source, ^{

        if (block) {
            block(timer);
        }
    });

    return timer;
}

/// 开始/暂停
-(void)resume{
    if (self.isRunning) {//开始
        self.isRunning = NO;
        dispatch_suspend(self.source);
    }else{//暂停
        self.isRunning = YES;
        dispatch_resume(self.source);
    }
}

-(void)cancel{//取消

    if (!self.isRunning) {
        dispatch_resume(self.source);
    }
    dispatch_source_cancel(self.source);
}


@end
