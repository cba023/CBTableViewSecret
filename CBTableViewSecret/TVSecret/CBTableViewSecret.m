//
//  CBTableViewSecret.m
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "CBTableViewSecret.h"
#import "CBTableViewDisplayInfo.h"

@implementation CBTableViewSecret

+ (instancetype)secretWithTableView:(UITableView *)tableView display:(CBTableViewDisplay *)display {
    return [[self alloc] initWithTableView:tableView display:display];
}

- (instancetype)initWithTableView:(UITableView *)tableView display:(CBTableViewDisplay *)display {
    self = [super init];
    if (self) {
        _display = display;
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    return self;
}

#pragma mark - UITableViewDelegate & UITableViewDataSource;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger numberOfSection = _display.sections.count;
    return numberOfSection;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numberOfRows = _display.sections[section].listRow.count;
    return numberOfRows;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CGFloat heightForHeader = _display.sections[section].headerHeight;
    return heightForHeader;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    CGFloat heightForHeader = _display.sections[section].headerEstimatedHeight;
    return heightForHeader;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    CGFloat heightForFooter = _display.sections[section].footerHeight;
    return heightForFooter;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    CGFloat heightForFooter = _display.sections[section].footerEstimatedHeight;
    return heightForFooter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat heightForRow = _display.sections[indexPath.section].listRow[indexPath.row].cellHeight;
    return heightForRow;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat heightForRow = _display.sections[indexPath.section].listRow[indexPath.row].cellHeight;
    return heightForRow;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CBTableViewSectionDisplay * mdSection = self.display.sections[indexPath.section];
    CBTableViewRowDisplay * mdRow = mdSection.listRow[indexPath.row];
    if (mdRow.cellForRowAtIndexPath) {
        return mdRow.cellForRowAtIndexPath(tableView, indexPath);
    }
    return [UITableViewCell new];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CBTableViewSectionDisplay * mdSection = self.display.sections[section];
    if (mdSection.viewForHeader) {
        return mdSection.viewForHeader(tableView, section);
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    CBTableViewSectionDisplay * mdSection = self.display.sections[section];
    if (mdSection.viewForFooter) {
        return mdSection.viewForFooter(tableView, section);
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CBTableViewSectionDisplay * mdSection = self.display.sections[indexPath.section];
    CBTableViewRowDisplay * mdRow = mdSection.listRow[indexPath.row];
    if (self.didSelectRowAtIndexPath) {
        self .didSelectRowAtIndexPath(tableView, indexPath);
    }
    if (mdRow.didSelectRowAtIndexPath) {
        mdRow.didSelectRowAtIndexPath(tableView, indexPath);
    }
}

@end
