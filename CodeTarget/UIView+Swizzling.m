//
//  UIView+Swizzling.m
//  CodeTarget
//
//  Created by joker on 2019/1/21.
//  Copyright © 2019 joker. All rights reserved.
//

#import "UIView+Swizzling.h"
#import <objc/runtime.h>
#import "CodeTargetManager.h"
#import "StackInfoModel.h"

@implementation UIView(Swizzling)

- (void)setStackInfo:(NSArray<NSString *> *)stackInfo {
    objc_setAssociatedObject(self, @selector(stackInfo), stackInfo, OBJC_ASSOCIATION_RETAIN);
}

- (NSArray<NSString *> *)stackInfo {
    return objc_getAssociatedObject(self, @selector(stackInfo));
}

+(void)load {
    [self swizzlingMethod:@selector(init) WithMethod:@selector(swizzlingInit)];
    [self swizzlingMethod:@selector(initWithFrame:) WithMethod:@selector(swizzlingInitWithFrame:)];
}

+ (void)swizzlingMethod:(SEL)selector1 WithMethod: (SEL) selector2 {
    
    Method method1 = class_getInstanceMethod(self.class, selector1);
    Method method2 = class_getInstanceMethod(self.class, selector2);
    
    if(!class_addMethod(self.class, selector2, method_getImplementation(method2), method_getTypeEncoding(method2))) {
        method_exchangeImplementations(method1, method2);
    }
}
- (instancetype)swizzlingInit {
    return [self collectStackInfoFor:[self swizzlingInit]];
}

- (instancetype)swizzlingInitWithFrame: (CGRect) frame {
    return [self collectStackInfoFor:[self swizzlingInitWithFrame:frame]];
}

- (instancetype) collectStackInfoFor:(UIView *)view {
    if(view) {
        
        // 方案1： 存入对象结合属性
        view.stackInfo = [NSThread callStackSymbols];
        
        // 方案2： 存入单例
        StackInfoModel *stackModel = [StackInfoModel new];
        stackModel.memoryAddress = [NSString stringWithFormat:@"%p", view];
        stackModel.stackSymbols = [NSThread callStackSymbols];
        stackModel.view = view;
        [[CodeTargetManager shareInstance] addStackInfo:stackModel];
        
        
        // 感觉方案1会简单很多，方案2扩展性好， 需要实现一个选择视图的功能
        
        // 只能收集到从代码创建的视图的栈信息
        
    }
    return view;
}
@end
