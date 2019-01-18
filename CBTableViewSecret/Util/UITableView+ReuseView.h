//
//  UITableView+ReuseView.h
//  SimplifiedCellHeaderFooterOCDemo
//
//  Created by mac on 2018/3/3.
//  Copyright © 2018年 chenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FileType) {
    FileTypeClass,
    FileTypeNib,
};

@interface UITableView (ReuseView)

/**
 快速创建复用TableViewCell
 
 @param class 类型
 @param fileType 注册类型
 @return cell
 */
- (id)cellWithClass:(Class)class fileType:(FileType)fileType;

/**
 快速复用TableHeader或TableFooter
 
 @param nibClass xib的类型
 @return 复用的视图
 */
- (id)headerFooterFromNib:(Class)nibClass;

/**
 通过类创建快速复用TableHeader或TableFooter
 
 @param aClass 类型
 @return 得到的视图
 */
- (id)headerFooterFromClass:(Class)aClass;

@end
