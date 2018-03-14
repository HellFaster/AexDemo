//
//  ViewController.m
//  AexDemo
//
//  Created by JordanCZ on 2018/3/13.
//  Copyright © 2018年 JordanCZ. All rights reserved.
//

#import "ViewController.h"
#import "AexNetHandler.h"

@interface ViewController ()
@property (nonatomic, strong) AexNetHandler *netHandler;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)buttonMyAccount:(id)sender {
    [self.netHandler requestMyBalance:^(id responseOjbect) {
        NSLog(@"请求成功: %@",responseOjbect);
        [self showAlertMessage:@"请求成功,查看数据在控制台"];
    } failure:^(id error, NSString *msg) {
        NSLog(@"请求失败: %@",msg);
        [self showAlertMessage:[NSString stringWithFormat:@"请求失败: %@",msg]];
    }];
}

- (IBAction)buttonTickerAction:(id)sender {
    [self.netHandler  requestDepthWith:@"bts" mktype:@"btc" success:^(id responseOjbect) {
        NSLog(@"请求成功: %@",responseOjbect);
        [self showAlertMessage:@"请求成功,查看数据在控制台"];
     
    } failure:^(id error, NSString *msg) {
         NSLog(@"请求失败: %@",msg);
        [self showAlertMessage:[NSString stringWithFormat:@"请求失败: %@",msg]];
    }];
}

- (void)showAlertMessage:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:message                                                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction  *okAction = [UIAlertAction  actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}


- (AexNetHandler *)netHandler{
    if (!_netHandler) {
        _netHandler = [[AexNetHandler  alloc] init];
    }
    return _netHandler;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
