//
//  ViewController.m
//  3D_Touch
//
//  Created by 徐茂怀 on 16/2/14.
//  Copyright © 2016年 徐茂怀. All rights reserved.
//

#import "ViewController.h"
#import "SearchView.h"
#import "SecondViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIViewControllerPreviewingDelegate>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray *cellArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第一页";
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _cellArray = @[@"第一页",@"第二页",@"搜索"];
    [self.view addSubview:_tableView];
}

-(CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cellArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [self registerForPreviewingWithDelegate:self sourceView:cell];

    cell.textLabel.text = _cellArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        [self.navigationController pushViewController:[[SecondViewController alloc]init] animated:YES];
    }
    else if(indexPath.row == 2)
    {
        [self.navigationController pushViewController:[[SearchView alloc]init] animated:YES];
    }
}

-(UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    NSIndexPath *indexPath = [_tableView indexPathForCell:(UITableViewCell* )[previewingContext sourceView]];
    if (indexPath.row == 0) {
        ViewController *vc = [[ViewController alloc]init];
        vc.preferredContentSize = CGSizeMake(0.0f, 600.0f);
        return vc;
    }
    else if (indexPath.row == 1)
    {
        SecondViewController *svc = [[SecondViewController alloc]init];
        svc.preferredContentSize = CGSizeMake(0, 600);
        return svc;
    }
    else
    {
        SearchView *searchVC = [[SearchView alloc]init];
        searchVC.preferredContentSize = CGSizeMake(0, 600);
        return searchVC;
    }
}

-(void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
