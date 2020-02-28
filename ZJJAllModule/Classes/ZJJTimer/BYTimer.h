//
//  BYTimer.h
//  007---Dispatch_source
//
//  Created by 赵静静 on 2020/2/25.
//  Copyright © 2020 Cooci. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BYTimer : NSObject

+(BYTimer *)timerWithTimeInterval:(NSTimeInterval)timeInterval block:(void (^)(BYTimer *timer))block;

/// 开始
-(void)resume;

/// 取消定时器
-(void)cancel;

@end

NS_ASSUME_NONNULL_END
