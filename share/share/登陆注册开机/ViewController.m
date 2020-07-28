//
//  ViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/21.
//  Copyright © 2020 无. All rights reserved.
//

#import "ViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "ActivityViewController.h"
#import "ArticleViewController.h"
#import "MyselfViewController.h"
#import "RegisterViewController.h"

@interface ViewController ()<UITextFieldDelegate, RegisterDelegate>
{
     NSString *userStr;
     NSString *passStr;
}
@end

@implementation ViewController
//@synthesize textField = _textField;
//@synthesize textField = _textField01;
{
    UILabel * _label;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.21 green:0.57 blue:0.80 alpha:1.00];
    
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登陆.png"]];
    imgView.frame = CGRectMake(130, 120, 170, 170);
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:imgView atIndex:0];
    
    _textField = [[UITextField alloc] init];
    _textField.frame = CGRectMake(65, 350, 300, 50);
    //textField.text = @"用户名";
    _textField.font = [UIFont systemFontOfSize:15];
    _textField.textColor = [UIColor blackColor];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.keyboardType = UIKeyboardTypeDefault;
    _textField.placeholder = @"请输入用户名...";
    _textField.secureTextEntry = NO;
    [self.view addSubview: _textField];
    
    _textField01 = [[UITextField alloc] init];
    _textField01.frame = CGRectMake(65, 420, 300, 50);
    //textField01.text = @"密码";
    _textField01.font = [UIFont systemFontOfSize:15];
    _textField01.textColor = [UIColor blackColor];
    _textField01.borderStyle = UITextBorderStyleRoundedRect;
    _textField01.keyboardType = UIKeyboardTypeDefault;
    _textField01.placeholder = @"请输入密码...";
    _textField01.secureTextEntry = YES;
    [self.view addSubview: _textField01];
    
    _textField.delegate = self;
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 490, 100, 40);
    btn.layer.masksToBounds = YES;
    btn.layer.borderWidth = 0.9;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    btn.layer.cornerRadius = 12;
    [btn setTitle:@"登陆" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    UIButton* btn01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn01.frame = CGRectMake(230, 490, 100, 40);
    btn01.layer.masksToBounds = YES;
    btn01.layer.borderWidth = 0.9;
    btn01.layer.borderColor = [UIColor whiteColor].CGColor;
    btn01.layer.cornerRadius = 12;
    [btn01 setTitle:@"注册" forState:UIControlStateNormal];
    [btn01 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn01.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn01 addTarget:self action:@selector(touchBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn01];
    
    UILabel* label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 550, 70, 30);
    label.text = @"自动登录";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
    
    UILabel* label01 = [[UILabel alloc] init];
    label01.frame = CGRectMake(75, 545, 40, 40);
    label01.text = @"口";
    label01.textColor = [UIColor whiteColor];
    label01.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label01];
    
    UIButton* btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    //btnRight.backgroundColor = [UIColor whiteColor];
    [btnRight addTarget:self action:@selector(pressRight:) forControlEvents:UIControlEventTouchUpInside];
    btnRight.frame = CGRectMake(68, 548, 33, 33);
    [btnRight setTintColor:[UIColor whiteColor]];
    //[btnRight setTintColor:[UIColor redColor]];
    [self.view addSubview:btnRight];
    
    //UIImageView *imgView01 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"账户.png"]];
    UIImageView *imgView01 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 20, 20)];
    imgView01.image = [UIImage imageNamed:@"账户.png"];
    _textField.leftView = imgView01;
    _textField.leftViewMode = UITextFieldViewModeAlways;

    UIImageView *imgView02 = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 20, 20)];
    imgView02.image = [UIImage imageNamed:@"mima.png"];
    _textField01.leftView = imgView02;
    _textField01.leftViewMode = UITextFieldViewModeAlways;
    
    userStr = [[NSString alloc] init];
    passStr = [[NSString alloc] init];
    

    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillshow) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyborardWillHide) name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
}


//- (void) dealloc
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
//}

- (void) pressRight:(UIButton *) btn
{
    btn.selected = !btn.selected;
    if (!btn.selected) {
       [btn setImage:nil forState:UIControlStateNormal];
    }else{
       
        [btn setImage:[UIImage imageNamed:@"duigou.png"] forState:UIControlStateNormal];
    }
}


-(void)viewTapped:(UITapGestureRecognizer*)tap1
{

    [self.view endEditing:YES];

}

//- (void)keyboardWillshow:(NSNotification *)aNotification
//{
//    if([self.field isFistResponder] == NO)
//}

- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height);}];
}

- (void)touchBtn1:(UIButton*)button
{
    NSString *name = @"qaz";
    NSString *pass = @"123";
    
    NSString *strName = _textField.text;
    NSString *strPass = _textField01.text;
    
    if(([name isEqualToString:strName] && [pass isEqualToString:strPass]) || ([strName isEqualToString:userStr] && [strPass isEqualToString:passStr] )) {
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    homeViewController.tabBarItem.image = [[UIImage imageNamed:@"home.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    homeViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"home2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    SearchViewController *searchViewController = [[SearchViewController alloc] init];
    searchViewController.tabBarItem.image = [[UIImage imageNamed:@"search.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    searchViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"search2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
 
    ActivityViewController *activityViewController = [[ActivityViewController alloc] init];
    activityViewController.tabBarItem.image = [[UIImage imageNamed:@"activity.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    activityViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"activity2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ArticleViewController *articleViewController = [[ArticleViewController alloc] init];
    articleViewController.tabBarItem.image = [[UIImage imageNamed:@"artical.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    articleViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"artical2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MyselfViewController *myselfViewController = [[MyselfViewController alloc] init];
    myselfViewController.tabBarItem.image = [[UIImage imageNamed:@"myself.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    myselfViewController.tabBarItem.selectedImage = [[UIImage imageNamed:@"myself2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarController* tbController = [[UITabBarController alloc] init];
    tbController.tabBar.translucent = NO;
    tbController.tabBar.barTintColor = [UIColor blackColor];
    
    [[UITabBar appearance]setBackgroundColor:[UIColor blackColor]];
    
    UINavigationController * navHome = [[UINavigationController alloc]initWithRootViewController:homeViewController];
    UINavigationController * navSearch = [[UINavigationController alloc]initWithRootViewController:searchViewController];
    UINavigationController * navArticle = [[UINavigationController alloc]initWithRootViewController:articleViewController];
    UINavigationController * navMyself = [[UINavigationController alloc]initWithRootViewController:myselfViewController];
    UINavigationController * navActivity = [[UINavigationController alloc]initWithRootViewController:activityViewController];
    
        
    //设置导航栏控制器背景
//    navHome.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
//    homeViewController.title = @"SHARE";
//    [navHome.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//
//    navSearch.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
//    searchViewController.title = @"搜索";
//    [navSearch.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//
//    navArticle.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
//    articleViewController.title = @"文章";
//    [navArticle.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//
//    navActivity.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
//    activityViewController.title = @"活动";
//    [navActivity.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//
//    navMyself.navigationBar.barTintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
//    myselfViewController.title = @"个人信息";
//    [navMyself.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
//
    
    UIWindow *window = self.view.window;
    [window makeKeyAndVisible];
    
    
    NSArray* arrayMY = [NSArray arrayWithObjects:navHome, navSearch, navArticle, navActivity,navMyself, nil];
    tbController.viewControllers = arrayMY;
    //self.view.rootViewController = tbController;
    //tbController.selectedIndex = 0;
    window.rootViewController = tbController;
    
    

    tbController.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:tbController animated:YES completion:nil];
    //[self.navigationController pushViewController:tbController animated:YES];
      // HomeViewController *vc = [[HomeViewController alloc] init];
    //self.view.window.rootViewController = vc;
    }else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告" message:@"账号与密码不匹配!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:sureAction];
        [self presentViewController:alert animated:NO completion:nil];
    }

}




- (void)touchBtn2:(UIButton*)button
{
    RegisterViewController *vcRegister = [[RegisterViewController alloc] init];
    //5. 设定代理
    vcRegister.delegate = self;
    
    [vcRegister returnText:^(NSString *showText){
         self->_textField.text = showText;
         self->userStr = showText;
    }];
    [vcRegister returnText2:^(NSString *showText){
         self->_textField01.text = showText;
         self->passStr = showText;
    }];
    
    vcRegister.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vcRegister animated:YES completion:nil];
    //[self.navigationController pushViewController:vcRegister animated:YES];
}

//- (void)pass:(NSString *)str {
//    _textField.text = str;
//}

- (void) input:(NSString *)text
{
    _textField.text = text;
    _textField01.text = text;
}

@end
