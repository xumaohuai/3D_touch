//
//  SearchView.m
//  3D_Touch
//
//  Created by 徐茂怀 on 16/2/14.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import "SearchView.h"
#import "ViewController.h"
@interface SearchView ()

@end

@implementation SearchView

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _searchBar = [[UISearchBar alloc]init];
    self.navigationItem.titleView = _searchBar;

}

-(NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    [_searchBar becomeFirstResponder];
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"搜索" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        SearchView *vc = [[SearchView alloc]init];
        ViewController *viewcontroller = [[ViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewcontroller];
        [UIApplication sharedApplication].keyWindow.rootViewController =  nav;
        [[UIApplication sharedApplication].keyWindow makeKeyAndVisible];
        [nav pushViewController:vc animated:YES];
        
    }];
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
    }];
    NSArray *array = @[action1,action2];
    return array;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
