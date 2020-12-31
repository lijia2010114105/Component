//
//  AAAViewController.h
//  Component
//
//  Created by harsons on 2020/12/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AAAViewController : UIViewController

@property (nonatomic, strong) NSString *des;
@property (nonatomic, copy) void(^backBlock)(NSString *des);

@end

NS_ASSUME_NONNULL_END
