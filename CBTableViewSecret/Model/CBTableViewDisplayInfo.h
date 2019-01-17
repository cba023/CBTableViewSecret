//
//  CBTableViewDisplayInfo.h
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYModel.h>

@interface CBTableViewCellDisplayRowInfo : NSObject<YYModel>

@property (nonatomic, assign) CGFloat cellHeight;
@property (nonatomic, assign, readonly) CGFloat cellEstimatedHeight;
@property (nonatomic, strong, nullable) Class cellClass;
@property (nonatomic, copy, nullable) NSString * desc;
@property (nonatomic, strong, nullable) id info;
@property (nonatomic, assign) BOOL shouldAutoCellHeight;

- (instancetype)initWithCellClass:(Class)cls CellHeight:(CGFloat)cellHeight ShouldAutoCellHeight:(BOOL)shouldAutoCellHeight Info:(id _Nullable)info Desc:(NSString * _Nullable)desc;

@end

@interface CBTableViewCellDisplaySectionInfo : NSObject<YYModel>

@property (nonatomic , copy) NSMutableArray<CBTableViewCellDisplayRowInfo *>              * listRow;
@property (nonatomic, assign) CGFloat headerHeight;
@property (nonatomic, assign) CGFloat footerHeight;
@property (nonatomic, assign, readonly) CGFloat headerEstimatedHeight;
@property (nonatomic, assign, readonly) CGFloat footerEstimatedHeight;
@property (nonatomic, strong, nullable) Class headerClass;
@property (nonatomic, strong, nullable) Class footerClass;
@property (nonatomic, assign) BOOL shouldAutoHeaderHeight;
@property (nonatomic, assign) BOOL shouldAutoFooterHeight;
@property (nonatomic, copy, nullable) NSString * desc;
@property (nonatomic, strong, nullable) id info;

- (instancetype)initWithHeaderClass:(Class)headerClass
                       headerHeight:(CGFloat)headerHeight
                   autoHeaderHeight:(BOOL)shouldAutoHeaderHeight
                        footerClass:(Class)footerClass
                       footerHeight:(CGFloat)footerHeight
                   autoFooterHeight:(BOOL)shouldAutoFooterHeight
                               Info:(id _Nullable)info
                          rowsBlock:(void(^)(NSMutableArray<CBTableViewCellDisplayRowInfo *>* rowsInfos))rowsBlock
                               desc:(NSString * _Nullable)desc;

@end

@interface CBTableViewCellDisplayInfo : NSObject<YYModel>

@property (nonatomic, copy) NSMutableArray<CBTableViewCellDisplaySectionInfo *>              * listSection; 
- (instancetype)initWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewCellDisplaySectionInfo *>* sectionInfos))sectionsBlock ;

@end
