//
//  ViewController.m
//  3DTouchDemo
//
//  Created by xmc on 16/1/30.
//  Copyright © 2016年 parkycloud. All rights reserved.
//

#import "ViewController.h"
#import "PreviewViewController.h"
#import "DetailViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource,UIViewControllerPreviewingDelegate>

@property(nonatomic, strong, readwrite) UITableView *touchItemView;

@property(nonatomic, strong) NSArray *colors;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _colors = [NSArray arrayWithObjects:[UIColor redColor],[UIColor greenColor],[UIColor blueColor], nil];
    
    self.touchItemView = ({
    
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 60.f;
        tableView.tableFooterView = [[UIView alloc] init];
        [self.view addSubview:tableView];
        tableView.layoutMargins = UIEdgeInsetsZero;
        tableView.separatorInset = UIEdgeInsetsZero;
        tableView;
    
    
    });
    
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *cellFlag = @"CellIdentifier";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellFlag];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellFlag];
        
        //首先判断当前控制器是否支持3DTouch
        if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
        {
            //如果支持3DTouch，则注册3DTouch的视图，并为其设置代理
            [self registerForPreviewingWithDelegate:self sourceView:cell];
        }
    }
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"红色";
            break;
            
        case 1:
            cell.textLabel.text = @"绿色";
            break;
            
        default:
            cell.textLabel.text = @"蓝色";
            break;
    }
    
    return cell;

}

#pragma mark-UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:detailVC];
    [self.navigationController presentViewController:navi animated:YES completion:nil];
}

#pragma mark-UIViewControllerPreviewingDelegate

//触发该代理为中度按压
- (UIViewController *)previewingContext:(id)previewingContext viewControllerForLocation:(CGPoint)location
{

    PreviewViewController *previewVC = [[PreviewViewController alloc] init];

    UITableViewCell *cell = (UITableViewCell *)[previewingContext sourceView];
    
    NSIndexPath *indexPath = [self.touchItemView indexPathForCell:cell];
    
    UIColor *bgColor = [_colors objectAtIndex:indexPath.row];
    
    previewVC.bgColor = bgColor;
    
    return previewVC;
}

//弹出上述预览视图后，再继续用力按压触发
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    
    [self.navigationController pushViewController:viewControllerToCommit animated:NO];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
