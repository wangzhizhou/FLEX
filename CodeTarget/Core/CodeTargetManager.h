//
//  CodeTargetManager.h
//  CodeTarget
//
//  Created by joker on 2019/1/21.
//  Copyright © 2019 joker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StackInfoModel;
@interface CodeTargetManager : NSObject

+ (instancetype)shareInstance;

- (void)addStackInfo:(StackInfoModel *)stackInfo;

- (NSArray<NSString *> *)getStackSymbolsForView: (UIView *)view;
@end
