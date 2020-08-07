//
//  ZJJViewController.m
//  ZJJAllModule
//
//  Created by zj504225418 on 02/28/2020.
//  Copyright (c) 2020 zj504225418. All rights reserved.
//

#import "ZJJViewController.h"

@interface ZJJViewController ()<CALayerDelegate>
@property (weak, nonatomic) IBOutlet UIView *subView;

@property (strong, nonatomic) CALayer *layer;
@end

@implementation ZJJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self testAddLayer];
//    [self testContentMode];
//    [self testContentsScale];
//    [self testCustDraw];
//    [self testBorder];
//    [self testShadow];
//    [self testShowPath];
    [self testMasks];
}

- (IBAction)clickBtn:(id)sender {


}

-(void)testAddLayer{

    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor clearColor].CGColor;
    UIImage *image = [UIImage imageNamed:@"AppIcon120x120"];
    layer.contents = (__bridge id)image.CGImage;
    layer.frame = CGRectMake(20, 20, 100, 100);
    [self.subView.layer addSublayer:layer];
    self.layer = layer;
}

-(void)testContentMode{
//    self.layer.frame = CGRectMake(0, 0, 100, 100);
    /*
     kCAGravityCenter:按照图片像素展示，图片中心点和layer中心点相同
     kCAGravityTop:按照图片像素展示，图片x轴中心与layer相同，底部和layer底部对齐
     kCAGravityBottom：按照图片像素展示，图片x轴中心与layer相同，顶部和layer顶部对齐
     kCAGravityLeft：按照图片像素展示，图片y轴中心与layer相同，左边和layer左边对齐
     kCAGravityRight：按照图片像素展示，图片y轴中心与layer相同，右边和layer右边对齐
     kCAGravityTopLeft：按照图片像素展示，图片左下角和layer左下角对齐
     kCAGravityTopRight：按照图片像素展示，图片右下角和layer右下角对齐
     kCAGravityBottomLeft：按照图片像素展示，图片左上角和layer左上角对齐
     kCAGravityBottomRight：按照图片像素展示，图片右上角和layer右上角对齐
     kCAGravityResize：填充满layer，拉伸图片
     kCAGravityResizeAspect：按照layer的最短边充满layer
     kCAGravityResizeAspectFill：按照layer的最长边充满layer，不拉伸图片
     */
    self.layer.contentsGravity = kCAGravityCenter;
}

-(void)testContentsScale{
    /*属性定义了寄宿图的像素尺寸和视图大小的比例，默认情况下它 是一个值为1.0的浮点数
     设置为1.0，将会以每个点1个像素绘制图片，
     如果设置为 2.0，则会以每个点2个像素绘制图片，这就是我们熟知的Retina屏幕
     这并不会对我们在使用kCAGravityResizeAspect时产生任何影响，
     因为它就是拉伸 图片以适应图层而已，根本不会考虑到分辨率问题。
     但是如果我们把 contentsGravity 设置为kCAGravityCenter这种不会拉伸图片的值的话，
     那将会有很明显的变化
     当用代码的方式来处理寄宿图的时候，一定要记住要手动的设置图层的 contentsScale 属性，否则，你的图片在Retina设备上就显示得不正确啦
     layer.contentsScale = [UIScreen mainScreen].scale;

     */
    self.layer.contentsScale = 2;
}

-(void)testContentReect{
    /*
     CALayer的 contentsRect 属性允许我们在图层边框里显示寄宿图的一个子域
     */
    self.layer.contentsRect = CGRectMake(0.5, 0.5, 0.5, 0.5);
}

-(void)testCustDraw{
    self.layer.delegate = self;
    [self.layer display];
}

/*
 如果代理不实现 -displayLayer:方法,系统就会调drawLayer：inContext方法
 */

//-(void)displayLayer:(CALayer *)layer{
//
//}

-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    //draw a thick red circle
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

       //get touch position
       CGPoint point = [[touches anyObject] locationInView:self.view];
       //get touched layer
       CALayer *layer = [self.subView.layer hitTest:point];
       //get layer using hitTest
       if (layer == self.layer) {
           NSLog(@"点击到了layer上");
       } else {
           NSLog(@"没点击到layer上");
    }
}

-(void)testBorder{


//    self.layer.cornerRadius = 10;
//    //如果把masksToBounds设置成YES的话，图层里面的所有东西都会被截取
//    self.layer.masksToBounds = YES;

    self.layer.borderColor = [UIColor orangeColor].CGColor;
    self.layer.borderWidth = 5;

}
/*
阴影通常就是在 Layer的边界之外，如果你开启了 masksToBounds属性，
 所有从图层中突出来的 内容都会被才剪掉
 如果你想沿着内容裁切，你需要用到两个图层:一个只画阴影的空的外图层，和一个用masksToBounds 裁剪内容的内图层。
 我们只把阴影用在最外层的视图上，内层视图进行裁剪。
 */
-(void)testShadow{

    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor clearColor].CGColor;
    layer.frame = self.layer.bounds;
    UIImage *image = [UIImage imageNamed:@"AppIcon120x120"];
    layer.contents = (__bridge id)image.CGImage;
    [self.layer addSublayer:layer];

    layer.cornerRadius = 10;
    layer.masksToBounds = YES;
    /*    给shadowOpacity 属性一个大于默认值(也就是0)的值，阴影就可以显示在任意图层之下
       shadowOpacity是一个必须在0.0(不可见)和1.0(完全不透 明)之间的浮点数。
       如果设置为1.0，将会显示一个有轻微模糊的黑色阴影稍微在图层之上
       如果设置为小于1，那么阴影会比较浅
    */
    self.layer.shadowOpacity = 1;

    self.layer.shadowColor = [UIColor yellowColor].CGColor;
    /*
     宽度控制这阴影横向的位移，高度控制着纵向的位移。
     shadowOffset 的默认值是 {0, -3}，意即阴影相对于Y轴有3个点的向上位移。
     当设置为{0,0}时候layer的四种会均匀的显示出阴影
     */
    self.layer.shadowOffset = CGSizeMake(10, 10);
    /*
     属性控制着阴影的模糊度，当它的值是0的时候，阴影就和视图 一样有一个非常确定的边界线。
     当值越来越大的时候，边界线看上去就会越来越模 糊和自然
     */
    self.layer.shadowRadius = 10;
}
/*
 我们已经知道图层阴影并不总是方的，而是从图层内容的形状继承而来。这看上
 去不错，但是实时计算阴影也是一个非常消耗资源的，尤其是图层有多个子图层，
 每个图层还有一个有透明效果的寄宿图的时候。

 如果你事先知道你的阴影形状会是什么样子的，你可以通过指定一个shadowPath 来提高性能。
 shadowPath 是一个 CGPathRef 类型(一个指向CGPath 的指针)。
 CGPath 是一个Core Graphics对象，用来指定任意的一个 矢量图形。
 我们可以通过这个属性单独于图层形状之外指定阴影的形状

 如果是一个矩形或者是圆，用 CGPath会相当简单明了。
 但是如果是更加复杂一 点的图形，
 UIBezierPath类会更合适，它是一个由UIKit提供的在CGPath基础上 的Objective-C包装类。

 */
-(void)testShowPath{

    //enable layer shadows
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowOpacity = 0.5f;
    //创建一个方形阴影
    CGMutablePathRef squarePath = CGPathCreateMutable();
    CGPathAddRect(squarePath, NULL, CGRectMake(-25, -25, self.layer.frame.size.width + 50, self.layer.frame.size.height + 50));
    self.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
     //创建一个圆形阴影
//    CGMutablePathRef circlePath = CGPathCreateMutable();
//    CGPathAddEllipseInRect(circlePath, NULL, CGRectMake(-25, -25, self.layer.frame.size.width + 50, self.layer.frame.size.height + 50));
//    self.layer.shadowPath = circlePath;
//    CGPathRelease(circlePath);

}
/*
 CALayer有一个属性叫做 mask可以解决这个问题。这个属性本身就是个 CALayer类型，有和其他图层一样的绘制和布局属性。它类似于一个子图层，相对于父图层(即拥有该属性的图层)布局，但是它却不是一个普通的子图层。不同于那些绘制在父图层中的子图层，mask 图层定义了父图层的部分可见区域。
 mask图层的 Color属性是无关紧要的，真正重要的是图层的轮廓。
 mask 属 性就像是一个饼干切割机， mask 图层实心的部分会被保留下来，其他的则会被抛 弃。

 如果 mask 图层比父图层要小，只有在 mask 图层里面的内容才是它关心的， 除此以外的一切都会被隐藏起来
 */
-(void)testMasks{

      CALayer *maskLayer = [CALayer layer];
      maskLayer.frame = self.layer.frame;
      UIImage *maskImage = [UIImage imageNamed:@"AppIcon120x120"];
      maskLayer.contents = (__bridge id)maskImage.CGImage;
    //apply mask to image layer
      self.subView.layer.mask = maskLayer;
}

@end
