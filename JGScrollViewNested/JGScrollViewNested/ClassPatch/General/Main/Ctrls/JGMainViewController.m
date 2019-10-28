//
//  JGMainViewController.m
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGMainViewController.h"
#import "JGMainTCell.h"
#import "JGLikeSaltFishController.h" //类似咸鱼视图嵌套
#import "JGLikeTaobaoController.h" //类似淘宝首页

@interface JGMainViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *DataArrM;

@end

@implementation JGMainViewController

- (NSArray *)DataArrM {
    if (!_DataArrM) {
        _DataArrM = @[@"类似咸鱼首页",@"类似淘宝首页"];
    }
    return _DataArrM;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.delaysContentTouches = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView jg_registerCell:[JGMainTCell class]];
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"ScrollView嵌套";

}


- (void)configUI {
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


#pragma mark - UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.DataArrM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JGMainTCell *cell = [tableView jg_dequeueReusableCell:[JGMainTCell class] and:indexPath];
    cell.TitleLbl.text = [self.DataArrM objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        JGLikeSaltFishController *VC = [JGLikeSaltFishController new];
        VC.navigationItem.title = [self.DataArrM objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 1) {
        
        JGLikeTaobaoController *VC = [JGLikeTaobaoController new];
        VC.navigationItem.title = [self.DataArrM objectAtIndex:indexPath.row];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
    
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
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
