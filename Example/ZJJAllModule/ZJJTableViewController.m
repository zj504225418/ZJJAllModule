//
//  ZJJTableViewController.m
//  ZJJAllModule_Example
//
//  Created by 赵静静 on 2020/8/16.
//  Copyright © 2020 zj504225418. All rights reserved.
//

#import "ZJJTableViewController.h"

@interface ZJJTableViewController ()

@property(strong,nonatomic)NSArray *dataArray;

@end

@implementation ZJJTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@{@"title":@"CALayer",
                         @"className":@"ZJJViewController"},
                       @{@"title":@"3D正方体",
                         @"className":@"ZJJTransform3DViewController"},
                         @{@"title":@"shaperLayer",
                         @"className":@"ZJJCAShaperLayerViewController"},
                       @{@"title":@"textLayer",
                         @"className":@"ZJJCATextLayerViewController"
                       },
                       @{@"title":@"渐变色GrradientLayre",
                         @"className":@"ZJJCAGrradientLayerViewController"
                       },
                       @{@"title":@"多图层--replicatorLayer",
                         @"className":@"ZJJCAReplicatorLayerViewController"
                       },
                       @{@"title":@"transformLayer",
                         @"className":@"ZJJCATransformLayerViewController"
                       },
                       @{@"title":@"粒子效果--emitterLayer",
                         @"className":@"ZJJCAEmitterLayerViewController"
                       },
                       @{@"title":@"点赞动画",
                         @"className":@"ZJJDianzanViewController"
                       },
                       @{@"title":@"动画Demon",
                         @"className":@"ZJJAnimationViewController"
                       },
//                       @{@"title":@"",
//                         @"className":@""
//                       }
//                       @{@"title":@"",
//                         @"className":@""
//                       }
    ];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdent = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdent];

    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdent];
    }
    NSDictionary *dic = self.dataArray[indexPath.row];
    cell.textLabel.text = dic[@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSDictionary *dic = self.dataArray[indexPath.row];
    NSString *className = dic[@"className"];
    Class class = NSClassFromString(className);
    UIViewController *vc = [[class alloc]init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
