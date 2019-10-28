//
//  JGLishSaltFishBottomViewTCell.h
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGBaseTableViewCell.h"
#import "JGScrollContentView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JGLishSaltFishBottomViewTCell : JGBaseTableViewCell

@property (nonatomic, strong) JGPageContentView *pageContentView;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, assign) BOOL cellCanScroll;
@property (nonatomic, assign) BOOL isRefresh;

@property (nonatomic, strong) NSString *currentTagStr;


@end

NS_ASSUME_NONNULL_END
