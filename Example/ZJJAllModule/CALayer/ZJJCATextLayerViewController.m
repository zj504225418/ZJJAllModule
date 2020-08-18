//
//  ZJJCATextLayerViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/10.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJCATextLayerViewController.h"

@interface ZJJCATextLayerViewController ()

@property(strong,nonatomic)UILabel *labeView;

@end

@implementation ZJJCATextLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testTextLayer];
}

-(void)testTextLayer{
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = CGRectMake(50, 200, 200, 300);
    textLayer.backgroundColor = [UIColor yellowColor].CGColor;
    [self.view.layer addSublayer:textLayer];

    //set text attributes(设置text的属性)
    //字体颜色
    textLayer.foregroundColor = [UIColor blueColor].CGColor;
    //对齐方式
    textLayer.alignmentMode = kCAAlignmentJustified;
    //环绕在边界范围内,如果不设置为YES，就变成一行了
    textLayer.wrapped = YES;

    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    //设置Retina渲染,文本像素化的原因是没有咦Retina渲染，默认等于-1.需要传入合适的值，这样才能显示的更清晰
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    CGFontRelease(fontRef);

    NSString *str = @"d是发";

    NSMutableAttributedString *auttStr = [[NSMutableAttributedString alloc]initWithString:str];

    NSDictionary *dic = @{
                          NSForegroundColorAttributeName: [UIColor orangeColor],
                          NSFontAttributeName:[UIFont systemFontOfSize:15]
                          };
    [auttStr addAttributes:dic range:NSMakeRange(0, auttStr.length)];

    textLayer.string = str;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
