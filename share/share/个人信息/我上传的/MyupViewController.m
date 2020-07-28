//
//  MyupViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/25.
//  Copyright © 2020 无. All rights reserved.
//

#import "MyupViewController.h"
#import "MyupTableViewCell.h"
#import "MyselfViewController.h"
@interface MyupViewController ()

@end

@implementation MyupViewController

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
            titleLabel.text = @"我上传的";
            self.navigationItem.titleView = titleLabel;
            
            self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.93f blue:1.00f alpha:1.00f];

        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.view.frame.size.height);
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.bouncesZoom = NO;
        _scrollView.alwaysBounceVertical = NO;
        _scrollView.scrollEnabled = YES;
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
        
        
            
        
        _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, self.view.frame.size.width, self.view.frame.size.height) ];
        _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 1, 40, self.view.frame.size.width, 800)];
        _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 40, self.view.frame.size.width, 800)];
        
        _tableView1.delegate = self;
        _tableView1.dataSource = self;
        _tableView2.delegate = self;
        _tableView2.dataSource = self;
        _tableView3.delegate = self;
        _tableView3.dataSource = self;
        
        
        
        _tableView1.tag = 1;
        _tableView2.tag = 2;
        _tableView3.tag = 3;
        
        [_tableView1 registerClass:[MyupTableViewCell class] forCellReuseIdentifier:@"myup1"];
    //    [_tableView1 registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"article1-2"];
    //    [_tableView1 registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"article1-3"];
    //    [_tableView1 registerClass:[ArticleTableViewCell class] forCellReuseIdentifier:@"article1-4"];
        [_tableView2 registerClass:[MyupTableViewCell class] forCellReuseIdentifier:@"myup2"];
        [_tableView3 registerClass:[MyupTableViewCell class] forCellReuseIdentifier:@"myup3"];
        
        [_scrollView addSubview:_tableView1];
        [_scrollView addSubview:_tableView2];
        [_scrollView addSubview:_tableView3];
        
        NSArray *array = @[@"上传时间", @"推荐最多", @"分享最多"];
        
        _segment = [[UISegmentedControl alloc] initWithItems:array];
        _segment.frame = CGRectMake(0, 0, self.view.frame.size.width, 40);
        _segment.tintColor = [UIColor blackColor];
        _segment.backgroundColor = [UIColor blackColor];
        _segment.momentary = NO;
        _segment.selectedSegmentIndex = 0;
        [_segment setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //未被选中状态
        [_segment setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blueColor]} forState:UIControlStateSelected];
        //被选中状态
        [_segment setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
        [self.view addSubview:_segment];
        [_segment addTarget:self action:@selector(roll) forControlEvents:UIControlEventValueChanged];
    
    [self createUI];
        
}

-(void) createUI
{
    
    
    UIImage *ima01 = [[UIImage imageNamed:@"返回"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *image01 = [[UIBarButtonItem alloc]initWithImage:ima01 style:UIBarButtonItemStyleDone target:self action:@selector(next)];
    self.navigationItem.leftBarButtonItems = @[image01];
    
}

-(void) next
{
//    MyselfViewController *myselfViewController = [[MyselfViewController alloc] init];
//    [self.navigationController pushViewController:myselfViewController animated:YES];
    [self.navigationController popViewControllerAnimated:YES];
}



- (void) roll
{
    switch(_segment.selectedSegmentIndex) {
        case 0:
            [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            break;
        case 1:
            [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:YES];
            break;
        case 2:
            [_scrollView setContentOffset:CGPointMake(self.view.frame.size.width * 2, 0) animated:YES];
            break;
        default:
            break;
    }
}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(_scrollView.contentOffset.x == 0) {
        _segment.selectedSegmentIndex = 0;
    }
    if(_scrollView.contentOffset.x == self.view.frame.size.width) {
        _segment.selectedSegmentIndex = 1;
    }if(_scrollView.contentOffset.x == self.view.frame.size.width * 2){
        _segment.selectedSegmentIndex = 2;
    }
}


- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 170;
}

//- (void)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home"forIndexPath:indexPath];
    if(tableView.tag == 1) {
        MyupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myup1" forIndexPath:indexPath];
        NSArray *titileArr1 = @[@"字体故事",@"板式整理术", @"关于设计反馈",@"用户设计PK站"];
        NSArray *nameArr1 = @[@"share小白",@"share小王", @"share小吕", @"share小王"];
        NSArray *timeArr1 = @[@"16分钟前", @"17分钟前", @"45分钟前", @"4小时前"];
        NSArray *imageArr1 = @[@"3-1-3", @"3-1-4",@"3-1-1", @"3-1-2" ];
        
        cell.picture.image = [UIImage imageNamed:imageArr1[indexPath.section]];
        cell.lbTitle.text = titileArr1[indexPath.section];
        cell.lbName.text = nameArr1[indexPath.section];
        cell.lbTime.text = timeArr1[indexPath.section];
        
        
        return cell;
    }else if (tableView.tag == 2) {
        MyupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myup2" forIndexPath:indexPath];
        
        NSArray *titileArr1 = @[@"和太阳打招呼",@"无聊的泡泡",@"请把我带走",@"猫猫怎么这么可爱！！！"];
        NSArray *nameArr1 = @[@"share小白",@"share小王", @"share小吕", @"share小王"];
        NSArray *timeArr1 = @[@"16分钟前", @"7小时前", @"3天前", @"4小时前"];
        NSArray *imageArr1 = @[@"5-1-1.jpg", @"5-1-2.jpg", @"5-1-3.jpg", @"5-1-4.jpg"];
        
        cell.picture.image = [UIImage imageNamed:imageArr1[indexPath.section]];
        cell.lbTitle.text = titileArr1[indexPath.section];
        cell.lbName.text = nameArr1[indexPath.section];
        cell.lbTime.text = timeArr1[indexPath.section];
        
        return cell;
    }else {
        MyupTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myup3" forIndexPath:indexPath];
        
        NSArray *titileArr1 = @[@"夕阳一角",@"聆听音乐的奥秘",@"水彩速绘",@"薰衣草"];
        NSArray *nameArr1 = @[@"share小白",@"share小李", @"share小吕", @"share小郭"];
        NSArray *timeArr1 = @[@"16分钟前", @"5天前", @"45分钟前", @"4分钟前"];
        NSArray *imageArr1 = @[ @"3-3-2.jpeg", @"3-3-3.jpg", @"3-3-1.jpeg",@"3-3-4.jpg"];
        
        cell.picture.image = [UIImage imageNamed:imageArr1[indexPath.section]];
        cell.lbTitle.text = titileArr1[indexPath.section];
        cell.lbName.text = nameArr1[indexPath.section];
        cell.lbTime.text = timeArr1[indexPath.section];
        
        return cell;
    }
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
