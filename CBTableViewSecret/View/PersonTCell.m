//
//  PersonTCell.m
//  CBTableViewSecret
//
//  Created by flowerflower on 2019/1/18.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "PersonTCell.h"

@interface PersonTCell ()

@property (nonatomic, strong) UILabel * lblName;
@property (nonatomic, strong) UILabel * lblAge;
@property (nonatomic, strong) UILabel * lblGender;

@end

@implementation PersonTCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _lblName = [[UILabel alloc] init];
        _lblAge = [[UILabel alloc] init];
        _lblGender = [[UILabel alloc] init];
        [self.contentView addSubview:_lblName];
        [self.contentView addSubview:_lblAge];
        [self.contentView addSubview:_lblGender];
    }
    return self;
}

- (void)layoutSubviews {
    [_lblName setFrame:CGRectMake(15, 15, 200, 20)];
    [_lblAge setFrame:CGRectMake(15, 40, 100, 20)];
    [_lblGender setFrame:CGRectMake(self.contentView.bounds.size.width - 60, 40, 60, 20)];
    _lblName.text = @"张三";
    _lblGender.text = @"男";
    _lblAge.text = @"25";
}

@end
