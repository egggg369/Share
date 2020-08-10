//
//  UpViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/26.
//  Copyright © 2020 无. All rights reserved.
//

#import "UpViewController.h"
#import "UpTableViewCell.h"
#import "PhotoViewController.h"
#import "ShangCollectionViewCell.h"
@interface UpViewController ()

@end

@implementation UpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.93f blue:1.00f alpha:1.00f];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize: 20], NSForegroundColorAttributeName:[UIColor whiteColor]}];

    self.navigationController.navigationBar.translucent = NO;
    
    
    _btn09 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn09.frame = CGRectMake(40, 20, 200, 140);
    _btn09.backgroundColor = [UIColor grayColor];
    [_btn09  setTitle:@"选择图片" forState:UIControlStateNormal];
    [_btn09 addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn09];
    
    //_numm = 0;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:20];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"上传";
    self.navigationItem.titleView = titleLabel;
    
    [self createUI];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"搜索上传坐标.png"]];
    imgView.frame = CGRectMake(275, 20, 120, 30);
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view insertSubview:imgView atIndex:0];
    
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(20, 170, 70, 25);
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:@"平面设计" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton* btn01 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn01.frame = CGRectMake(105, 170, 70, 25);
    btn01.backgroundColor = [UIColor whiteColor];
    [btn01 setTitle:@"网页设计" forState:UIControlStateNormal];
    [btn01 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn01.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn01 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn01];
    
    UIButton* btn02 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn02.frame = CGRectMake(190, 170, 70, 25);
    btn02.backgroundColor = [UIColor whiteColor];
    [btn02 setTitle:@"UI/icon" forState:UIControlStateNormal];
    [btn02 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn02.titleLabel.font = [UIFont systemFontOfSize:18];
    [btn02 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn02];
    
    UIButton* btn03 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn03.frame = CGRectMake(270, 170, 70, 25);
    btn03.backgroundColor = [UIColor whiteColor];
    [btn03 setTitle:@"插画/手绘" forState:UIControlStateNormal];
    [btn03 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn03.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn03 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn03];
    
    UIButton* btn04 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn04.frame = CGRectMake(20, 210, 90, 25);
    btn04.backgroundColor = [UIColor whiteColor];
    [btn04 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    [btn04 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn04.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn04 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn04];
    
    UIButton* btn05 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn05.frame = CGRectMake(135, 210, 35, 25);
    btn05.backgroundColor = [UIColor whiteColor];
    [btn05 setTitle:@"影视" forState:UIControlStateNormal];
    [btn05 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn05.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn05 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn05];
    
    
    UIButton* btn06 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn06.frame = CGRectMake(200, 210, 35, 25);
    btn06.backgroundColor = [UIColor whiteColor];
    [btn06 setTitle:@"摄影" forState:UIControlStateNormal];
    [btn06 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn06.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn06 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn06];
    
    
    UIButton* btn07 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn07.frame = CGRectMake(270, 210, 35, 25);
    btn07.backgroundColor = [UIColor whiteColor];
    [btn07 setTitle:@"其他" forState:UIControlStateNormal];
    [btn07 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn07.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn07 addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn07];
    
    
    
    UITextField* textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(19, 245, 375, 30);
    textField.text = @"眺望";
    textField.font = [UIFont systemFontOfSize:15];
    textField.textColor = [UIColor blackColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.keyboardType = UIKeyboardTypeDefault;
    //textField.placeholder = @"";
    textField.secureTextEntry = NO;
    [self.view addSubview: textField];
    
    
    
    UITextField* textField1 = [[UITextField alloc] init];
    textField1.frame = CGRectMake(19, 280, 375, 90);
    //textField1.text = @"在看宫崎骏的漫画时所感创作....";
    textField1.font = [UIFont systemFontOfSize:15];
    textField1.textColor = [UIColor blackColor];
    textField1.borderStyle = UITextBorderStyleRoundedRect;
    textField1.keyboardType = UIKeyboardTypeDefault;
    textField1.placeholder = @"在看宫崎骏的漫画时所感创作....";
    textField1.secureTextEntry = NO;
    [self.view addSubview: textField1];
    
    
    UIButton* btn08 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn08.frame = CGRectMake(25, 380, 365, 50);
    btn08.backgroundColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [btn08 setTitle:@"发布" forState:UIControlStateNormal];
    [btn08 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[btn setTintColor:[UIColor whiteColor]];
    btn08.titleLabel.font = [UIFont systemFontOfSize:23];
    [btn08 addTarget:self action:@selector(touchBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn08];
    
    UILabel* label = [[UILabel alloc] init];
    label.frame = CGRectMake(60, 435, 70, 30);
    label.text = @"禁止下载";
    label.textColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    label.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:label];
    
    UILabel* label01 = [[UILabel alloc] init];
    label01.frame = CGRectMake(35, 430, 40, 40);
    label01.text = @"口";
    label01.textColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    label01.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label01];
    
    UIButton* btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnRight setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    //btnRight.backgroundColor = [UIColor whiteColor];
    [btnRight addTarget:self action:@selector(pressRight:) forControlEvents:UIControlEventTouchUpInside];
    btnRight.frame = CGRectMake(29, 433, 33, 33);
    [btnRight setTintColor:[UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f]];
    //[btnRight setTintColor:[UIColor redColor]];
    [self.view addSubview:btnRight];
    
    _openSelect = NO;
    
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(275, 60, 100, 25);
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"111"];
    //[_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"little2Cell"];
    
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _strArr = [[NSMutableArray alloc] init];
    [_strArr addObject:@"原创作品"];
    [_strArr addObject:@"设计资料"];
    [_strArr addObject:@"设计师观点"];
    [_strArr addObject:@"设计教程"];
    
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_button];
    _button.frame = CGRectMake(375, 60, 25, 25);
    [_button setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchDown];
    
    
    
    
}

//- (void)pressImage{
//
//    SecondeSelectViewController *root = [[SecondeSelectViewController alloc] init];
//    [root returnText:^(UIImage *imagee){
//        //self -> _iimageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 80, 230, 140)];
//        //[self->_selectButton removeFromSuperview];
//        //[self.view addSubview:self -> _iimageView];
//        [self->_selectButton setImage:imagee forState:UIControlStateNormal];
//    }];
//    [root returnText2:^(NSNumber *num){
//        self -> _num = num;
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(210, 1, 15, 15)];
//        label.backgroundColor = [UIColor redColor];
//        label.textColor = [UIColor whiteColor];
//        label.text = [NSString stringWithFormat:@"%@", self.num];
//
//        //[self->_selectButton removeFromSuperview];
//        //[self->_iimageView addSubview:label];
//        [self->_selectButton addSubview:label];
//    }];
//    // [self presentViewController:root animated:YES completion:nil];
//    [self.navigationController pushViewController:root animated:NO];
//
//}


-(void) click
{
//    UIWindow *window = self.view.window;
//    [window makeKeyAndVisible];
    PhotoViewController *photoViewController = [[PhotoViewController alloc] init];
    //window.rootViewController = photoViewController;
    
    
    
    [photoViewController text:^(UIImage *imagee){

        //[self->_btn09 setImage:imagee forState:UIControlStateNormal];
        self->_btn09.frame = CGRectMake(47, 30, 135, 135);
        [self->_btn09 setImage:[imagee imageWithRenderingMode:UIImageRenderingModeAutomatic] forState:UIControlStateNormal];
    }];
    [photoViewController text2:^(NSNumber *num){
        self -> _num = num;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(160, 1, 15, 15)];
        label.backgroundColor = [UIColor redColor];
        label.textColor = [UIColor whiteColor];
        label.text = [NSString stringWithFormat:@"%@", self.num];


        [self->_btn09 addSubview:label];
    }];
    [self.navigationController pushViewController:photoViewController animated:YES];
    
    
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    _cell = [tableView dequeueReusableCellWithIdentifier:@"111" forIndexPath:indexPath];
    
    if(!_cell) {
        _cell = [[UpTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"111"];
        _cell.selectionStyle = UITableViewCellSelectionStyleGray;
    }
    
    if(_openSelect == YES) {
        _cell.textLabel.text = _strArr[indexPath.row];
        _cell.textLabel.font = [UIFont systemFontOfSize:13];
    }else {
        _cell.textLabel.text = _strArr[indexPath.row];
        _cell.textLabel.font = [UIFont systemFontOfSize:13];
    }
    
    return _cell;
}

- (void)pressBtn:(UIButton *)btn
{
    if(_openSelect == NO) {
        self.tableView.frame = CGRectMake(275, 60, 100, 100);
        _openSelect = YES;
        [btn setImage:[UIImage imageNamed:@"开"] forState:UIControlStateNormal];
    }else {
        self.tableView.frame = CGRectMake(275, 60, 100, 25);
        _openSelect = NO;
        [btn setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    }
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(_openSelect == NO) {
        return 1;
    }else {
        return 4;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 25;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _str = [NSMutableString stringWithString:_strArr[indexPath.row]];
    [_strArr insertObject:_str atIndex:0];
    [_strArr removeObjectAtIndex:indexPath.row+1];
    _openSelect = NO;
    _tableView.frame = CGRectMake(275, 60, 100, 25);
    [_button setImage:[UIImage imageNamed:@"关"] forState:UIControlStateNormal];
    [_tableView reloadData];
}



- (void) pressRight:(UIButton *) btn
{
    btn.selected = !btn.selected;
    if (!btn.selected) {
       [btn setImage:nil forState:UIControlStateNormal];
    }else{
       
        [btn setImage:[UIImage imageNamed:@"duigou.png"] forState:UIControlStateNormal];
    }
}

- (void)touchBtn1:(UIButton *)button {
    button.selected = !button.selected;
}

- (void)touchBtn2:(UIButton *)button {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"发布成功" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alert animated:true completion:nil];
}

- (void) createUI
{
    UIImage *ima01 = [[UIImage imageNamed:@"返回"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *image01 = [[UIBarButtonItem alloc]initWithImage:ima01 style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    self.navigationItem.leftBarButtonItems = @[image01];
}

-(void) next
{
    [self.navigationController popViewControllerAnimated:YES];
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
