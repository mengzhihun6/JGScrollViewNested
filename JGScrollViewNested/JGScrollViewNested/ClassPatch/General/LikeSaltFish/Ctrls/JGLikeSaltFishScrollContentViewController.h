//
//  JGLikeSaltFishScrollContentViewController.h
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JGLikeSaltFishScrollContentViewController : JGBaseViewController

@property (nonatomic, assign) BOOL vcCanScroll;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isRefresh;
@property (nonatomic, strong) NSString *str;

@end

NS_ASSUME_NONNULL_END
