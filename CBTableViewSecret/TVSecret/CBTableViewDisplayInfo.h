//
//  CBTableViewDisplayInfo.h
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef UIView *(^ViewForHeaderInSectionBlock)(UITableView *tableView, NSInteger section, Class cls);
typedef UIView *(^ViewForFooterInSectionBlock)(UITableView *tableView, NSInteger section, Class cls);
typedef UITableViewCell* _Nullable (^CellForRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath, Class cls);
typedef void(^DidSelectRowAtIndexPathBlock)(UITableView *tableView, NSIndexPath *indexPath);


@interface CBTableViewCellDisplayRowInfo : NSObject

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign, readonly) CGFloat cellEstimatedHeight;
@property (nonatomic, strong, nullable) Class cellClass;
@property (nonatomic, copy, nullable) NSString * desc;
@property (nonatomic, strong, nullable) id info;
@property (nonatomic, assign) BOOL shouldAutoCellHeight;
@property (nonatomic, copy) CellForRowAtIndexPathBlock cellForRowAtIndexPath;
@property (nonatomic, copy) DidSelectRowAtIndexPathBlock didSelectRowAtIndexPath;

- (instancetype)initWithCellClass:(Class)cls cellHeight:(CGFloat)cellHeight autoCellHeight:(BOOL)shouldAutoCellHeight info:(id _Nullable)info desc:(NSString * _Nullable)desc;

@end

@interface CBTableViewCellDisplaySectionInfo : NSObject

@property (nonatomic , copy) NSMutableArray<CBTableViewCellDisplayRowInfo *>              * listRow;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, assign, readonly) CGFloat headerEstimatedHeight;
@property (nonatomic, assign, readonly) CGFloat footerEstimatedHeight;
@property (nonatomic, strong, nullable) Class headerClass;
@property (nonatomic, strong, nullable) Class footerClass;
@property (nonatomic, assign) BOOL autoHeaderHeight;
@property (nonatomic, assign) BOOL autoFooterHeight;
@property (nonatomic, copy, nullable) NSString * desc;
@property (nonatomic, strong, nullable) id info;
@property (nonatomic, copy) ViewForHeaderInSectionBlock viewForHeader;
@property (nonatomic, copy) ViewForFooterInSectionBlock viewForFooter;

- (instancetype)initWithHeaderClass:(Class)headerClass
                       headerHeight:(CGFloat)headerHeight
                   autoHeaderHeight:(BOOL)autoHeaderHeight
                        footerClass:(Class)footerClass
                       footerHeight:(CGFloat)footerHeight
                   autoFooterHeight:(BOOL)autoFooterHeight
                               info:(id _Nullable)info
                          rowsBlock:(void(^)(NSMutableArray<CBTableViewCellDisplayRowInfo *>* rowsInfos))rowsBlock
                               desc:(NSString * _Nullable)desc;
- (instancetype)initWithHeaderHeight:(CGFloat)headerHeight
                    autoHeaderHeight:(BOOL)autoHeaderHeight
                        footerHeight:(CGFloat)footerHeight
                    autoFooterHeight:(BOOL)autoFooterHeight
                           rowsBlock:(void(^)(NSMutableArray<CBTableViewCellDisplayRowInfo *>* rowsInfos))rowsBlock;

@end

@interface CBTableViewCellDisplayInfo : NSObject

@property (nonatomic, copy) NSMutableArray<CBTableViewCellDisplaySectionInfo *>              * listSection; 
- (instancetype)initWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewCellDisplaySectionInfo *>* sectionInfos))sectionsBlock ;

@end
