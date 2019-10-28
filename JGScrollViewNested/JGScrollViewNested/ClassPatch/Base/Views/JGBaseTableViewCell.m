//
//  JGBaseTableViewCell.m
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGBaseTableViewCell.h"

@implementation JGBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         [self configUI];
    }
    return self;
}


// 配置UI
- (void)configUI {}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
