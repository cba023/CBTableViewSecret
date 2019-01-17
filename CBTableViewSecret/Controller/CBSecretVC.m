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
    self.title = @"DemoPage";
    [self configUI];
    [self configData];
    [self bandData];
}

- (void)configUI {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self.tvSecret;
    self.tableView.dataSource = self.tvSecret;
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

- (void)bandData {
    self.displayInfo = [[CBTableViewCellDisplayInfo alloc] init];
    NSMutableArray * listSection = [NSMutableArray array];
    // 新闻列表
    Newslist * news = _newsModel.newslist[0];
    CBTableViewCellDisplayRowInfo * rowInfo1 = [[CBTableViewCellDisplayRowInfo alloc] initWithCellClass:[NewsListTableViewCell class] CellHeight:80 ShouldAutoCellHeight:NO Info:news Desc:nil];
    
    CBTableViewCellDisplaySectionInfo * sectionInfo1 = [[CBTableViewCellDisplaySectionInfo alloc] initWithHeaderClass:[NewsListTableHeaderView class] HeaderHeight:45.0 ShouldAutoHeaderHeight:NO FooterClass:[NewsListTableFooterView class] FooterHeight:70.0 ShouldAutoFooterHeight:NO Info:nil ListRow:[NSMutableArray arrayWithArray:@[rowInfo1]] Desc:nil];
    [listSection addObject:sectionInfo1];
    self.displayInfo.listSection = listSection;
    _tvSecret = [[CBTableViewDataSourceAndDelegate alloc] initWithDisplayModel:self.displayInfo];
    self.tableView.delegate = _tvSecret;
    self.tableView.dataSource = _tvSecret;
    __weak typeof (self)weakSelf = self;
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
            return cell;
        } else {
            return [UITableViewCell new];
        }
    };
}



@end
