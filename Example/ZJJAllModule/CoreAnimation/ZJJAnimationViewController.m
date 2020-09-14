//
//  ZJJAnimationViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/17.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJAnimationViewController.h"

@interface ZJJAnimationViewController ()


@property (weak, nonatomic)  CALayer *layer1;

@property (weak, nonatomic)  UIView *view1;

@property (weak, nonatomic)  CALayer *layer3;

@end

@implementation ZJJAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    for (int i = 0; i < 3; i++) {
        CGFloat height = 50;
        CGFloat bianju = 50;
        CGFloat wight = (kWindowWidth - bianju *4)/3;

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(50 + (bianju + wight)*i, 150, wight, height);
        [btn setTitle:[NSString stringWithFormat:@"按钮%d",i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor yellowColor];
        [btn addTarget:self action:@selector(clcickbutton:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        [self.view addSubview:btn];

        switch (i) {
            case 0:{

                CALayer *view = [CALayer layer];
                view.frame = CGRectMake(btn.frame.origin.x, btn.bottom + 50, wight, height*2);
                view.backgroundColor = [UIColor yellowColor].CGColor;
                [self.view.layer addSublayer:view];
                self.layer1 = view;

            }
                break;
            case 1:
            {
                UIView *view = [UIView new];
                view.frame = CGRectMake(btn.frame.origin.x, btn.bottom + 50, wight, height*2);
                view.layer.backgroundColor = [UIColor yellowColor].CGColor;
                [self.view addSubview:view];
                self.view1 = view;
            }

                break;
            case 2:{

                CALayer *layer = [CALayer layer];
                layer.frame = CGRectMake(btn.frame.origin.x, btn.bottom + 50, wight, height*2);
                layer.backgroundColor = [UIColor yellowColor].CGColor;
                [self.view.layer addSublayer:layer];
                self.layer3 = layer;

                CATransition *transition = [CATransition animation];
                transition.type = kCATransitionPush;
                transition.subtype = kCATransitionFromLeft;
                layer.actions = @{@"backgroundColor":transition};

            }

                break;

            default:
                break;
        }
    }

}

-(void)clcickbutton:(UIButton *)sender{


    switch (sender.tag) {
        case 0:
        {
        
            //动画只能对单独的layer有效，如果对view的layer进行处理是无用的
            [CATransaction begin];
            [CATransaction setAnimationDuration:2];
            //取消动画
            [CATransaction setDisableActions:YES];

            [CATransaction setCompletionBlock:^{
                self.layer1.backgroundColor = [UIColor purpleColor].CGColor;
                [CATransaction begin];
                [CATransaction setAnimationDuration:2];
                CGAffineTransform transform = self.layer1.affineTransform;
                transform = CGAffineTransformRotate(transform, M_PI_2);
                self.layer1.affineTransform = transform;
                [CATransaction commit];

            }];
            self.layer1.backgroundColor = [UIColor orangeColor].CGColor;
//            self.view1.backgroundColor = [UIColor orangeColor];

            [CATransaction commit];
        }
            break;
        case 1:
        {
            //只对UIView有用，但是对CALayer没有用
//            [UIView animateWithDuration:1 animations:^{
//                self.view1.backgroundColor = [UIColor orangeColor];
//            }];
//            [UIView animateWithDuration:1 animations:^{
////                self.layer1.backgroundColor = [UIColor orangeColor].CGColor;
//
//                self.view1.backgroundColor = [UIColor orangeColor];
//            } completion:^(BOOL finished) {
//                self.view1.backgroundColor = [UIColor yellowColor];
//
//            }];
            [UIView beginAnimations:@"12" context:nil];
            [UIView setAnimationDuration:2];
            //这个API没有用
            [UIView setAnimationDidStopSelector:@selector(animationStop)];
            //对layer无动画效果
            self.layer1.backgroundColor = [UIColor blackColor].CGColor;
            self.view1.backgroundColor = [UIColor blackColor];
            [UIView commitAnimations];
        }
            break;
        case 2:
        {
            [UIView animateWithDuration:1 animations:^{
                self.layer3.backgroundColor = [UIColor orangeColor].CGColor;
            } completion:^(BOOL finished) {

            }];
        }
            break;

        default:
            break;
    }
}

+(void)animationStop{
    NSLog(@"动画结束了");
//    self.view1.backgroundColor = [UIColor purpleColor];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [super touchesBegan:touches withEvent:event];

    CGPoint point  = [[touches anyObject] locationInView:self.view];
    if ([self.layer1.presentationLayer hitTest:point]) {
        //点在layer上变颜色，哪怕在移动过程中也可以变色，如果用的不是presentationLayer，则只能点击最终位置才能变色
        self.layer1.backgroundColor = [UIColor redColor].CGColor;
    }else{
        //如果不在layer上，则中心点移动到点击位置
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.layer1.position = point;
        [CATransaction commit];
    }
}

- (IBAction)clickBtn1:(UIButton *)sender {

}

- (IBAction)clickbtn2:(id)sender {


}

- (IBAction)clickbtn3:(id)sender {

}

@end
