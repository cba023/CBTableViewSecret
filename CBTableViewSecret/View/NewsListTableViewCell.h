//
//  NewsListTableViewCell.h
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsListTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblSubTitle;

@end

NS_ASSUME_NONNULL_END
