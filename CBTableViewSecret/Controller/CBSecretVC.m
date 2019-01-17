//
//  CBSecretVC.m
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "CBSecretVC.h"
#import "CBTableViewDataSourceAndDelegate.h"
#import "NewsModel.h"
#import "PersonModel.h"
#import "AppliancesModel.h"
#import "NewsListTableHeaderView.h"
#import "NewsListTableFooterView.h"
#import "AppliancesTableHeaderView.h"
#import "NewsListTableViewCell.h"
#import "AppliancesTableViewCell.h"
#import "UITableView+ReuseView.h"

@interface CBSecretVC ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) CBTableViewDataSourceAndDelegate *tvSecret;
@property (nonatomic, strong) CBTableViewCellDisplayInfo * displayInfo;
@property (nonatomic, strong) NewsModel * newsModel;
@property (nonatomic, strong) PersonModel * personModel;
@property (nonatomic, strong) AppliancesModel *appliancesModel;

@end

@implementation CBSecretVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Secret";
    [self configUI];
    [self configData];
    [self formatDataSource];
    [self bandData];
}

- (void)configUI {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
}

/// 配置数据
- (void)configData {
    NSDictionary *dicNews = [self getDataFromJsonPath:@"NewsList" fileType:@"json"];
    self.newsModel = [NewsModel yy_modelWithDictionary:dicNews];
    NSDictionary *dicPerson = [self getDataFromJsonPath:@"Person" fileType:@"json"];
    self.personModel = [PersonModel yy_modelWithDictionary:dicPerson];
    NSDictionary *dicAppliances = [self getDataFromJsonPath:@"Appliances" fileType:@"json"];
    self.appliancesModel = [AppliancesModel yy_modelWithDictionary:dicAppliances];
}

- (id)loadXibByName:(NSString *)name {
    id view = [[NSBundle mainBundle] loadNibNamed:name owner:self options:nil].firstObject;
    return view;
}

- (NSDictionary *)getDataFromJsonPath:(NSString *)path fileType:(NSString * _Nullable)fileType {
    NSError *error;
    NSString * jsonPath = [[NSBundle mainBundle] pathForResource:path ofType:fileType];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:jsonPath] options:NSJSONReadingMutableLeaves error:&error];
    return jsonDic;
}

- (void)formatDataSource {
    self.displayInfo = [[CBTableViewCellDisplayInfo alloc] initWithSectionsBlock:^(NSMutableArray<CBTableViewCellDisplaySectionInfo *> *sectionInfos) {
        // 新闻列表
        CBTableViewCellDisplaySectionInfo * sectionInfo0 = [[CBTableViewCellDisplaySectionInfo alloc] initWithHeaderClass:[NewsListTableHeaderView class] headerHeight:45.0 autoHeaderHeight:NO footerClass:[NewsListTableFooterView class] footerHeight:CGFLOAT_MIN autoFooterHeight:NO info:nil rowsBlock:^(NSMutableArray<CBTableViewCellDisplayRowInfo *> *rowsInfos) {
            for (NSInteger i = 0; i < self.newsModel.newslist.count; i++) {
                CBTableViewCellDisplayRowInfo * rowInfo = [[CBTableViewCellDisplayRowInfo alloc] initWithCellClass:[NewsListTableViewCell class] cellHeight:90 autoCellHeight:YES info:self.newsModel.newslist[i] desc:nil];
                [rowsInfos addObject:rowInfo];
            }
        } desc:@"News"];
        // 电器信息
        CBTableViewCellDisplaySectionInfo * sectionInfo1 = [[CBTableViewCellDisplaySectionInfo alloc] initWithHeaderClass:[AppliancesTableHeaderView class] headerHeight:45.0 autoHeaderHeight:NO footerClass:nil footerHeight:CGFLOAT_MIN autoFooterHeight:NO info:nil rowsBlock:^(NSMutableArray<CBTableViewCellDisplayRowInfo *> *rowsInfos) {
            CBTableViewCellDisplayRowInfo * rowInfo = [[CBTableViewCellDisplayRowInfo alloc] initWithCellClass:[AppliancesTableViewCell class] cellHeight:90 autoCellHeight:YES info:self.appliancesModel desc:nil];
            [rowsInfos addObject:rowInfo];
        } desc:@"Appliance"];
        [sectionInfos addObject:sectionInfo0];
        [sectionInfos addObject:sectionInfo1];
    }];
}

- (void)bandData {
    _tvSecret = [[CBTableViewDataSourceAndDelegate alloc] initWithDisplayModel:self.displayInfo tableView:self.tableView];
    __weak typeof (self)weakSelf = self;
    _tvSecret.tableViewHeaderDataBandBlock = ^UIView *(UITableView *tableView, NSInteger section, __unsafe_unretained Class cls) {
        if ([cls isEqual:[NewsListTableHeaderView class]]) {
            NewsListTableHeaderView *header = [tableView headerFooterFromNib:cls];
            header.lblTitle.text = @"新闻列表";
            return header;
        } else if ([cls isEqual:[AppliancesTableHeaderView class]]) {
            AppliancesTableHeaderView *header = [tableView headerFooterFromNib:cls];
            header.lblName.text = @"这里的电器";
            return header;
        }
        return nil;
    };
    _tvSecret.tableViewCellDataBandBlock = ^UITableViewCell * _Nullable(UITableView *tableView, NSIndexPath *indexPath, __unsafe_unretained Class cls) {
        CBTableViewCellDisplaySectionInfo * sectionInfo = weakSelf.displayInfo.listSection[indexPath.section];
        CBTableViewCellDisplayRowInfo * rowInfo = sectionInfo.listRow[indexPath.row];
        id aCell = [tableView cellWithClass:cls fileType:FileTypeNib];
        if ([cls isEqual:[NewsListTableViewCell class]]) {
            NewsListTableViewCell *cell = aCell;
            Newslist * news = rowInfo.info;
            cell.lblTitle.text = news.title;
            cell.lblSubTitle.text = news.source;
            return cell;
        } else if ([cls isEqual:[AppliancesTableViewCell class]]) {
            AppliancesTableViewCell *cell = aCell;
            AppliancesModel *md = rowInfo.info;
            cell.lblName.text = md.name;
            cell.lblColor.text = md.color;
            cell.lblPrice.text = [NSString stringWithFormat:@"%.2f",md.price];
            return cell;
        }
        return nil;
    };
}

@end
