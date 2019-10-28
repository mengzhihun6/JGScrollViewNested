//
//  JGLikeSaltFishTopTCell.m
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGLikeSaltFishTopTCell.h"

@interface JGJiuBiButton : UIButton
@end
@implementation JGJiuBiButton
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"my_info_arrow_right"] forState:UIControlStateNormal];
        [self setTitle:@"如何获得久币" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithHexCode:@"#999999"] forState:UIControlStateNormal];
        self.titleLabel.font = JGFont(12);
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.imageView.frame = CGRectMake(w - 29, 0, 14, h);
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.frame = CGRectMake(0, 0, w - 30, h);
    self.titleLabel.textAlignment = NSTextAlignmentRight;
}
@end


@interface JGForRecordButton : UIButton
@end
@implementation JGForRecordButton
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor colorWithHexCode:@"#999999"] forState:UIControlStateNormal];
        self.titleLabel.font = JGFont(15);
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat w = self.frame.size.width;
    CGFloat h = self.frame.size.height;
    self.imageView.frame = CGRectMake(34, 17, 26, 26);
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.frame = CGRectMake(69, 0, w - 69, h);
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
}
@end


@interface JGLikeSaltFishTopTCell ()

@property (nonatomic, strong) UIImageView *Icon; //用户图像

@property (nonatomic, strong) UILabel *NameLbl; //用户昵称

@property (nonatomic, strong) UILabel *JiuBiLbl; //久币

@property (nonatomic, strong) JGJiuBiButton *JiuBiBtn; //如何获得久币

@property (nonatomic, strong) JGForRecordButton *ForRecordBtn; //兑换记录

@property (nonatomic, strong) JGForRecordButton *IntegralRecordBtn; //积分记录

@property (nonatomic, strong) UIImageView *BigIcon; //大图

@property (nonatomic, strong) UILabel *Desc; //兑换专区

@end

@implementation JGLikeSaltFishTopTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configUI {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
    
    //顶部整体
    UIView *TopV = [UIView new];
    
    //图像
    _Icon = [UIImageView new];
    _Icon.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
    _Icon.clipsToBounds = YES;
    _Icon.layer.cornerRadius = 24.5f;
    
    //昵称
    _NameLbl = [UILabel new];
    _NameLbl.font = JGFont(15);
    _NameLbl.text = @"程序之美JG";
    _NameLbl.textColor = [UIColor colorWithHexCode:@"#333333"];
    
    //久币
    UILabel *jiuBiL = [UILabel new];
    jiuBiL.text = @"久币";
    jiuBiL.font = JGFont(12);
    jiuBiL.textColor = [UIColor colorWithHexCode:@"#666666"];
    
    
    _JiuBiLbl = [UILabel new];
    _JiuBiLbl.text = @"99.9";
    _JiuBiLbl.font = JGFont(14);
    _JiuBiLbl.textColor = JGMainColor;
    
    //如何获得久币
    _JiuBiBtn = [JGJiuBiButton new];
    [_JiuBiBtn addTarget:self action:@selector(JiuBiBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    //线
    UIView *Line = [UIView new];
    Line.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
    
    
    //中间整体
    UIView *CenterV = [UIView new];
    
    //兑换记录
    _ForRecordBtn = [JGForRecordButton new];
    [_ForRecordBtn setImage:[UIImage imageNamed:@"ForRecord_icon"] forState:UIControlStateNormal];
    [_ForRecordBtn setTitle:@"兑换记录" forState:UIControlStateNormal];
    [_ForRecordBtn addTarget:self action:@selector(ForRecordBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    //线
    UIView *Line1 = [UIView new];
    Line1.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
    
    //积分记录
    _IntegralRecordBtn = [JGForRecordButton new];
    [_IntegralRecordBtn setImage:[UIImage imageNamed:@"IntegralRecord_icon"] forState:UIControlStateNormal];
    [_IntegralRecordBtn setTitle:@"积分记录" forState:UIControlStateNormal];
    [_IntegralRecordBtn addTarget:self action:@selector(IntegralRecordBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //分割线
    UIView *Line2 = [UIView new];
    Line2.backgroundColor = [UIColor colorWithHexCode:@"#f0f0f0"];
    
    //大图
    _BigIcon = [UIImageView new];
    _BigIcon.image = [UIImage imageNamed:@"MineBanner_icon"];
    _BigIcon.contentMode = UIViewContentModeScaleAspectFill;
    _BigIcon.clipsToBounds = YES;
    
    
    //底部整体
    UIView *BottomV = [UIView new];
    
    UIImageView *LeftIcon = [UIImageView new];
    LeftIcon.image = [UIImage imageNamed:@"MineLeft_icon"];
    
    _Desc = [UILabel new];
    _Desc.text = @"兑换专区";
    _Desc.font = JGFont(16);
    _Desc.textColor = [UIColor colorWithHexCode:@"#333333"];
    
    UIImageView *RightIcon = [UIImageView new];
    RightIcon.image = [UIImage imageNamed:@"MineRight_icon"];
    
    
    [self addSubview:TopV];
    [TopV addSubview:_Icon];
    [TopV addSubview:_NameLbl];
    [TopV addSubview:jiuBiL];
    [TopV addSubview:_JiuBiLbl];
    [TopV addSubview:_JiuBiBtn];
    [TopV addSubview:Line];
    [self addSubview:CenterV];
    [CenterV addSubview:_ForRecordBtn];
    [CenterV addSubview:Line1];
    [CenterV addSubview:_IntegralRecordBtn];
    [CenterV addSubview:Line2];
    [self addSubview:_BigIcon];
    [self addSubview:BottomV];
    [BottomV addSubview:LeftIcon];
    [BottomV addSubview:_Desc];
    [BottomV addSubview:RightIcon];
    
    [TopV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.mas_top);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(@(84));
    }];
    
    
    [_Icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(TopV.mas_centerY);
        make.left.equalTo(TopV.mas_left).mas_offset(20);
        make.width.equalTo(@(49));
        make.height.equalTo(@(49));
    }];
    
    [_NameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_JiuBiLbl.mas_top).mas_offset(-9);
        make.left.equalTo(_Icon.mas_right).mas_offset(10);
    }];
    
    [jiuBiL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_NameLbl.mas_left);
        make.centerY.equalTo(_JiuBiLbl.mas_centerY);
    }];
    
    [_JiuBiLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_Icon.mas_bottom);
        make.left.equalTo(jiuBiL.mas_right).mas_offset(2);
    }];
    
    [_JiuBiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(TopV.mas_top);
        make.right.equalTo(TopV.mas_right);
        make.bottom.equalTo(TopV.mas_bottom);
        make.width.equalTo(@(kDeviceWidth * 0.5));
    }];
    
    [Line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(TopV.mas_left);
        make.right.equalTo(TopV.mas_right);
        make.bottom.equalTo(TopV.mas_bottom);
        make.height.equalTo(@(1));
    }];
    
    
    [CenterV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(TopV.mas_bottom);
        make.height.equalTo(@(69));
    }];
    
    [_ForRecordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(CenterV.mas_left);
        make.top.equalTo(CenterV.mas_top);
        make.width.equalTo(@(kDeviceWidth * 0.5));
        make.height.equalTo(@(58));
    }];
    
    [Line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_ForRecordBtn.mas_right);
        make.top.equalTo(CenterV.mas_top).mas_offset(15);
        make.width.equalTo(@(1));
        make.height.equalTo(@(28));
    }];
    
    [_IntegralRecordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(Line1.mas_right);
        make.right.equalTo(CenterV.mas_right);
        make.top.equalTo(_ForRecordBtn.mas_top);
        make.bottom.equalTo(_ForRecordBtn.mas_bottom);
    }];
    
    [Line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(CenterV.mas_left);
        make.right.equalTo(CenterV.mas_right);
        make.top.equalTo(_ForRecordBtn.mas_bottom);
        make.height.equalTo(@(11));
    }];
    
    [_BigIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(CenterV.mas_bottom);
        make.height.equalTo(@(109));
    }];
    
    [BottomV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(_BigIcon.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [LeftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_Desc.mas_left).mas_offset(-12);
        make.centerY.equalTo(_Desc.mas_centerY);
        make.width.equalTo(@(56));
        make.height.equalTo(@(6));
    }];
    
    [_Desc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(BottomV.mas_centerX);
        make.centerY.equalTo(BottomV.mas_centerY).mas_offset(5);
    }];
    
    [RightIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_Desc.mas_right).mas_offset(12);
        make.centerY.equalTo(_Desc.mas_centerY);
        make.width.equalTo(@(56));
        make.height.equalTo(@(6));
    }];
    
}



- (void)ForRecordBtnClick {
    
    JGLogFunc
}

- (void)JiuBiBtnClick {
    
    JGLogFunc
}

- (void)IntegralRecordBtnClick {
    
    JGLogFunc
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
