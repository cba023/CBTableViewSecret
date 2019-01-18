//
//  CBUtil.h
//  CBTableViewSecret
//
//  Created by flowerflower on 2019/1/18.
//  Copyright © 2019 陈波. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface CBUtil : NSObject

+ (id)loadXibByName:(NSString *)name;
+ (NSDictionary *)getDataFromJsonPath:(NSString *)path fileType:(NSString * _Nullable)fileType;

@end

NS_ASSUME_NONNULL_END
