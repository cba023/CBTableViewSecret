//
//  UITableView+ReuseView.m
//  SimplifiedCellHeaderFooterOCDemo
//
//  Created by mac on 2018/3/3.
//  Copyright © 2018年 chenbo. All rights reserved.
//

#import "UITableView+ReuseView.h"

@implementation UITableView (ReuseView)

- (id)cellWithClass:(Class)class fileType:(FileType)fileType {
    NSString *classString = [self getClassNameWithClass:class];
    id cell = [self dequeueReusableCellWithIdentifier:classString];
    if (!cell) {
        switch (fileType) {
            case FileTypeNib:
                cell = ([[NSBundle mainBundle] loadNibNamed:classString owner:nil options:nil].firstObject);
                break;
            case FileTypeClass:
                cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:classString];
                break;
            default:
                break;
        }
    }
    return cell;
}

/** 根据xib创建header或footer */
- (id)headerFooterFromNib:(Class)nibClass {
    NSString *classString = [self getClassNameWithClass:nibClass];
    UIView *headerFooter = [self dequeueReusableHeaderFooterViewWithIdentifier:classString];
    if (!headerFooter) {
        headerFooter = [[NSBundle mainBundle] loadNibNamed:classString owner:nil options:nil].firstObject;
    }
    return headerFooter;
}

/** 通过类注册创建header或footer */
- (id)headerFooterFromClass:(Class)aClass {
    NSString *classString = [self getClassNameWithClass:aClass];
    UIView *headerFooter = [self dequeueReusableHeaderFooterViewWithIdentifier:classString];
    if (!headerFooter) {
        headerFooter = [[aClass alloc] initWithReuseIdentifier:classString];
    }
    return headerFooter;
}

/** 快速获取类名 */
- (NSString *)getClassNameWithClass:(Class)aClass {
    return NSStringFromClass(aClass);
}

@end
