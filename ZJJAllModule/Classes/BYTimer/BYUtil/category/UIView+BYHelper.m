//
//  UIView+BYHelper.m
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UIView+BYHelper.h"
#import "UIView+Layout.h"
#import <objc/runtime.h>
static char overviewKey;
@implementation UIView (BYHelper)



//创建line
+ (id)by_lineViewWith:(CGFloat)value isVertical:(BOOL)b withColor:(UIColor *)color{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    if (b) {
        view.frame = CGRectMake(0, 0, 1, value);
    }else{
        view.frame = CGRectMake(0, 0, value, 1);
    }
    return view;
}


-(void)by_makeRation:(CGFloat)radius{
    
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

/**
 *  给View变成圆形
 */
-(void)by_makeRound{
    
    self.layer.cornerRadius = self.width/2;
    self.layer.masksToBounds = YES;
}

//添加点击事件，点击执行block
- (void)by_setClickBlock:(void(^)(void))block{
    self.userInteractionEnabled = YES;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClick)];
    [self addGestureRecognizer:tap];
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY);
}
- (void)didClick
{
    void (^block)(void) =  objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block();
    }
}
@end
