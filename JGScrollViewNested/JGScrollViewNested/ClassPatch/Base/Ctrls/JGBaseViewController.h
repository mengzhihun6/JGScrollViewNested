//
//  JGBaseViewController.h
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JGBaseViewController : UIViewController

@property (nonatomic, assign) BOOL isHideBackItem;

-(NSString *)backItemImageName;

// 配置UI
- (void)configUI;

@end

NS_ASSUME_NONNULL_END
