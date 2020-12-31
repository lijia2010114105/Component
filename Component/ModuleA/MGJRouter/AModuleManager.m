//
//  AModuleManager.m
//  Component
//
//  Created by harsons on 2020/12/31.
//

#import "AModuleManager.h"

#import "AViewController.h"
#import "AAViewController.h"
#import "AAAViewController.h"

@implementation AModuleManager

+ (void)load {
    [MGJRouter registerURLPattern:MGJ_AVC toHandler:^(NSDictionary *routerParameters) {
        AViewController *vc = [AViewController new];
        [MGJ_NAV pushViewController:vc animated:NO];
    }];
    
    [MGJRouter registerURLPattern:MGJ_AAVC toHandler:^(NSDictionary *routerParameters) {
        AAViewController *vc = [AAViewController new];
        vc.des = [routerParameters[MGJRouterParameterUserInfo] objectForKey:@"des"];
        [MGJ_NAV pushViewController:vc animated:NO];
    }];
    
    [MGJRouter registerURLPattern:MGJ_AAAVC toHandler:^(NSDictionary *routerParameters) {
        AAAViewController *vc = [AAAViewController new];
        vc.des = [routerParameters[MGJRouterParameterUserInfo] objectForKey:@"des"];
        vc.backBlock = [routerParameters[MGJRouterParameterUserInfo] objectForKey:@"block"];
        [MGJ_NAV pushViewController:vc animated:NO];
    }];
}

/*
 
 url-blcok
 
 routes:
 {
     AAAViewController =     {
         "_" = "<__NSGlobalBlock__: 0x10290c0c0>";
     };
     AAViewController =     {
         "_" = "<__NSGlobalBlock__: 0x10290c0a0>";
     };
     AViewController =     {
         "_" = "<__NSGlobalBlock__: 0x10290c080>";
     };
 }
 */

@end
