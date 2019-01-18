//
//  CBUtil.m
//  CBTableViewSecret
//
//  Created by flowerflower on 2019/1/18.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "CBUtil.h"
#import <UIKit/UIKit.h>

@implementation CBUtil

+ (id)loadXibByName:(NSString *)name {
    id view = [[NSBundle mainBundle] loadNibNamed:name owner:self options:nil].firstObject;
    return view;
}

+ (NSDictionary *)getDataFromJsonPath:(NSString *)path fileType:(NSString * _Nullable)fileType {
    NSError *error;
    NSString * jsonPath = [[NSBundle mainBundle] pathForResource:path ofType:fileType];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:jsonPath] options:NSJSONReadingMutableLeaves error:&error];
    return jsonDic;
}


@end
