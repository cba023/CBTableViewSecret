//
//  NewsModel.m
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "NewsModel.h"

@implementation Ext_action

@end
@implementation Ext_data

@end
@implementation Newslist

@end
@implementation NewsModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"newsList":[Newslist class]};
}

@end

