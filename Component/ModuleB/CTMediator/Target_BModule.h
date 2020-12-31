//
//  Target_BModule.h
//  Component
//
//  Created by harsons on 2020/12/31.
//

#import <Foundation/Foundation.h>

#import "BViewController.h"
#import "BBViewController.h"
#import "BBBViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface Target_BModule : NSObject

- (BViewController *)Action_BVC:(NSDictionary *)para;

- (BBViewController *)Action_BBVC:(NSDictionary *)para;

- (BBBViewController *)Action_BBBVC:(NSDictionary *)para;

@end

NS_ASSUME_NONNULL_END
