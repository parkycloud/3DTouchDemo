//
//  DetailViewController.m
//  3DTouchDemo
//
//  Created by xmc on 16/1/30.
//  Copyright © 2016年 parkycloud. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"详情页面";
    UIImageView *previewImgv = [[UIImageView alloc] init];
    previewImgv.frame = self.view.bounds;
    previewImgv.image = [UIImage imageNamed:@"preview.jpg"];
    [self.view addSubview:previewImgv];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelCurrentView:)];
}

- (void)cancelCurrentView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];

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
