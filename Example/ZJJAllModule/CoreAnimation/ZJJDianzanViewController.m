//
//  ZJJDianzanViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/15.
//  Copyright © 2020 zj504225418. All rights reserved.
//  点赞动画

#import "ZJJDianzanViewController.h"
#import "ZJJDianZanBtn.h"

@interface ZJJDianzanViewController ()

@end

@implementation ZJJDianzanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ZJJDianZanBtn *btn = [ZJJDianZanBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 50, 50);
    [btn setImage:[UIImage imageNamed:@"dislike"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"like_orange"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

-(void)clickBtn:(UIButton *)button{

    if (!button.selected) { // 点赞
        button.selected = !button.selected;
        NSLog(@"点赞");
    }else{ // 取消点赞
        button.selected = !button.selected;
        NSLog(@"取消赞");
    }
}

@end
