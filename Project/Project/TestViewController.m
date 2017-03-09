//
//  TestViewController.m
//  Project
//
//  Created by 姚君 on 17/2/6.
//  Copyright © 2017年 certus. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@property (nonatomic,strong)NSMutableArray *myArr;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSString *name = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleExecutable"];
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:name];
    
    self.myArr = [NSMutableArray arrayWithArray:@[@1,@2]];
    [self.myArr addObject:@3];
    NSMutableArray *myArr = [NSMutableArray array];
    [myArr addObject:name];
    NSLog(@"self.myArr=%@",self.myArr);
    NSLog(@"myArr=%@",myArr);

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
