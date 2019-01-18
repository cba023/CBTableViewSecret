//
//  CBNormalVC.m
//  CBTableViewSecret
//
//  Created by flowerflower on 2019/1/18.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "CBNormalVC.h"
#import "CBUtil.h"
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

@interface CBNormalVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NewsModel * newsModel;
@property (nonatomic, strong) PersonModel * personModel;
@property (nonatomic, strong) AppliancesModel *appliancesModel;

@end

@implementation CBNormalVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"传统写法";
    [self configUI];
    [self configData];
}

- (void)configUI {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

/// 配置数据
- (void)configData {
    NSDictionary *dicNews = [CBUtil getDataFromJsonPath:@"NewsList" fileType:@"json"];
    self.newsModel = [NewsModel yy_modelWithDictionary:dicNews];
    NSDictionary *dicPerson = [CBUtil getDataFromJsonPath:@"Person" fileType:@"json"];
    self.personModel = [PersonModel yy_modelWithDictionary:dicPerson];
    NSDictionary *dicAppliances = [CBUtil getDataFromJsonPath:@"Appliances" fileType:@"json"];
    self.appliancesModel = [AppliancesModel yy_modelWithDictionary:dicAppliances];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.newsModel.newslist.count;
    } else if (section == 1) {
        return 1;
    } else {
        return 2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 45.0;
    } else if (section == 1) {
        return 90.0;
    } else {
        return 50.0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 50.0;
    } else {
        return CGFLOAT_MIN;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row % 2 == 0) {
            return UITableViewAutomaticDimension;
        } else {
            return 70.0;
        }
    } else if (indexPath.section == 1){
        return 100.0;
    } else {
        if (indexPath.row == 0) {
            return self.tableView.bounds.size.width / 16.0 * 9.0;
        } else {
            return 80.0;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row % 2 == 0) {
            return UITableViewAutomaticDimension;
        } else {
            return 70.0;
        }
    } else if (indexPath.section == 1){
        return 100.0;
    } else {
        if (indexPath.row == 0) {
            return self.tableView.bounds.size.width / 16.0 * 9.0;
        } else {
            return 80.0;
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        NewsListTableHeaderView *header = [tableView headerFooterFromNib:[NewsListTableHeaderView class]];
        header.lblTitle.text = @"新闻列表";
        return header;
    } else if(section == 1) {
        AppliancesTableHeaderView *header = [tableView headerFooterFromNib:[AppliancesTableHeaderView class]];
        header.lblName.text = @"这里的电器";
        return header;
    } else {
        return nil;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        NewsListTableFooterView * footer = [tableView headerFooterFromNib:[NewsListTableFooterView class]];
        footer.lblDesc.text = @"上面是新闻";
        return footer;
    } else {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        NewsListTableViewCell *cell = [tableView cellWithClass:[NewsListTableViewCell class] fileType:FileTypeNib];
        cell.lblTitle.text = self.newsModel.newslist[indexPath.row].title;
        cell.lblSubTitle.text = self.newsModel.newslist[indexPath.row].source;
        return cell;
    } else if (indexPath.section == 1) {
        AppliancesTableViewCell *cell = [tableView cellWithClass:[AppliancesTableViewCell class] fileType:FileTypeNib];
        AppliancesModel *md = self.appliancesModel;
        cell.lblName.text = md.name;
        cell.lblColor.text = md.color;
        cell.lblPrice.text = [NSString stringWithFormat:@"%.2f",md.price];
        return cell;
    } else {
        if (indexPath.row == 0) {
            AnimalTCell *cell = [tableView cellWithClass:[AnimalTCell class] fileType:FileTypeNib];
            return cell;
        } else {
            PersonTCell * cell = [tableView cellWithClass:[PersonTCell class] fileType:FileTypeClass];
            cell.lblName.text = @"张三";
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
