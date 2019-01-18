//
//  CBTableViewSecret.h
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CBTableViewDisplayInfo.h"


@interface CBTableViewSecret : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)CBTableViewDisplay *display;
- (instancetype)initWithTableView:(UITableView *)tableView display:(CBTableViewDisplay *)display;
+ (instancetype)secretWithTableView:(UITableView *)tableView display:(CBTableViewDisplay *)display;

@end
