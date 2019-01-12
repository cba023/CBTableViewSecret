//
//  CBTableViewDisplayInfo.m
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "CBTableViewDisplayInfo.h"

@implementation CBTableViewCellDisplayRowInfo

- (instancetype)initWithCellClass:(Class)cls CellHeight:(CGFloat)cellHeight ShouldAutoCellHeight:(BOOL)shouldAutoCellHeight Info:(id _Nullable)info Desc:(NSString * _Nullable)desc {
    self = [super init];
    if (self) {
        _cellClass = cls;
        _shouldAutoCellHeight = shouldAutoCellHeight;
        _cellEstimatedHeight = cellHeight;
        _cellHeight = _shouldAutoCellHeight == YES ? UITableViewAutomaticDimension : cellHeight;
        _info = info;
        _desc = desc;
    }
    return self;
}

@end

@implementation CBTableViewCellDisplaySectionInfo

- (instancetype)initWithHeaderClass:(Class)headerClass HeaderHeight:(CGFloat)headerHeight ShouldAutoHeaderHeight:(BOOL)shouldAutoHeaderHeight FooterClass:(Class)footerClass FooterHeight:(CGFloat)footerHeight ShouldAutoFooterHeight:(BOOL)shouldAutoFooterHeight Info:(id _Nullable)info ListRow:(NSMutableArray<CBTableViewCellDisplayRowInfo *>*)listRow Desc:(NSString * _Nullable)desc {
    if (self) {
        _headerClass = headerClass;
        _footerClass = footerClass;
        _shouldAutoHeaderHeight = shouldAutoHeaderHeight;
        _shouldAutoFooterHeight = shouldAutoFooterHeight;
        _headerEstimatedHeight = headerHeight;
        _footerEstimatedHeight = footerHeight;
        _headerHeight = _shouldAutoHeaderHeight == YES ? UITableViewAutomaticDimension : headerHeight;
        _footerHeight = shouldAutoFooterHeight == YES ? UITableViewAutomaticDimension : footerHeight;
        _info = info;
        _listRow = listRow;
        _desc = desc;
    }
    return self;
}

@end

@implementation CBTableViewCellDisplayInfo

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"list" : [CBTableViewCellDisplaySectionInfo class]
             };
}

@end
