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
        CBTableViewCellDisplaySectionInfo *sec0 = [[CBTableViewCellDisplaySectionInfo alloc] initWithHeaderHeight:45.0 autoHeaderHeight:NO footerHeight:CGFLOAT_MIN autoFooterHeight:NO rowsBlock:^(NSMutableArray<CBTableViewCellDisplayRowInfo *> *rowsInfos) {
            for (NSInteger i = 0; i < self.newsModel.newslist.count; i++) {
                CBTableViewCellDisplayRowInfo * row = [[CBTableViewCellDisplayRowInfo alloc] initWithCellHeight:60 autoCellHeight:YES];
                row.cellForRowAtIndexPath = ^UITableViewCell * _Nullable(UITableView *tableView, NSIndexPath *indexPath, __unsafe_unretained Class cls) {
                    NewsListTableViewCell *cell = [tableView cellWithClass:[NewsListTableViewCell class] fileType:FileTypeNib];
                    cell.lblTitle.text = self.newsModel.newslist[i].title;
                    cell.lblSubTitle.text = self.newsModel.newslist[i].source;
                    return cell;
                };
                row.didSelectRowAtIndexPath = ^(UITableView *tableView, NSIndexPath *indexPath) {
                    NSLog(@"新闻列表点击 - %ld - %ld -", indexPath.section, indexPath.row);
                };
                [rowsInfos addObject:row];
            }
        }];
        sec0.viewForHeader = ^UIView *(UITableView *tableView, NSInteger section) {
            NewsListTableHeaderView *header = [tableView headerFooterFromNib:[NewsListTableHeaderView class]];
            header.lblTitle.text = @"新闻列表";
            return header;
        };
        
        // 电器信息
        CBTableViewCellDisplaySectionInfo * sec1 = [[CBTableViewCellDisplaySectionInfo alloc] initWithHeaderHeight:90 autoHeaderHeight:NO footerHeight:CGFLOAT_MIN autoFooterHeight:NO rowsBlock:^(NSMutableArray<CBTableViewCellDisplayRowInfo *> *rowsInfos) {
            CBTableViewCellDisplayRowInfo * row = [[CBTableViewCellDisplayRowInfo alloc] initWithCellHeight:50 autoCellHeight:NO];
            row.cellForRowAtIndexPath = ^UITableViewCell * _Nullable(UITableView *tableView, NSIndexPath *indexPath, __unsafe_unretained Class cls) {
                AppliancesTableViewCell *cell = [tableView cellWithClass:cls fileType:FileTypeNib];
                AppliancesModel *md = self.appliancesModel;
                cell.lblName.text = md.name;
                cell.lblColor.text = md.color;
                cell.lblPrice.text = [NSString stringWithFormat:@"%.2f",md.price];
                return cell;
            };
        }];
        
        sec1.viewForHeader = ^UIView *(UITableView *tableView, NSInteger section) {
            AppliancesTableHeaderView *header = [tableView headerFooterFromNib:[AppliancesTableHeaderView class]];
            header.lblName.text = @"这里的电器";
            return header;
        };
        [sectionInfos addObject:sec0];
        [sectionInfos addObject:sec1];
    }];
    _tvSecret = [[CBTableViewDataSourceAndDelegate alloc] initWithDisplayModel:self.displayInfo tableView:self.tableView];
}


@end
