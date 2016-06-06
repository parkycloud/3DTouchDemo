//
//  PreviewViewController.m
//  3DTouchDemo
//
//  Created by xmc on 16/1/30.
//  Copyright © 2016年 parkycloud. All rights reserved.
//

#import "PreviewViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"背景颜色";
    self.view.backgroundColor = self.bgColor;
    
    
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    
    UIPreviewAction *sharePreviewAction =[UIPreviewAction actionWithTitle:@"分享" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"分享按钮事件");
    }];
    
    UIPreviewAction *collectPreviewAction =[UIPreviewAction actionWithTitle:@"收藏" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"收藏按钮事件");
    }];
    
    NSArray *actions = @[sharePreviewAction,collectPreviewAction];
    return actions;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
