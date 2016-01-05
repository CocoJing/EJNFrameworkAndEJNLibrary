//
//  EJNUIViewController.m
//  Enjoyney
//
//  Created by Ryanfu on 15/3/18.
//  Copyright (c) 2015年 Ryanfu. All rights reserved.
//

#import "EJNUIViewController.h"

@interface EJNUIViewController ()

@end

@implementation EJNUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:UIColorFromRGB(0xfafafa)];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    DDLogDebug(@"=========view appear %@=============== ",[self class]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillMoveInVerticalDirection:(CGFloat)height {
    self.view.frame = CGRectMake(0.0f, height, self.view.frame.size.width, self.view.frame.size.height);
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
