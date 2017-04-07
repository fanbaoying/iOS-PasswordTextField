//
//  ViewController.m
//  iOS 密码输入框
//
//  Created by tianXin on 16/3/21.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import "ViewController.h"
#import "TXSecretaryField.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<TXSecretaryFieldDelegate>
{
    TXSecretaryField *_passWord;

}

@property(strong,nonatomic)UIView *myView;

@property(strong,nonatomic)UILabel *titleLab;

@property(strong,nonatomic)UILabel *moneyLab;

@property(strong,nonatomic)UILabel *lab1;

@property(strong,nonatomic)UILabel *accountLab;

@property(strong,nonatomic)UILabel *lab2;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myView = [[UIView alloc]initWithFrame:CGRectMake(0, 74, SCREEN_WIDTH, SCREEN_HEIGHT/2)];
    self.myView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
    [self.view addSubview:_myView];
    
    self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, 30)];
    self.titleLab.text = @"需付款：";
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.titleLab.font = [UIFont systemFontOfSize:14.0];
    [self.myView addSubview:_titleLab];
    
    self.moneyLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 30)];
    self.moneyLab.text = @"¥1050.00";
    self.moneyLab.textAlignment = NSTextAlignmentCenter;
    self.moneyLab.font = [UIFont systemFontOfSize:18.0];
    [self.myView addSubview:_moneyLab];
    
    self.lab1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, SCREEN_WIDTH-20, 1)];
    self.lab1.backgroundColor = [UIColor lightGrayColor];
    [self.myView addSubview:_lab1];
    
    self.accountLab = [[UILabel alloc]initWithFrame:CGRectMake(20, 91, SCREEN_WIDTH, 29)];
    self.accountLab.text = @"账户余额";
    self.accountLab.textAlignment = NSTextAlignmentLeft;
    self.accountLab.font = [UIFont systemFontOfSize:14.0];
    [self.myView addSubview:_accountLab];
    
    self.lab2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, SCREEN_WIDTH-20, 1)];
    self.lab2.backgroundColor = [UIColor lightGrayColor];
    [self.myView addSubview:_lab2];
    
    //输入框
    _passWord = [[TXSecretaryField alloc] initWithFrame:CGRectMake(20, 130, SCREEN_WIDTH-40, (SCREEN_WIDTH-40)/6)];
    _passWord.secureTextEntry = YES;
    [_passWord becomeFirstResponder];
    _passWord.keyboardType = UIKeyboardTypeNumberPad;
    _passWord.layer.borderColor = [UIColor whiteColor].CGColor;
    _passWord.layer.borderWidth = 2;
    _passWord.layer.cornerRadius = 4;
    _passWord.secretaryDelegate = self;
    [self.myView addSubview:_passWord];
}


-(void)sectetaryDidFinishedInput:(TXSecretaryField *)secField{
    if (secField.text.length == 6) {
        [secField resignFirstResponder];
    }
    NSLog(@"%@",secField.text);
}

@end
