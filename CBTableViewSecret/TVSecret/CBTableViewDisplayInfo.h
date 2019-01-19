//
//  CBTableViewDisplayInfo.h
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBTableViewRowDisplay : NSObject

@property (nonatomic, assign, readonly) CGFloat cellHeight;
@property (nonatomic, assign, readonly) BOOL autoCellHeight;
@property (nonatomic, copy, readonly) UITableViewCell* (^cellForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) void(^didSelectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);

+ (instancetype)displayWithCellHeight:(CGFloat)cellHeight autoCellHeight:(BOOL)autoCellHeight cellForRowAtIndexPath: (UITableViewCell* (^)(UITableView *tableView, NSIndexPath *indexPath))cellForRowAtIndexPath;

@end

@interface CBTableViewSectionDisplay : NSObject

@property (nonatomic , copy) NSMutableArray<CBTableViewRowDisplay *>              * listRow;
@property (nonatomic, assign, readonly) CGFloat headerHeight;
@property (nonatomic, assign, readonly) CGFloat footerHeight;
@property (nonatomic, assign, readonly) BOOL autoHeaderHeight;
@property (nonatomic, assign, readonly) BOOL autoFooterHeight;
@property (nonatomic, copy) UIView *(^viewForHeader)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) UIView *(^viewForFooter)(UITableView *tableView, NSInteger section);

+ (instancetype)displayWithHeaderHeight:(CGFloat)headerHeight autoHeaderHeight:(BOOL)autoHeaderHeight footerHeight:(CGFloat)footerHeight autoFooterHeight:(BOOL)autoFooterHeight rowsBlock:(void (^)(NSMutableArray<CBTableViewRowDisplay *> * rows))rowsBlock;

@end

@interface CBTableViewDisplay : NSObject

@property (nonatomic, copy) NSMutableArray<CBTableViewSectionDisplay *>              * sections;

+ (instancetype)displayWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewSectionDisplay *>* sections))sectionsBlock;

@end
