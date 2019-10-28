//
//  JGMainTCell.m
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGMainTCell.h"

@implementation JGMainTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _TitleLbl = [UILabel new];
    _TitleLbl.font = JGBoldFont(16);
    _TitleLbl.textAlignment = NSTextAlignmentCenter;
    _TitleLbl.textColor = JGHexColor(@"#505050");
    _TitleLbl.numberOfLines = 0;
    
    UIView *Line = [UIView new];
    Line.backgroundColor = JGLineColor;
    
    
    [self.contentView addSubview:_TitleLbl];
    [self.contentView addSubview:Line];

    
    [_TitleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    
    [Line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.equalTo(@(0.5));
    }];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
