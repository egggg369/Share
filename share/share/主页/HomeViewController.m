//
//  HomeViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/22.
//  Copyright © 2020 无. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "HolidayViewController.h"
#define COUNT 4
@interface HomeViewController ()  <UITableViewDelegate,UITableViewDataSource>
{
    UIScrollView *_sv;
    UIPageControl *_pc;
    NSTimer *_timer;
}
@end

@implementation HomeViewController

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
        titleLabel.text = @"SHARE";
        self.navigationItem.titleView = titleLabel;
        
        self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.93f blue:1.00f alpha:1.00f];

    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 150, 416, 580)];
    
    
    [self.tableView registerClass:[HomeTableViewCell class] forCellReuseIdentifier:@"home"];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [self.view addSubview:_tableView];
    
    
            _sv = [[UIScrollView alloc]init];
            _sv.frame = CGRectMake(0, 0, 416, 150);
//            _sv.pagingEnabled = YES;
//            _sv.scrollEnabled = YES;
//            _sv.contentSize = CGSizeMake(416*4, 150);
//            _sv.bounces = YES;
//            _sv.alwaysBounceHorizontal = YES;
//            _sv.alwaysBounceVertical = YES;
//            _sv.showsHorizontalScrollIndicator = NO;
//            _sv.showsVerticalScrollIndicator = YES;
//            _sv.backgroundColor = [UIColor whiteColor];
    
//            for(int i = 0; i < 4; i++) {
//                NSString* strName = [NSString stringWithFormat:@"1-0-%d.png",i+1];
//                UIImage* image = [UIImage imageNamed:strName];
//                UIImageView* iView = [[UIImageView alloc]initWithImage:image];
//                iView.frame = CGRectMake(416*i, 0, 416, 150);
//                [_sv addSubview:iView];
//            }
    
            [self.view addSubview:_sv];
    
    for(int i = 0; i < COUNT + 2; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * 416, 0, 416, 150)];
        
        NSString *imageName = [NSString stringWithFormat:@"1-0-%d", i];
        
        if( i == 0) {
            imageName = @"1-0-4";
        }else if (i == COUNT + 1) {
            imageName = @"1-0-1";
        }
        
        
        imageView.image = [UIImage imageNamed:imageName];
        
        [_sv addSubview:imageView];
    }
    
    _sv.contentSize = CGSizeMake((COUNT + 2) * 416, 150);
    
    _sv.pagingEnabled = YES;
    
    
    
    _pc = [[UIPageControl alloc] initWithFrame:CGRectMake(50, 115, 300, 30)];
    _pc.backgroundColor = [UIColor clearColor];
    //有几个小圆点
    _pc.numberOfPages = COUNT;
    //当前显示第几个
    _pc.currentPage = 0;
    //当前小圆点的颜色
    _pc.currentPageIndicatorTintColor = [UIColor whiteColor];
    //其他小圆点的颜色
    //pc.pageIndicatorTintColor = [UIColor purpleColor];
    
    [_pc addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_pc];
    
    [self createTimer];
    
    
    _sv.delegate = self;
    
}

- (void)createTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(runA) userInfo:nil repeats:YES];
}


- (void) runA
{
    [_sv setContentOffset:CGPointMake((_pc.currentPage + 2) * 416, 0) animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if(_sv.contentOffset.x == 0) {
        _sv.contentOffset = CGPointMake(COUNT * 416, 0);
    }else if (_sv.contentOffset.x == (COUNT + 1)*416) {
        _sv.contentOffset = CGPointMake(416, 0);
    }
    
    
    _pc.currentPage = _sv.contentOffset.x / 416 - 1;
    
    
}


     

- (void) change: (UIPageControl *)pc
{
    [_sv setContentOffset:CGPointMake(_pc.currentPage * 416, 0) animated:YES];
    
}


//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    //定时器开始
//    [_timer setFireDate:[NSDate distantFuture]];
//}
//
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
//{
//    [_timer setFireDate:[NSDate distantPast]];
//}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止定时器
    [_timer invalidate];
}
//当不再按图片 也就是松开的时候 立马调用计时器方法
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    //用scheduledTimerWithTimeInterval 创建定时器是用的系统默认的方法 当遇见多线程时候会出现问题
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //所以还是调用上面创建的定时器方法
    [self createTimer];
}



- (CGFloat)tableView: (UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 150;
}

//- (void)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) {
        HolidayViewController *holidayViewController = [[HolidayViewController alloc]init];
        [self.navigationController pushViewController:holidayViewController animated:NO];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
    
            HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"home" forIndexPath:indexPath];
            NSArray *titileArr1 = @[@"假日",@"用户设计PK站",@"字体故事",@"板式整理术"];
            NSArray *nameArr1 = @[@"share小白",@"share小王", @"share小吕", @"share小王"];
            NSArray *timeArr1 = @[@"16分钟前", @"17分钟前", @"45分钟前", @"4小时前"];
            NSArray *imageArr1 = @[@"1-1", @"3-1-2", @"3-1-3", @"3-1-4"];
    
            cell.image1.image = [UIImage imageNamed:imageArr1[indexPath.section]];
            cell.label1.text = titileArr1[indexPath.section];
            cell.label2.text = nameArr1[indexPath.section];
            cell.label3.text = timeArr1[indexPath.section];
    
    
            return cell;
        
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
