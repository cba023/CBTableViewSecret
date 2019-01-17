//
//  CBTableViewDisplayInfo.m
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "CBTableViewDisplayInfo.h"

@implementation CBTableViewRowDisplay

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

@implementation CBTableViewSectionDisplay

- (instancetype)initWithHeaderHeight:(CGFloat)headerHeight autoHeaderHeight:(BOOL)autoHeaderHeight footerHeight:(CGFloat)footerHeight autoFooterHeight:(BOOL)autoFooterHeight rowsBlock:(void (^)(NSMutableArray<CBTableViewRowDisplay *> *))rowsBlock {
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

@implementation CBTableViewDisplay

- (instancetype)initWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewSectionDisplay *>* sectionInfos))sectionsBlock {
    if (self) {
        _sections = [NSMutableArray array];
        sectionsBlock(_sections);
    }
    return self;
}

@end
