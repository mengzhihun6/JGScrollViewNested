//
//  JGLikeSaltFishScrollContentViewController.m
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGLikeSaltFishScrollContentViewController.h"
#import "JGLikeSaltFishScrollContentViewTCell.h"

@interface JGLikeSaltFishScrollContentViewController () <UICollectionViewDelegate,UICollectionViewDataSource> {
    NSUInteger _type;
    NSInteger _dataCount;
}

@property (nonatomic, assign) BOOL fingerIsTouch;

@end

static NSString * const JGLikeSaltFishScrollContentViewTCellId = @"JGLikeSaltFishScrollContentViewTCellId";


@implementation JGLikeSaltFishScrollContentViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self insertRowAtTop];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupRefresh];
}


- (void)configUI {
    
    // 创建一个网格布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHight - 40) collectionViewLayout:layout];
    // 指定代理
    _collectionView.delegate = self;
    // 指定数据源代理
    _collectionView.dataSource = self;
    _collectionView.alwaysBounceVertical = YES; //数据不够一屏时上下滚动
    
    // 添加到当前视图上显示
    _collectionView.backgroundColor = [UIColor colorWithHexCode:@"#eeeeee"];
    [_collectionView registerClass:[JGLikeSaltFishScrollContentViewTCell class] forCellWithReuseIdentifier:JGLikeSaltFishScrollContentViewTCellId];
    [self.view addSubview:_collectionView];
    
}


- (void)setupRefresh {
    
    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(insertRowAtTop)];
    
    _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(insertRowAtBottom)];
}


#pragma mark Setter
- (void)setIsRefresh:(BOOL)isRefresh
{
    _isRefresh = isRefresh;

    [self insertRowAtTop];
}

- (void)insertRowAtTop {
    
    
    //[@"提货券", @"旅游门票", @"实物礼品", @"服务卡"];
    if ([self.str isEqualToString:@"提货券"]) {
        JGLog(@"加载提货券数据");
    }else if ([self.str isEqualToString:@"旅游门票"]) {
        JGLog(@"加载旅游门票数据");
    }else if ([self.str isEqualToString:@"实物礼品"]) {
        JGLog(@"加载实物礼品数据");
    }else if ([self.str isEqualToString:@"服务卡"]) {
        JGLog(@"加载服务卡数据");
    }
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //让[刷新控件]结束刷新
        [self.collectionView.mj_header endRefreshing];
    });
}

- (void)insertRowAtBottom {
    
  
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //让[刷新控件]结束刷新
        [self.collectionView.mj_footer endRefreshing];
    });
}



#pragma mark - collectionView
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JGLikeSaltFishScrollContentViewTCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JGLikeSaltFishScrollContentViewTCellId forIndexPath:indexPath];
        
    return cell;
}


//点击事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    JGLog(@"%ld", indexPath.row);
}

//返回每个子视图的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat itemWidth = (kDeviceWidth - 1.0f) / 2.0 ;
    return CGSizeMake(itemWidth, 202);
}

//设置每个子视图的缩进
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return  UIEdgeInsetsMake(1, 0, 0, 0) ;
}


//设置子视图上下之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return  1 ;
}

//设置子视图左右之间的距离
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return  1 ;
}



#pragma mark UIScrollView
//判断屏幕触碰状态
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    //    JGLog(@"接触屏幕");
    self.fingerIsTouch = YES;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    //    JGLog(@"离开屏幕");
    self.fingerIsTouch = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (!self.vcCanScroll) {
        scrollView.contentOffset = CGPointZero;
    }
    if (scrollView.contentOffset.y <= 0) {
        //        if (!self.fingerIsTouch) {//这里的作用是在手指离开屏幕后也不让显示主视图，具体可以自己看看效果
        //            return;
        //        }
        self.vcCanScroll = NO;
        scrollView.contentOffset = CGPointZero;
        [JGNotification postNotificationName:JGMineLeaveTopNotification object:nil];//到顶通知父视图改变状态
    }
    self.collectionView.showsVerticalScrollIndicator = _vcCanScroll ? YES : NO;
}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
