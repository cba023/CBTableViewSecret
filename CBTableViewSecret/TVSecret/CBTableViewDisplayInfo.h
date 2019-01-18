//
//  CBTableViewDisplayInfo.h
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBTableViewRowDisplay : NSObject

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign, readonly) CGFloat cellEstimatedHeight;
@property (nonatomic, assign) BOOL autoCellHeight;
@property (nonatomic, copy) UITableViewCell* (^cellForRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);
@property (nonatomic, copy) void(^didSelectRowAtIndexPath)(UITableView *tableView, NSIndexPath *indexPath);

+ (instancetype)displayWithCellHeight:(CGFloat)cellHeight autoCellHeight:(BOOL)autoCellHeight;

@end

@interface CBTableViewSectionDisplay : NSObject

@property (nonatomic , copy) NSMutableArray<CBTableViewRowDisplay *>              * listRow;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, assign, readonly) CGFloat headerEstimatedHeight;
@property (nonatomic, assign, readonly) CGFloat footerEstimatedHeight;
@property (nonatomic, assign) BOOL autoHeaderHeight;
@property (nonatomic, assign) BOOL autoFooterHeight;
@property (nonatomic, copy) UIView *(^viewForHeader)(UITableView *tableView, NSInteger section);
@property (nonatomic, copy) UIView *(^viewForFooter)(UITableView *tableView, NSInteger section);

+ (instancetype)displayWithHeaderHeight:(CGFloat)headerHeight autoHeaderHeight:(BOOL)autoHeaderHeight footerHeight:(CGFloat)footerHeight autoFooterHeight:(BOOL)autoFooterHeight rowsBlock:(void (^)(NSMutableArray<CBTableViewRowDisplay *> * rows))rowsBlock;

@end

@interface CBTableViewDisplay : NSObject

@property (nonatomic, copy) NSMutableArray<CBTableViewSectionDisplay *>              * sections;
- (instancetype)initWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewSectionDisplay *>* sections))sectionsBlock ;
+ (instancetype)displayWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewSectionDisplay *>* sections))sectionsBlock;

@end
