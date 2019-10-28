//
//  JGSegmentTitleView.h
//  ZJBL-SJ
//
//  Created by 郭军 on 2017/7/4.
//  Copyright © 2017年 ZJNY. All rights reserved.
//

#import <UIKit/UIKit.h>


@class JGSegmentTitleView;

typedef enum : NSUInteger {
    JGIndicatorTypeDefault,//默认与按钮长度相同
    JGIndicatorTypeEqualTitle,//与文字长度相同
    JGIndicatorTypeCustom,//自定义文字边缘延伸宽度
    JGIndicatorTypeNone,
} JGIndicatorType;//指示器类型枚举

@protocol JGSegmentTitleViewDelegate <NSObject>

@optional

/**
 切换标题
 
 @param titleView JGSegmentTitleView
 @param startIndex 切换前标题索引
 @param endIndex 切换后标题索引
 */
- (void)JGSegmentTitleView:(JGSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex;

@end


@interface JGSegmentTitleView : UIView

@property (nonatomic, weak) id<JGSegmentTitleViewDelegate>delegate;

/**
 标题文字间距，默认20
 */
@property (nonatomic, assign) CGFloat itemMargin;

/**
 当前选中标题索引，默认0
 */
@property (nonatomic, assign) NSInteger selectIndex;

/**
 标题字体大小，默认15
 */
@property (nonatomic, strong) UIFont *titleFont;

/**
 标题选中字体大小，默认15
 */
@property (nonatomic, strong) UIFont *titleSelectFont;

/**
 标题正常颜色，默认black
 */
@property (nonatomic, strong) UIColor *titleNormalColor;

/**
 标题选中颜色，默认red
 */
@property (nonatomic, strong) UIColor *titleSelectColor;

/**
 指示器颜色，默认与titleSelectColor一样,在JGIndicatorTypeNone下无效
 */
@property (nonatomic, strong) UIColor *indicatorColor;

/**
 在JGIndicatorTypeCustom时可自定义此属性，为指示器一端延伸长度，默认5
 */
@property (nonatomic, assign) CGFloat indicatorExtension;

/**
 对象方法创建JGSegmentTitleView
 
 @param frame frame
 @param titlesArr 标题数组
 @param delegate delegate
 @param incatorType 指示器类型
 @return JGSegmentTitleView
 */
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titlesArr delegate:(id<JGSegmentTitleViewDelegate>)delegate indicatorType:(JGIndicatorType)incatorType;

@end
