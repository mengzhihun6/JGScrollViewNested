//
//  JGBaseNavigationController.m
//  JGScrollViewNested
//
//  Created by 郭军 on 2019/10/26.
//  Copyright © 2019 JG. All rights reserved.
//

#import "JGBaseNavigationController.h"
#import "JGBaseViewController.h"

@interface JGBaseNavigationController ()

@end

@implementation JGBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed = YES;//处理隐藏tabbar
        
        if ([viewController isKindOfClass:[JGBaseViewController class]]) {
            JGBaseViewController *vc = (JGBaseViewController *)viewController;
            if (vc.isHideBackItem == YES) {
                vc.navigationItem.hidesBackButton = YES;
            }else{
                //给push的每个VC加返回按钮
                NSString *imageName = [vc backItemImageName];
                vc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:imageName highIcon:@"no" target:self action:@selector(back:)];
            }
        }else{
            viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"navigator_btn_back" highIcon:@"no" target:self action:@selector(back:)];
        }
        
    }else{
        
        
    }
    [super pushViewController:viewController animated:animated];
    
}



-(void)back:(UIBarButtonItem *)sender{
    [self.view endEditing:YES];
    
    UIViewController * currentVC = self.topViewController;
    if (currentVC.popBlock) {
        currentVC.popBlock(sender);
    }else{
        [self popViewControllerAnimated:YES];
    }
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
