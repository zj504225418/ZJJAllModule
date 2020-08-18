//
//  ZJJReflectionView.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/12.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJReflectionView.h"

@implementation ZJJReflectionView


+ (Class)layerClass
{
    return [CAReplicatorLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;

}

- (void)awakeFromNib
{
    [self setUp];

}

-(void)setUp
{

    CAReplicatorLayer *layer = (CAReplicatorLayer *)self.layer;
    layer.instanceCount = 2;

    CATransform3D transform = CATransform3DIdentity;
    //间隔
    CGFloat veticalOffset = self.bounds.size.height + 2;
    transform = CATransform3DTranslate(transform, 0, veticalOffset, 0);
    //翻转
    transform = CATransform3DScale(transform, -1, -1, 0);
    layer.instanceTransform = transform;

    //透明度=K-0.7= 0.3
    layer.instanceAlphaOffset = -0.7;
}


@end
