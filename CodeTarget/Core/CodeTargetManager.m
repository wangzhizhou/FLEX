//
//  CodeTargetManager.m
//  CodeTarget
//
//  Created by joker on 2019/1/21.
//  Copyright © 2019 joker. All rights reserved.
//

#import "CodeTargetManager.h"
#import "StackInfoModel.h"
#import "UIView+Swizzling.h"

@interface CodeTargetManager()
@property (nonatomic, strong) NSMutableDictionary<NSString *, StackInfoModel *> *stackInfo;
@end

@implementation CodeTargetManager

static CodeTargetManager *_instance = nil;

+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[CodeTargetManager alloc] init];
        _instance.stackInfo = [NSMutableDictionary dictionary];
    });
    return _instance;
}

- (void)addStackInfo:(StackInfoModel *)stackInfo {
    
    if(stackInfo.memoryAddress.length > 0 && stackInfo.stackSymbols.count > 0) {
        [self.stackInfo setValue:stackInfo forKey:stackInfo.memoryAddress];
    }
    
}

- (StackInfoModel *)getStackSymbolsForView: (UIView *)view {
    NSString *memeoryAddress = [NSString stringWithFormat:@"%p", view];
    return [self.stackInfo valueForKey:memeoryAddress];
}
@end
