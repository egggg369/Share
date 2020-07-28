//
//  HolidayViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/24.
//  Copyright © 2020 无. All rights reserved.
//

#import "HolidayViewController.h"
#import "HomeViewController.h"
@interface HolidayViewController ()

@end

@implementation HolidayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize: 20], NSForegroundColorAttributeName:[UIColor whiteColor]}];

        self.navigationController.navigationBar.translucent = NO;
    
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:25];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"假日";
        self.navigationItem.titleView = titleLabel;
        
        self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.93f blue:1.00f alpha:1.00f];

    [self createUI];
    
    
            
    
    
    
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, /*self.view.frame.size.height*/713)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    
    
}

-(void) createUI
{
    
    
    UIImage *ima01 = [[UIImage imageNamed:@"返回"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *image01 = [[UIBarButtonItem alloc]initWithImage:ima01 style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    self.navigationItem.leftBarButtonItems = @[image01];
    
}

-(void) next
{
    //HomeViewController *homeViewController = [[HomeViewController alloc] init];
    //[self.navigationController pushViewController:homeViewController animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        return 140;
    }
    else if (indexPath.section == 1) {
        return 40;
    }else {
        return 1700;
    }
    
}

//- (void)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

            UITableViewCell *cell01 = nil;
            UITableViewCell *cell02 = nil;
            UITableViewCell *cell03 = nil;
    
    cell01 = [_tableView dequeueReusableCellWithIdentifier:@"cell01"];
    cell02 = [_tableView dequeueReusableCellWithIdentifier:@"cell02"];
    cell03 = [_tableView dequeueReusableCellWithIdentifier:@"cell03"];
    
    if(indexPath.section == 0) {
        if(cell01 == nil) {
            cell01 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell01"];
            UILabel *label1 = [[UILabel alloc] init];
                    //[self.view addSubview:label1];
            //[cell01.contentView addSubview:btnRight];
            [cell01.contentView addSubview:label1];
                    label1.text = @"假日";
                    label1.frame = CGRectMake(140, 20, 100, 40);
                    label1.font = [UIFont systemFontOfSize:40];
                    
                    UILabel *label2 = [[UILabel alloc] init];
                    [cell01.contentView addSubview:label2];
                    label2.text = @"share小白";
                    label2.frame = CGRectMake(140, 60, 100, 20);
                    label1.font = [UIFont systemFontOfSize:17];
                    
                    
                    UILabel *label4 = [[UILabel alloc] init];
                    [cell01.contentView addSubview:label4];
                    label4.frame = CGRectMake(320, 35, 70, 15);
                    label4.font = [UIFont systemFontOfSize:15];
                    label4.text = @"15分钟前";
            
                    
                    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    [btn setImage:[[UIImage imageNamed:@"心.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
                    btn.titleLabel.font = [UIFont systemFontOfSize:10];
                    btn.frame = CGRectMake(225, 95, 30, 30);
            [cell01.contentView addSubview:btn];
                    //[self.view addSubview:btn];
                    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
                    
                    
                    
                    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    [btn1 setImage:[[UIImage imageNamed:@"眼睛.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
            btn1.frame = CGRectMake(295, 95, 30, 30);
                    btn1.titleLabel.font = [UIFont systemFontOfSize:10];
                    [cell01.contentView addSubview:btn1];
                    //[_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
                    
                    
                    
                    
                    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    [btn2 setImage:[[UIImage imageNamed:@"分享.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
            btn2.frame = CGRectMake(355, 95, 30, 30);
                    btn2.titleLabel.font = [UIFont systemFontOfSize:10];
                    [cell01.contentView addSubview:btn2];
                    
                    
                    
                    _Zan = [[UILabel alloc] init];
                    _Zan.textColor = [UIColor blueColor];
                    _Zan.text = @"102";
                    _Zan.font = [UIFont systemFontOfSize:15];
            _Zan.frame = CGRectMake(260, 100, 50, 20);
                    //[self.view addSubview:_Zan];
            [cell01.contentView addSubview:_Zan];
                    
                    UILabel *Yan = [[UILabel alloc] init];
                    Yan.frame = CGRectMake(330, 100, 50, 20);
                    Yan.textColor = [UIColor blueColor];
                    Yan.text = @"23";
                    [cell01.contentView addSubview:Yan];
                    
                    UILabel *Fen = [[UILabel alloc] init];
                    Fen.frame = CGRectMake(385, 100, 50, 20);
                    Fen.textColor = [UIColor blueColor];
                    Fen.text = @"62";
                    [cell01.contentView addSubview:Fen];
                    
                    //UIImageView *image1 = [[UIImageView alloc] init];
                    UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"假日头像"]];
                    image1.frame = CGRectMake(15, 20, 90, 90);
                    [cell01.contentView addSubview:image1];
            
        }
        
        return cell01;
    }
    else if(indexPath.section == 1){
        if(cell02 == nil){
            cell02 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell02"];
            UILabel *label5 = [[UILabel alloc] init];
            [cell02.contentView addSubview:label5];
            label5.text = @"多希望列车能把我带到有你的城市";
            label5.frame = CGRectMake(20, 3, 350, 40);
            label5.font = [UIFont systemFontOfSize:20];
        }
        
        return cell02;
    }else //(indexPath.section == 2)
    {
        if(cell03 == nil){
            cell03 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell03"];
            UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"假日1"]];
            image2.frame = CGRectMake(20,3,375, 600);
            [cell03.contentView addSubview:image2];
            
            
            UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"假日2"]];
            image3.frame = CGRectMake(60, 610, 295, 1000);
            [cell03.contentView addSubview:image3];
        }
        
        return cell03;
    }

}




- (void) click {
    if(_zanSelect == NO) {
        _zanSelect = YES;
        _Zan.text = @"103";
    }else {
        _zanSelect = NO;
        _Zan.text = @"102";
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
