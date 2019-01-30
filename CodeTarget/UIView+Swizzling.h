//
//  UIView+Swizzling.h
//  CodeTarget
//
//  Created by joker on 2019/1/21.
//  Copyright © 2019 joker. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView(Swizzling)

@property (nonatomic) NSArray<NSString *> *stackInfo;

@end

NS_ASSUME_NONNULL_END
