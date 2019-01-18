//
//  CBSecretVC.m
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "CBSecretVC.h"
#import "CBTableViewSecret.h"
#import "NewsModel.h"
#import "PersonModel.h"
#import "AppliancesModel.h"
#import "NewsListTableHeaderView.h"
#import "NewsListTableFooterView.h"
#import "AppliancesTableHeaderView.h"
#import "NewsListTableViewCell.h"
#import "AppliancesTableViewCell.h"
#import "UITableView+ReuseView.h"
#import "PersonTCell.h"
#import "AnimalTCell.h"
#import "CBUtil.h"

@interface CBSecretVC ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CBTableViewSecret *tvSecret;
@property (nonatomic, strong) NewsModel * newsModel;
@property (nonatomic, strong) PersonModel * personModel;
@property (nonatomic, strong) AppliancesModel *appliancesModel;

@end

@implementation CBSecretVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Secret现代写法";
    [self configUI];
    [self configData];
    [self display];
}

- (void)configUI {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
}

/// 配置数据
- (void)configData {
    NSDictionary *dicNews = [CBUtil getDataFromJsonPath:@"NewsList" fileType:@"json"];
    self.newsModel = [NewsModel yy_modelWithDictionary:dicNews];
    NSDictionary *dicPerson = [CBUtil getDataFromJsonPath:@"Person" fileType:@"json"];
    self.personModel = [PersonModel yy_modelWithDictionary:dicPerson];
    NSDictionary *dicAppliances = [CBUtil getDataFromJsonPath:@"Appliances" fileType:@"json"];
    self.appliancesModel = [AppliancesModel yy_modelWithDictionary:dicAppliances];
}

- (void)display {
    CBTableViewDisplay *display = [CBTableViewDisplay displayWithSectionsBlock:^(NSMutableArray<CBTableViewSectionDisplay *> *sections) {
        // 1.News
        CBTableViewSectionDisplay *sec0 = [CBTableViewSectionDisplay displayWithHeaderHeight:45.0 autoHeaderHeight:NO footerHeight:50.0 autoFooterHeight:NO rowsBlock:^(NSMutableArray<CBTableViewRowDisplay *> *rows) {
            for (NSInteger i = 0; i < self.newsModel.newslist.count; i++) {
                CBTableViewRowDisplay * row = [CBTableViewRowDisplay displayWithCellHeight:60.0 autoCellHeight:YES cellForRowAtIndexPath:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
                    NewsListTableViewCell *cell = [tableView cellWithClass:[NewsListTableViewCell class] fileType:FileTypeNib];
                    cell.lblTitle.text = self.newsModel.newslist[i].title;
                    cell.lblSubTitle.text = self.newsModel.newslist[i].source;
                    return cell;
                }];
                row.didSelectRowAtIndexPath = ^(UITableView *tableView, NSIndexPath *indexPath) {
                    NSLog(@"新闻列表点击 - %ld - %ld -", indexPath.section, indexPath.row);
                };
                [rows addObject:row];
            }
        }];
        sec0.viewForHeader = ^UIView *(UITableView *tableView, NSInteger section) {
            NewsListTableHeaderView *header = [tableView headerFooterFromNib:[NewsListTableHeaderView class]];
            header.lblTitle.text = @"新闻列表";
            return header;
        };
        sec0.viewForFooter = ^UIView *(UITableView *tableView, NSInteger section) {
            NewsListTableFooterView * footer = [tableView headerFooterFromNib:[NewsListTableFooterView class]];
            footer.lblDesc.text = @"上面是新闻";
            return footer;
        };
        // 2.Appliances
        CBTableViewSectionDisplay *sec1 = [CBTableViewSectionDisplay displayWithHeaderHeight:90.0 autoHeaderHeight:NO footerHeight:CGFLOAT_MIN autoFooterHeight:NO rowsBlock:^(NSMutableArray<CBTableViewRowDisplay *> *rows) {
            CBTableViewRowDisplay *row = [CBTableViewRowDisplay displayWithCellHeight:100.0 autoCellHeight:NO cellForRowAtIndexPath:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
                AppliancesTableViewCell *cell = [tableView cellWithClass:[AppliancesTableViewCell class] fileType:FileTypeNib];
                AppliancesModel *md = self.appliancesModel;
                cell.lblName.text = md.name;
                cell.lblColor.text = md.color;
                cell.lblPrice.text = [NSString stringWithFormat:@"%.2f",md.price];
                return cell;
            }];
            [rows addObject:row];
        }];
        sec1.viewForHeader = ^UIView *(UITableView *tableView, NSInteger section) {
            AppliancesTableHeaderView *header = [tableView headerFooterFromNib:[AppliancesTableHeaderView class]];
            header.lblName.text = @"这里的电器";
            return header;
        };
        // 3. Animal & Person
        CBTableViewSectionDisplay *sec2 = [CBTableViewSectionDisplay displayWithHeaderHeight:50.0 autoHeaderHeight:NO footerHeight:CGFLOAT_MIN autoFooterHeight:NO rowsBlock:^(NSMutableArray<CBTableViewRowDisplay *> *rows) {
            CBTableViewRowDisplay *row0 = [CBTableViewRowDisplay displayWithCellHeight:self.tableView.bounds.size.width / 16.0 * 9.0 autoCellHeight:NO cellForRowAtIndexPath:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
                AnimalTCell *cell = [tableView cellWithClass:[AnimalTCell class] fileType:FileTypeNib];
                return cell;
            }];
            CBTableViewRowDisplay *row1 = [CBTableViewRowDisplay displayWithCellHeight:80.0 autoCellHeight:NO cellForRowAtIndexPath:^UITableViewCell *(UITableView *tableView, NSIndexPath *indexPath) {
                PersonTCell * cell = [tableView cellWithClass:[PersonTCell class] fileType:FileTypeClass];
                cell.lblName.text = @"张三";
                return cell;
            }];
            [rows addObject:row0];
            [rows addObject:row1];
        }];
        [sections addObject:sec0];
        [sections addObject:sec1];
        [sections addObject:sec2];
    }];
    _tvSecret = [CBTableViewSecret secretWithTableView:self.tableView display:display];
    _tvSecret.didSelectRowAtIndexPath = ^(UITableView *tableView, NSIndexPath *indexPath) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [tableView reloadData];
    };
}

@end
