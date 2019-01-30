//
//  StackInfoModel.h
//  CodeTarget
//
//  Created by joker on 2019/1/21.
//  Copyright © 2019 joker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StackInfoModel : NSObject
@property (nonatomic, copy) NSString *memoryAddress;
@property (nonatomic, weak) id view;
@property (nonatomic, strong) NSArray<NSString *> *stackSymbols;
@end

NS_ASSUME_NONNULL_END
