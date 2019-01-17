//
//  CBTableViewDisplayInfo.m
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "CBTableViewDisplayInfo.h"

@implementation CBTableViewCellDisplayRowInfo

- (instancetype)initWithCellHeight:(CGFloat)cellHeight autoCellHeight:(BOOL)shouldAutoCellHeight {
    self = [super init];
    if (self) {
        _shouldAutoCellHeight = shouldAutoCellHeight;
        _cellEstimatedHeight = cellHeight;
        _cellHeight = _shouldAutoCellHeight == YES ? UITableViewAutomaticDimension : cellHeight;
    }
    return self;
}

@end

@implementation CBTableViewCellDisplaySectionInfo

- (instancetype)initWithHeaderClass:(Class)headerClass
                       headerHeight:(CGFloat)headerHeight
                   autoHeaderHeight:(BOOL)autoHeaderHeight
                        footerClass:(Class)footerClass
                       footerHeight:(CGFloat)footerHeight
                   autoFooterHeight:(BOOL)autoFooterHeight
                               info:(id _Nullable)info
                          rowsBlock:(void(^)(NSMutableArray<CBTableViewCellDisplayRowInfo *>* rowsInfos))rowsBlock
                               desc:(NSString * _Nullable)desc {
    if (self) {
        _headerClass = headerClass;
        _footerClass = footerClass;
        _autoHeaderHeight = autoHeaderHeight;
        _autoFooterHeight = autoFooterHeight;
        _headerEstimatedHeight = headerHeight;
        _footerEstimatedHeight = footerHeight;
        _headerHeight = _autoHeaderHeight == YES ? UITableViewAutomaticDimension : headerHeight;
        _footerHeight = autoFooterHeight == YES ? UITableViewAutomaticDimension : footerHeight;
        _info = info;
        _listRow = [NSMutableArray array];
        rowsBlock(_listRow);
        _desc = desc;
    }
    return self;
}

- (instancetype)initWithHeaderHeight:(CGFloat)headerHeight
                   autoHeaderHeight:(BOOL)autoHeaderHeight
                       footerHeight:(CGFloat)footerHeight
                   autoFooterHeight:(BOOL)autoFooterHeight
                          rowsBlock:(void(^)(NSMutableArray<CBTableViewCellDisplayRowInfo *>* rowsInfos))rowsBlock {
    if (self) {
        _autoHeaderHeight = autoHeaderHeight;
        _autoFooterHeight = autoFooterHeight;
        _headerEstimatedHeight = headerHeight;
        _footerEstimatedHeight = footerHeight;
        _headerHeight = _autoHeaderHeight == YES ? UITableViewAutomaticDimension : headerHeight;
        _footerHeight = autoFooterHeight == YES ? UITableViewAutomaticDimension : footerHeight;
        _listRow = [NSMutableArray array];
        rowsBlock(_listRow);
    }
    return self;
}

@end

@implementation CBTableViewCellDisplayInfo

- (instancetype)initWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewCellDisplaySectionInfo *>* sectionInfos))sectionsBlock {
    if (self) {
        _listSection = [NSMutableArray array];
        sectionsBlock(_listSection);
    }
    return self;
}

@end
