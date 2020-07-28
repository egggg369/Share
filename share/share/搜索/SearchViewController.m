//
//  SearchViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/22.
//  Copyright © 2020 无. All rights reserved.
//

#import "SearchViewController.h"
#import "DabaiViewController.h"
#import "UpViewController.h"
#import "DabaiTableViewCell.h"
@interface SearchViewController () <UITextFieldDelegate>

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize: 20], NSForegroundColorAttributeName:[UIColor whiteColor]}];

        self.navigationController.navigationBar.translucent = NO;
    
    [self createUI];
    
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:25];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"搜索";
        self.navigationItem.titleView = titleLabel;
        
        self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.93f blue:1.00f alpha:1.00f];
    
    UITextField* textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(19, 20, 375, 50);
    //textField.text = @"用户名";
    textField.font = [UIFont systemFontOfSize:15];
    textField.textColor = [UIColor blackColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.placeholder = @"搜索 用户名 作品分类 文章";
    textField.secureTextEntry = NO;
    
    [textField addTarget:self action:@selector(dabai:) forControlEvents:UIControlEventEditingDidEndOnExit];
    [self.view addSubview: textField];
    
    
//    self.searchBar = [[UITextField alloc]initWithFrame:CGRectMake(19, 20, 300, 50)];
//    self.searchBar.text=@"搜索 用户名 作品分类 文章";
//    self.searchBar.backgroundColor = [UIColor whiteColor];
//    self.searchBar.delegate = self;
//    self.searchBar.borderStyle = UITextBorderStyleRoundedRect;
//    //self.searchBar.keyboardType = UIKeyboardTypePhonePad;
//    [self.searchBar addTarget:self action:@selector(dabai:) forControlEvents:UIControlEventEditingDidEndOnExit];
//    self.searchBar.delegate = self;
//    [self.view addSubview:self.searchBar];
    

    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 0, 20, 20)];
    imgView.image = [UIImage imageNamed:@"搜索.png"];
    textField.leftView = imgView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *imgView01 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"分类.png"]];
    imgView01.frame = CGRectMake(20, 90, 375, 30);
    imgView01.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:imgView01 atIndex:0];
    
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(20, 130, 70, 25);
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:@"平面设计" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton* btn01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn01.frame = CGRectMake(105, 130, 70, 25);
    btn01.backgroundColor = [UIColor whiteColor];
    [btn01 setTitle:@"网页设计" forState:UIControlStateNormal];
    [btn01 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn01.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn01 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn01];
    
    UIButton* btn02 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn02.frame = CGRectMake(190, 130, 70, 25);
    btn02.backgroundColor = [UIColor whiteColor];
    [btn02 setTitle:@"UI/icon" forState:UIControlStateNormal];
    [btn02 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn02.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn02 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn02];
    
    UIButton* btn03 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn03.frame = CGRectMake(270, 130, 70, 25);
    btn03.backgroundColor = [UIColor whiteColor];
    [btn03 setTitle:@"插画/手绘" forState:UIControlStateNormal];
    [btn03 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn03.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn03 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn03];
    
    
    UIButton* btn04 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn04.frame = CGRectMake(20, 170, 90, 25);
    btn04.backgroundColor = [UIColor whiteColor];
    [btn04 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    [btn04 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn04.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn04 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn04];
    
    UIButton* btn05 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn05.frame = CGRectMake(135, 170, 35, 25);
    btn05.backgroundColor = [UIColor whiteColor];
    [btn05 setTitle:@"影视" forState:UIControlStateNormal];
    [btn05 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn05.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn05 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn05];
    
    
    UIButton* btn06 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn06.frame = CGRectMake(200, 170, 35, 25);
    btn06.backgroundColor = [UIColor whiteColor];
    [btn06 setTitle:@"摄影" forState:UIControlStateNormal];
    [btn06 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn06.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn06 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn06];
    
    
    UIButton* btn07 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn07.frame = CGRectMake(270, 170, 35, 25);
    btn07.backgroundColor = [UIColor whiteColor];
    [btn07 setTitle:@"其他" forState:UIControlStateNormal];
    [btn07 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn07.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn07 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn07];
    
    
    UIImageView *imgView02 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"推荐.png"]];
    imgView02.frame = CGRectMake(20, 200, 375, 30);
    imgView02.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:imgView02 atIndex:0];
    
    UIButton* btn08 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn08.frame = CGRectMake(20, 240, 70, 25);
    btn08.backgroundColor = [UIColor whiteColor];
    [btn08 setTitle:@"人气最高" forState:UIControlStateNormal];
    [btn08 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn08.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn08 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn08];
    
    UIButton* btn09 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn09.frame = CGRectMake(105, 240, 70, 25);
    btn09.backgroundColor = [UIColor whiteColor];
    [btn09 setTitle:@"收藏最多" forState:UIControlStateNormal];
    [btn09 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn09.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn09 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn09];
    
    UIButton* btn10 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn10.frame = CGRectMake(190, 240, 70, 25);
    btn10.backgroundColor = [UIColor whiteColor];
    [btn10 setTitle:@"评论最多" forState:UIControlStateNormal];
    [btn10 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn10.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn10 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn10];
    
    UIButton* btn11 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn11.frame = CGRectMake(270, 240, 70, 25);
    btn11.backgroundColor = [UIColor whiteColor];
    [btn11 setTitle:@"编辑精选" forState:UIControlStateNormal];
    [btn11 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn11.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn11 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn11];
    
    
    UIImageView *imgView03 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"时间.png"]];
       imgView03.frame = CGRectMake(20, 280, 375, 30);
       imgView03.autoresizingMask = UIViewAutoresizingFlexibleWidth;
       [self.view insertSubview:imgView03 atIndex:0];
    
    UIButton* btn12 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn12.frame = CGRectMake(20, 320, 70, 25);
    btn12.backgroundColor = [UIColor whiteColor];
    [btn12 setTitle:@"30分钟前" forState:UIControlStateNormal];
    [btn12 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn12.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn12 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn12];
    
    
    UIButton* btn13 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn13.frame = CGRectMake(105, 320, 70, 25);
    btn13.backgroundColor = [UIColor whiteColor];
    [btn13 setTitle:@"1小时前" forState:UIControlStateNormal];
    [btn13 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn13.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn13 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn13];
    
    
    UIButton* btn14 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn14.frame = CGRectMake(195, 320, 50, 25);
    btn14.backgroundColor = [UIColor whiteColor];
    [btn14 setTitle:@"1月前" forState:UIControlStateNormal];
    [btn14 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn14.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn14 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn14];
    
    
    UIButton* btn15 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn15.frame = CGRectMake(270, 320, 50, 25);
    btn15.backgroundColor = [UIColor whiteColor];
    [btn15 setTitle:@"1年前" forState:UIControlStateNormal];
    [btn15 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn15.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn15 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn15];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    
    
}

-(void) createUI
{
    
    
    UIImage *ima = [[UIImage imageNamed:@"上传"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *image = [[UIBarButtonItem alloc]initWithImage:ima style:UIBarButtonItemStyleDone target:self action:@selector(up)];
    self.navigationItem.rightBarButtonItems = @[image];
    //self.navigationItem.leftBarButtonItems = @[word];
    
    
//    UIImage *ima01 = [[UIImage imageNamed:@"返回"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    UIBarButtonItem *image01 = [[UIBarButtonItem alloc]initWithImage:ima01 style:UIBarButtonItemStyleDone target:self action:@selector(next)];
//    self.navigationItem.leftBarButtonItems = @[image01];
    
}

-(void)viewTapped:(UITapGestureRecognizer*)tap1
{

    [self.view endEditing:YES];

}




- (void) up
{
    UpViewController *upViewController = [[UpViewController alloc] init];
    [self.navigationController pushViewController:upViewController animated:YES];
}



- (void)touchBtn1:(UIButton *)button {
    button.selected = !button.selected;
}

- (void)dabai:(UITextField *)tf{
    NSString *str = tf.text;
    NSString *str1 = @"大白";
    if ([str1 isEqualToString:str])  {
        DabaiViewController *dabaiViewController = [[DabaiViewController alloc] init];
        [self.navigationController pushViewController:dabaiViewController animated:YES];
    }
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
