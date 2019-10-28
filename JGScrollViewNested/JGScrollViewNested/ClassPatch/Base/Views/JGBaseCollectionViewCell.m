//
//  JGBaseCollectionViewCell.m
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGBaseCollectionViewCell.h"

@implementation JGBaseCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
          [self configUI];
    }
    return self;
}


// 配置UI
- (void)configUI {}


@end
