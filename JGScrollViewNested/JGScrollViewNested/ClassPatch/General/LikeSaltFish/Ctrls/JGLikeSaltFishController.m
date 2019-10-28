//
//  JGLikeSaltFishController.m
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGLikeSaltFishController.h"
#import "JGGestureTableView.h"
#import "JGScrollContentView.h"
#import "JGLikeSaltFishTopTCell.h"
#import "JGLishSaltFishBottomViewTCell.h"

#import "JGLikeSaltFishScrollContentViewController.h"


@interface JGLikeSaltFishController ()<UITableViewDelegate,UITableViewDataSource,JGPageContentViewDelegate,JGSegmentTitleViewDelegate> {
    double _JiuBi;
}

@property (nonatomic, strong) JGGestureTableView *tableView;
@property (nonatomic, strong) JGLishSaltFishBottomViewTCell *contentCell;
@property (nonatomic, strong) JGSegmentTitleView *titleView;

@property (nonatomic, assign) BOOL canScroll;

@property (nonatomic, strong) NSArray *titlesArrM;

@end

static NSString * const JGLikeSaltFishTopTCellId = @"JGLikeSaltFishTopTCellId";
static NSString * const JGLishSaltFishBottomViewTCellId = @"JGLishSaltFishBottomViewTCellId";


@implementation JGLikeSaltFishController

- (NSArray *)titlesArrM {
    if (!_titlesArrM) {
        _titlesArrM = @[@"提货券", @"旅游门票", @"实物礼品", @"服务卡"];
    }
    return _titlesArrM;
}

- (JGGestureTableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[JGGestureTableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[JGLikeSaltFishTopTCell class] forCellReuseIdentifier:JGLikeSaltFishTopTCellId];
        //        _tableView.bounces = NO;
    }
    return _tableView;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [JGNotification addObserver:self
                       selector:@selector(changeScrollStatus)
                           name:JGMineLeaveTopNotification
                         object:nil];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(insertRowAtTop)];
    [self.tableView.mj_header beginRefreshing];
}


- (void)configUI {
    
    self.canScroll = YES;
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


- (void)insertRowAtTop {
    
    self.contentCell.currentTagStr = self.titlesArrM[self.titleView.selectIndex];
    self.contentCell.isRefresh = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //让[刷新控件]结束刷新
      [self.tableView.mj_header endRefreshing];
    });
    
    
}



#pragma mark notify
- (void)changeScrollStatus//改变主视图的状态
{
    self.canScroll = YES;
    self.contentCell.cellCanScroll = NO;
}


#pragma mark UITableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  indexPath.section == 0 ? 295 : CGRectGetHeight(self.view.bounds);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 0.01f : 40.0f;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    self.titleView = [[JGSegmentTitleView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 40) titles:self.titlesArrM delegate:self indicatorType:JGIndicatorTypeEqualTitle];
    self.titleView.backgroundColor = [UIColor whiteColor];
    self.titleView.titleNormalColor = [UIColor colorWithHexCode:@"#666666"];
    self.titleView.titleSelectColor = JGMainColor;
    self.titleView.indicatorColor = JGMainColor;
    self.titleView.titleFont = JGFont(13);
    return self.titleView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        _contentCell = [tableView dequeueReusableCellWithIdentifier:JGLishSaltFishBottomViewTCellId];
        if (!_contentCell) {
            _contentCell = [[JGLishSaltFishBottomViewTCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:JGLishSaltFishBottomViewTCellId];
            NSMutableArray *contentVCs = [NSMutableArray array];
            for (NSString *title in self.titlesArrM) {
                JGLikeSaltFishScrollContentViewController *vc = [[JGLikeSaltFishScrollContentViewController alloc] init];
                vc.title = title;
                vc.str = title;
                [contentVCs addObject:vc];
            }
            _contentCell.viewControllers = contentVCs;
            _contentCell.pageContentView = [[JGPageContentView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHight - 40) childVCs:contentVCs parentVC:self delegate:self];
            [_contentCell.contentView addSubview:_contentCell.pageContentView];
        }
        return _contentCell;
    }
    
    if (indexPath.section == 0) {
        JGLikeSaltFishTopTCell *cell = [tableView dequeueReusableCellWithIdentifier:JGLikeSaltFishTopTCellId forIndexPath:indexPath];
        return cell;
    }
    
    return nil;
}

#pragma mark JGSegmentTitleViewDelegate
- (void)JGContenViewDidEndDecelerating:(JGPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.titleView.selectIndex = endIndex;
    _tableView.scrollEnabled = YES;//此处其实是监测scrollview滚动，pageView滚动结束主tableview可以滑动，或者通过手势监听或者kvo，这里只是提供一种实现方式
}

- (void)JGSegmentTitleView:(JGSegmentTitleView *)titleView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex
{
    self.contentCell.pageContentView.contentViewCurrentIndex = endIndex;
}

- (void)JGContentViewDidScroll:(JGPageContentView *)contentView startIndex:(NSInteger)startIndex endIndex:(NSInteger)endIndex progress:(CGFloat)progress
{
    _tableView.scrollEnabled = NO;//pageView开始滚动主tableview禁止滑动
}

#pragma mark UIScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat bottomCellOffset = [_tableView rectForSection:1].origin.y;
    if (scrollView.contentOffset.y >= bottomCellOffset) {
        scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        if (self.canScroll) {
            self.canScroll = NO;
            self.contentCell.cellCanScroll = YES;
        }
    }else{
        if (!self.canScroll) {//子视图没到顶部
            scrollView.contentOffset = CGPointMake(0, bottomCellOffset);
        }
    }
    self.tableView.showsVerticalScrollIndicator = _canScroll?YES:NO;
}


- (void)dealloc
{
    [JGNotification removeObserver:self];
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
