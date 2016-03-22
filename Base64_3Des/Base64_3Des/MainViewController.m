//
//  MainViewController.m
//  Base64_3Des
//
//  Created by 王会洲 on 16/3/22.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "HZCommanFunc.h"

@interface MainViewController ()
@property (nonatomic, strong) NSString * path;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"加密-解密";
    
    // 对文本处理
    NSString *str = [NSString stringWithFormat:@"5YyX5Lqs"];
    NSString *str1 = [NSString stringWithFormat:@"北京"];
    NSLog(@"Str=======>>%@",[HZCommanFunc textFromBase64String:str]);   //可使用宏调用
    NSLog(@"Str=======>>%@",[HZCommanFunc base64StringFromText:str1]);  //可使用宏调用
    
    
    // 对文件处理
    NSString * ticketPath = [[NSBundle mainBundle] pathForResource:@"1.pdf" ofType:nil];
    NSData * ticketData = [NSData dataWithContentsOfFile:ticketPath];
    NSString * tickeSrt = [HZCommanFunc base64Encode:ticketData];
    
    NSData * resultData = [HZCommanFunc base64Decode:tickeSrt];
    NSString *homepath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    self.path = [homepath stringByAppendingPathComponent:@"record2.pdf"];
    NSLog(@"==>>>%@",self.path);
    [resultData writeToFile:self.path atomically:YES];
    
    
    
    // 读取文件流
//    NSError *error=nil;
//    NSString * tickePaths = [[NSBundle mainBundle] pathForResource:@"1.txt" ofType:nil];
//    NSString *tickeSrt=[NSString stringWithContentsOfFile:tickePaths encoding:NSUTF8StringEncoding error:&error];
    
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
