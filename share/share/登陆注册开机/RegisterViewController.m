//
//  RegisterViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/23.
//  Copyright © 2020 无. All rights reserved.
//

#import "RegisterViewController.h"
#import "ViewController.h"
@interface RegisterViewController () <UITextFieldDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.21 green:0.57 blue:0.80 alpha:1.00];
        
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登陆.png"]];
        imgView.frame = CGRectMake(130, 120, 170, 170);
        imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view insertSubview:imgView atIndex:0];
    
    UITextField* textField02 = [[UITextField alloc] init];
    textField02.frame = CGRectMake(65, 375, 300, 50);
    //textField.text = @"用户名";
    textField02.font = [UIFont systemFontOfSize:15];
    textField02.textColor = [UIColor blackColor];
    textField02.borderStyle = UITextBorderStyleRoundedRect;
    textField02.keyboardType = UIKeyboardTypeDefault;
    //textField.placeholder = @"请输入用户名...";
    textField02.secureTextEntry = NO;
    [self.view addSubview: textField02];
    
        
        _textField = [[UITextField alloc] init];
        _textField.frame = CGRectMake(65, 445, 300, 50);
        //textField.text = @"用户名";
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.textColor = [UIColor blackColor];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.keyboardType = UIKeyboardTypeDefault;
        //textField.placeholder = @"请输入用户名...";
        _textField.secureTextEntry = NO;
        [self.view addSubview: _textField];
        
        _textField01 = [[UITextField alloc] init];
        _textField01.frame = CGRectMake(65, 515, 300, 50);
        //textField01.text = @"密码";
        _textField01.font = [UIFont systemFontOfSize:15];
        _textField01.textColor = [UIColor blackColor];
        _textField01.borderStyle = UITextBorderStyleRoundedRect;
        _textField01.keyboardType = UIKeyboardTypeDefault;
        //textField01.placeholder = @"请输入密码...";
        _textField01.secureTextEntry = YES;
        [self.view addSubview: _textField01];
        
    _textField.delegate = self;
     _textField01.delegate = self;
     _textField02.delegate = self;
        

        
        UIButton* btn01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn01.frame = CGRectMake(155, 585, 100, 40);
        btn01.layer.masksToBounds = YES;
        btn01.layer.borderWidth = 0.9;
        btn01.layer.borderColor = [UIColor whiteColor].CGColor;
        btn01.layer.cornerRadius = 12;
        [btn01 setTitle:@"确认注册" forState:UIControlStateNormal];
        [btn01 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //[btn setTintColor:[UIColor whiteColor]];
        btn01.titleLabel.font = [UIFont systemFontOfSize:20];
        [btn01 addTarget:self action:@selector(touchBtn3:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn01];
        
        
        //UIImageView *imgView01 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"账户.png"]];
        UIImageView *imgView01 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 20, 20)];
        imgView01.image = [UIImage imageNamed:@"账户.png"];
        _textField.leftView = imgView01;
        _textField.leftViewMode = UITextFieldViewModeAlways;

        UIImageView *imgView02 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 20, 20)];
        imgView02.image = [UIImage imageNamed:@"mima.png"];
        _textField01.leftView = imgView02;
        _textField01.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *imgView03 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 20, 20)];
    imgView03.image = [UIImage imageNamed:@"youxiang.png"];
    textField02.leftView = imgView03;
    textField02.leftViewMode = UITextFieldViewModeAlways;
        

        UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
        tap1.cancelsTouchesInView = NO;
        [self.view addGestureRecognizer:tap1];
        
    
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillshow) name:UIKeyboardWillShowNotification object:nil];
    //    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyborardWillHide) name:UIKeyboardWillHideNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
    //让代理去执行方法，取得要传的值
    //[self.delegate input:_textField.text];
    
}


- (void)returnText:(ReturnTextBlock)block {
    self.returnTextBlock = block;
}

- (void)returnText2:(ReturnTextBlock2)block{
    self.returnTextBlock2 = block;
}

- (void)viewWillDisappear:(BOOL)animated {
    if(self.returnTextBlock != nil) {
        self.returnTextBlock(self.textField.text);
        self.returnTextBlock2(self.textField01.text);
    }
}





- (void)touchBtn3:(UIButton*)button
{
//    ViewController *vcView = [[ViewController alloc] init];
//    vcView.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:vcView animated:YES completion:nil];
    [self.delegate input: _textField01.text];
    [self.delegate input: _textField.text];
    [self dismissViewControllerAnimated:NO completion:nil];
//    if([_delegate respondsToSelector:@selector(input:)]) {
//        [_delegate input:_textField.text];
//    }
    
}

-(void)viewTapped:(UITapGestureRecognizer*)tap1
{

    [self.view endEditing:YES];

}

- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
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
