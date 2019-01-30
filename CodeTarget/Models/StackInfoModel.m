//
//  StackInfoModel.m
//  CodeTarget
//
//  Created by joker on 2019/1/21.
//  Copyright © 2019 joker. All rights reserved.
//

#import "StackInfoModel.h"

@implementation StackInfoModel

-(NSString *)description {
    NSString *info = [NSString stringWithFormat:@"StackInfoModel: addr: %@\n%@", self.memoryAddress, self.stackSymbols];
    return info;
}

@end
