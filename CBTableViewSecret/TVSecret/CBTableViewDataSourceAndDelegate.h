//
//  CBTableViewDataSourceAndDelegate.h
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBTableViewDisplayInfo.h"

typedef UITableViewCell* _Nullable (^TableViewCellDataBandBlock)(UITableView *tableView, NSIndexPath *indexPath, Class cls);
typedef void(^TableViewDidSelectedBlock)(UITableView *tableView, NSIndexPath *indexPath);
typedef UIView *(^TableViewHeaderDataBandBlock)(UITableView *tableView, NSInteger section, Class cls);
typedef UIView *(^TableViewFooterDataBandBlock)(UITableView *tableView, NSInteger section, Class cls);

@interface CBTableViewDataSourceAndDelegate : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy)TableViewDidSelectedBlock tableViewDidSelectedBlock;
@property (nonatomic, copy)TableViewCellDataBandBlock tableViewCellDataBandBlock;
@property (nonatomic, copy)TableViewHeaderDataBandBlock tableViewHeaderDataBandBlock;
@property (nonatomic, copy)TableViewFooterDataBandBlock tableViewFooterDataBandBlock;
@property (nonatomic, strong)CBTableViewCellDisplayInfo *displayModel;

- (instancetype)initWithDisplayModel:(CBTableViewCellDisplayInfo *)displayModel;

@end
