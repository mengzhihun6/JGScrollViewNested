//
//  JGPageContentView.h
//  ZJBL-SJ
//
//  Created by 郭军 on 2017/7/4.
//  Copyright © 2017年 ZJNY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGPageContentView;

@protocol JGPageContentViewDelegate <NSObject>

@optional

/**
 JGPageContentView开始滑动
 
 @param contentView JGPageContentView
 */
- (void)JGContentViewWillBeginDragging:(JGPageContentView *)contentView;

/**
 JGPageContentView滑动调用
 
 @param contentView JGPageContentView
 @param startIndex 开始滑动页面索引
 @param endIndex 结束滑动页面索引
 @param progress 滑动进度
 */
- (void)JGContentViewDidScroll:(JGPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress;

/**
 JGPageContentView结束滑动
 
 @param contentView JGPageContentView
 @param startIndex 开始滑动索引
 @param endIndex 结束滑动索引
 */
- (void)JGContenViewDidEndDecelerating:(JGPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex;

@end


@interface JGPageContentView : UIView


/**
 对象方法创建JGPageContentView
 
 @param frame frame
 @param childVCs 子VC数组
 @param parentVC 父视图VC
 @param delegate delegate
 @return JGPageContentView
 */
- (instancetype)initWithFrame:(CGRect)frame childVCs:(NSArray *)childVCs parentVC:(UIViewController *)parentVC delegate:(id<JGPageContentViewDelegate>)delegate;

@property (nonatomic, weak) id<JGPageContentViewDelegate>delegate;

/**
 设置contentView当前展示的页面索引，默认为0
 */
@property (nonatomic, assign) NSInteger contentViewCurrentIndex;

/**
 设置contentView能否左右滑动，默认YES
 */
@property (nonatomic, assign) BOOL contentViewCanScroll;



@end
