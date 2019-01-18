//
//  CBTableViewDisplayInfo.m
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "CBTableViewDisplayInfo.h"

@implementation CBTableViewRowDisplay

- (instancetype)initWithCellHeight:(CGFloat)cellHeight autoCellHeight:(BOOL)autoCellHeight {
    self = [super init];
    if (self) {
        _autoCellHeight = autoCellHeight;
        _cellEstimatedHeight = cellHeight;
        _cellHeight = _autoCellHeight == YES ? UITableViewAutomaticDimension : cellHeight;
    }
    return self;
}

+ (instancetype)displayWithCellHeight:(CGFloat)cellHeight autoCellHeight:(BOOL)autoCellHeight {
    return [[self alloc] initWithCellHeight:cellHeight autoCellHeight:autoCellHeight];
}

@end

@implementation CBTableViewSectionDisplay

- (instancetype)initWithHeaderHeight:(CGFloat)headerHeight autoHeaderHeight:(BOOL)autoHeaderHeight footerHeight:(CGFloat)footerHeight autoFooterHeight:(BOOL)autoFooterHeight rowsBlock:(void (^)(NSMutableArray<CBTableViewRowDisplay *> * rows))rowsBlock {
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

+ (instancetype)displayWithHeaderHeight:(CGFloat)headerHeight autoHeaderHeight:(BOOL)autoHeaderHeight footerHeight:(CGFloat)footerHeight autoFooterHeight:(BOOL)autoFooterHeight rowsBlock:(void (^)(NSMutableArray<CBTableViewRowDisplay *> * rows))rowsBlock {
    return [[self alloc] initWithHeaderHeight:headerHeight autoHeaderHeight:autoHeaderHeight footerHeight:footerHeight autoFooterHeight:autoFooterHeight rowsBlock:rowsBlock];
}

@end

@implementation CBTableViewDisplay

- (instancetype)initWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewSectionDisplay *>* sections))sectionsBlock {
    if (self) {
        _sections = [NSMutableArray array];
        sectionsBlock(_sections);
    }
    return self;
}

+ (instancetype)displayWithSectionsBlock:(void(^)(NSMutableArray<CBTableViewSectionDisplay *>* sections))sectionsBlock {
    return  [[self alloc] initWithSectionsBlock:sectionsBlock];
}

@end
