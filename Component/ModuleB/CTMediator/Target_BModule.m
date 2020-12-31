//
//  Target_BModule.m
//  Component
//
//  Created by harsons on 2020/12/31.
//

#import "Target_BModule.h"

@implementation Target_BModule

- (BViewController *)Action_BVC:(NSDictionary *)para {
    BViewController *vc = [BViewController new];
    return vc;
}

- (BBViewController *)Action_BBVC:(NSDictionary *)para {
    BBViewController *vc = [BBViewController new];
    vc.des = para[@"des"];
    return vc;
}

- (BBBViewController *)Action_BBBVC:(NSDictionary *)para {
    BBBViewController *vc = [BBBViewController new];
    vc.des = para[@"des"];
    vc.backBlock = para[@"block"];
    return vc;
}

/*
    需要安装CTMediator里面的规则来
    1、这个中间类Target_BModule需要以 Target_ 开头
    2、方法以 Action_ 开头；
    3、需要参数 :(NSDictionary *)para
 
    也可以按照自己的规则实现CTMediator
 */

@end
