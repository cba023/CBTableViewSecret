//
//  CBTableViewDisplayInfo.h
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView *(^ViewForHeaderInSectionBlock)(UITableView *tableView, NSInteger section);
typedef UIView *(^ViewForFooterInSectionBlock)(UITableView *tableView, NSInteger section);
typedef UITableViewCell* _Nullable (^CellForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef void(^DidSelectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);


@interface CBTableViewRowDisplay : NSObject

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign, readonly) CGFloat cellEstimatedHeight;
@property (nonatomic, strong, nullable) Class cellClass;
@property (nonatomic, assign) BOOL shouldAutoCellHeight;
@property (nonatomic, copy) CellForRowAtIndexPathBlock cellForRowAtIndexPath;
@property (nonatomic, copy) DidSelectRowAtIndexPathBlock didSelectRowAtIndexPath;

- (instancetype)initWithCellHeight:(CGFloat)cellHeight autoCellHeight:(BOOL)shouldAutoCellHeight;

@end

@interface CBTableViewSectionDisplay : NSObject

@property (nonatomic , copy) NSMutableArray<CBTableViewRowDisplay *>              * listRow;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, assign, readonly) CGFloat headerEstimatedHeight;
@property (nonatomic, assign, readonly) CGFloat footerEstimatedHeight;
@property (nonatomic, assign) BOOL autoHeaderHeight;
@property (nonatomic, assign) BOOL autoFooterHeight;
@property (nonatomic, copy) ViewForHeaderInSectionBlock viewForHeader;
@property (nonatomic, copy) ViewForFooterInSectionBlock viewForFooter;

- (instancetype)initWithHeaderHeight:(CGFloat)headerHeight autoHeaderHeight:(BOOL)autoHeaderHeight footerHeight:(CGFloat)footerHeight autoFooterHeight:(BOOL)autoFooterHeight rowsBlock:(void (^)(NSMutableArray<CBTableViewRowDisplay *> * rows))rowsBlock;
+ (instancetype)displayWithHeaderHeight:(CGFloat)headerHeight autoHeaderHeight:(BOOL)autoHeaderHeight footerHeight:(CGFloat)footerHeight autoFooterHeight:(BOOL)autoFooterHeight rowsBlock:(void (^)(NSMutableArray<CBTableViewRowDisplay *> * rows))rowsBlock;

@end

@interface CBTableViewDisplay : NSObject

@property (nonatomic, copy) NSMutableArray<CBTableViewSectionDisplay *>              * sections;
- (instancetype)initWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewSectionDisplay *>* sections))sectionsBlock ;
+ (instancetype)displayWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewSectionDisplay *>* sections))sectionsBlock;

@end
