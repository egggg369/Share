//
//  JibenViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/26.
//  Copyright © 2020 无. All rights reserved.
//

#import "JibenViewController.h"

@interface JibenViewController ()

@end

@implementation JibenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:25];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"基本资料";
    self.navigationItem.titleView = titleLabel;
    
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    //[self.tableView registerClass:[XiaoxiTableViewCell class] forCellReuseIdentifier:@"xiaoxi"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [self createUI];
    
    
    
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

- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    }
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
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
     UITableViewCell *cell04 = nil;
    UITableViewCell *cell02 = nil;
    UITableViewCell *cell03 = nil;
    UITableViewCell *cell05 = nil;
    
    cell01 = [_tableView dequeueReusableCellWithIdentifier:@"cell01"];
    cell02 = [_tableView dequeueReusableCellWithIdentifier:@"cell02"];
    cell04 = [_tableView dequeueReusableCellWithIdentifier:@"cell04"];
    cell03 = [_tableView dequeueReusableCellWithIdentifier:@"cell03"];
    cell05 = [_tableView dequeueReusableCellWithIdentifier:@"cell05"];
    
    if(indexPath.section == 0) {
        if(cell01 == nil) {
            cell01 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell01"];
            
            
            UIButton* btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnRight setImage:[UIImage imageNamed:@"假日头像"] forState:UIControlStateNormal];
            //btnRight.backgroundColor = [UIColor whiteColor];
            //[btnRight addTarget:self action:@selector(pressRight:) forControlEvents:UIControlEventTouchUpInside];
            btnRight.frame = CGRectMake(120, 20, 40, 40);
            //[btnRight setTintColor:[UIColor redColor]];
            
            [cell01.contentView addSubview:btnRight];
        }
        
        //cell01.imageView.image = [UIImage imageNamed:@"假日头像.png"];
        cell01.textLabel.text = @"头像";
        return cell01;
    }
    else if (indexPath.section == 1){
        if(cell02 == nil){
            cell02 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell02"];
        }
        cell02.textLabel.text = @"呢称              share小白";
        //cell02.textLabel.font = [UIFont systemFontOfSize:14];
        return cell02;
    }
    else if (indexPath.section == 2){
            if(cell03 == nil){
                cell03 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell03"];
            }
            cell03.textLabel.text = @"签名              开心了就笑，不开心了就过会儿再笑";
            return cell03;
    }else if (indexPath.section == 4){
            if(cell04 == nil){
                cell04 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell04"];
            }
            cell04.textLabel.text = @"邮箱              186######3@qq.com";
            return cell04;
    }else {
        if(cell05 == nil){
            cell05 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell05" ];
            
            _man = YES;
            
            _btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_btn setImage:[[UIImage imageNamed:@"性别关.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
            _btn.frame = CGRectMake(110, 210, 40, 40);
            [self.view addSubview:_btn];
            [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];

            _btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
            [_btn1 setImage:[[UIImage imageNamed:@"性别开.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
            _btn1.frame = CGRectMake(200, 210, 40, 40);
            [self.view addSubview:_btn1];
            [_btn1 addTarget:self action: @selector(click) forControlEvents:UIControlEventTouchUpInside];
            
            
        }
        cell05.textLabel.text = @"性别                     男                  女";
        return cell05;
    }
    
}



- (void)click{
    
    if(_man) {
        _man = NO;
        [_btn setImage:[UIImage imageNamed:@"性别开.png"] forState:UIControlStateNormal];
        [_btn1 setImage:[UIImage imageNamed:@"性别关.png"] forState:UIControlStateNormal];
    } else {
        _man = YES;
        [_btn setImage:[UIImage imageNamed:@"性别关.png"] forState:UIControlStateNormal];
        [_btn1 setImage:[UIImage imageNamed:@"性别开.png"] forState:UIControlStateNormal];
    }
    
}

//-(void)press:(UIButton *) btn{
//    btn.selected = !btn.selected;
//}





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
