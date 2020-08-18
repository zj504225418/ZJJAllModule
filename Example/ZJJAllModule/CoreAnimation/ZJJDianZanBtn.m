//
//  ZJJDianZanBtn.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/15.
//  Copyright © 2020 zj504225418. All rights reserved.
//  点赞按钮

#import "ZJJDianZanBtn.h"

@implementation ZJJDianZanBtn

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupExplosion];
    }
    return self;
}



-(void)layoutSubviews{
    // 发射源位置，开始设置时候按钮可能还没有尺寸，这个时候按钮才有尺寸
    self.explosionLayer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);

    [super layoutSubviews];
}

-(void)setupExplosion{
    //1、粒子
    CAEmitterCell *explosionCell = [CAEmitterCell emitterCell];

    explosionCell.name = @"explosioncell";
    //透明值变化速度
    explosionCell.alphaSpeed = -1;
//    explosionCell.birthRate = 1000;
    //alphRange透明值范围
    explosionCell.alphaRange = 0.1;
    //生命周期
    explosionCell.lifetime = 1;
    //生命周期range
    explosionCell.lifetimeRange = 0.1;
    //粒子速度
    explosionCell.velocity = 40;
    //粒子速度范围
    explosionCell.velocityRange = 10;
    //缩放比例
    explosionCell.scale = 0.08;
    //缩放比例rangge
    explosionCell.scaleRange = 0.02;
    //粒子照片
    explosionCell.contents = (id)[UIImage imageNamed:@"spark_red"].CGImage;

    CAEmitterLayer *explosionLayer = [CAEmitterLayer layer];
    [self.layer addSublayer:explosionLayer];

    self.explosionLayer = explosionLayer;
    //发射源尺寸大小
    explosionLayer.emitterSize = CGSizeMake(self.bounds.size.width + 40, self.bounds.size.height + 40);
    explosionLayer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    //粒子从什么形状发射出来
    explosionLayer.emitterShape = kCAEmitterLayerCircle;
    //发射模式,轮廓模式,从形状的边界上发射粒子
    explosionLayer.emitterMode = kCAEmitterLayerOutline;
    //渲染模式
    explosionLayer.renderMode = kCAEmitterLayerOldestFirst;
    //粒子数组
    explosionLayer.emitterCells = @[explosionCell];

}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];

    //通过关键帧动画实现缩放
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    //设置动画路径,缩放效果
    animation.keyPath = @"transform.scale";

    if (selected) {
        //从没有点击到点击状态，会有爆炸的动画,数组里面是动画变化的方式
        animation.values = @[@1.5,@5,@0.1,@1.0];
        //动画执行的总共时间
        animation.duration = 0.5;
        //计算关键帧方式
        animation.calculationMode = kCAAnimationCubic;
        [self.layer addAnimation:animation forKey:nil];

        //让放大动画执行完毕，再执行爆炸动画
        [self performSelector:@selector(startAnimation) withObject:nil afterDelay:0.25];
    }else{

        //从回到normal状态，停止动画
        [self stopAnimation];
    }
}

// 没有高亮状态
//- (void)setHighlighted:(BOOL)highlighted{
//
//    [super setHighlighted:highlighted];
//
//}

-(void)startAnimation{
    //用KVC设置颗粒个数,这个地方的explosioncell要和上面layer里面的cell的name一样才行
    [self.explosionLayer setValue:@1000 forKeyPath:@"emitterCells.explosioncell.birthRate"];
    //开始动画
    self.explosionLayer.beginTime = CACurrentMediaTime();

    //延迟停止动画
    [self performSelector:@selector(stopAnimation) withObject:nil afterDelay:1];

}

-(void)stopAnimation{

    //设置KVC设置颗粒个数
    [self.explosionLayer setValue:@0 forKeyPath:@"emitterCells.explosioncell.birthRate"];
    //移除动画
    [self.explosionLayer removeAllAnimations];
}



@end
