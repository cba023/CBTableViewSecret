//
//  CBTableViewSecret.m
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "CBTableViewSecret.h"

@implementation CBTableViewSecret

- (instancetype)initWithDisplayModel:(CBTableViewDisplay *)displayModel tableView:(UITableView *)tableView {
    self = [super init];
    if (self) {
        _displayModel = displayModel;
        if (_displayModel.listSection.count > 0) {
            tableView.delegate = self;
            tableView.dataSource = self;
        }
    }
    return self;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger numberOfSection = _displayModel.listSection.count;
    return numberOfSection;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = _displayModel.listSection[section].listRow.count;
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat heightForHeader = _displayModel.listSection[section].headerHeight;
    return heightForHeader;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    CGFloat heightForHeader = _displayModel.listSection[section].headerEstimatedHeight;
    return heightForHeader;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    CGFloat heightForFooter = _displayModel.listSection[section].footerHeight;
    return heightForFooter;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    CGFloat heightForFooter = _displayModel.listSection[section].footerEstimatedHeight;
    return heightForFooter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat heightForRow = _displayModel.listSection[indexPath.section].listRow[indexPath.row].cellHeight;
    return heightForRow;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat heightForRow = _displayModel.listSection[indexPath.section].listRow[indexPath.row].cellHeight;
    return heightForRow;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CBTableViewSectionDisplay * mdSection = self.displayModel.listSection[indexPath.section];
    CBTableViewRowDisplay * mdRow = mdSection.listRow[indexPath.row];
    if (mdRow.cellForRowAtIndexPath) {
        return mdRow.cellForRowAtIndexPath(tableView, indexPath);
    }
    return [[UITableViewCell alloc] init];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CBTableViewSectionDisplay * mdSection = self.displayModel.listSection[section];
    if (mdSection.viewForHeader) {
        return mdSection.viewForHeader(tableView, section);
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    CBTableViewSectionDisplay * mdSection = self.displayModel.listSection[section];
    if (mdSection.viewForFooter) {
        return mdSection.viewForFooter(tableView, section);
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CBTableViewSectionDisplay * mdSection = self.displayModel.listSection[indexPath.section];
    CBTableViewRowDisplay * mdRow = mdSection.listRow[indexPath.row];
    if (mdRow.didSelectRowAtIndexPath) {
        mdRow.didSelectRowAtIndexPath(tableView, indexPath);
    }
}


@end
