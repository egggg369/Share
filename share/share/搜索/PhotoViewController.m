//
//  PhotoViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/27.
//  Copyright © 2020 无. All rights reserved.
//

#import "PhotoViewController.h"
#import "UpViewController.h"
#import "ShangCollectionViewCell.h"
@interface PhotoViewController ()
{
    UIImageView *unSelectImageView;
    UIImageView *selectImageView;
    NSMutableArray * nameArr;
}

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize: 20], NSForegroundColorAttributeName:[UIColor whiteColor]}];

        self.navigationController.navigationBar.translucent = NO;
    
    //[self createUI];
    
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.font = [UIFont boldSystemFontOfSize:25];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"照片墙";
        self.navigationItem.titleView = titleLabel;
    
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.93f blue:1.00f alpha:1.00f];

    
//    UIScrollView *sv = [[UIScrollView alloc] init];
//    sv.frame = CGRectMake(5, 10, self.view.frame.size.width, self.view.frame.size.height);
//    sv.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 1.5);
//    sv.pagingEnabled = YES;
//    sv.bounces = NO;
//    sv.bouncesZoom = NO;
//    sv.alwaysBounceVertical = NO;
//    sv.scrollEnabled = YES;
//    sv.delegate = self;
//    //[self.view addSubview:_scrollView];
//    sv.userInteractionEnabled = YES;
//
//    for(int i = 0; i < 15; i++) {
//        NSString* strName = [NSString stringWithFormat:@"7-%d",i+1];
//        UIImage *image = [UIImage imageNamed:strName];
//        UIImageView *iView = [[UIImageView alloc] initWithImage:image];
//        iView.frame = CGRectMake(3+ (i%3)*140, (i/3)*170+10, 125, 160);
//        [sv addSubview:iView];
//
//        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
//        tap.numberOfTapsRequired = 1;
//        tap.numberOfTouchesRequired = 1;
//        [iView addGestureRecognizer:tap];
//    }
//    [self.view addSubview:sv];
    
    
    
    _numm = 0;
    nameArr = [[NSMutableArray alloc]init];
    
    for(int i = 0; i < 30; i++) {
        [nameArr addObject:[NSMutableString stringWithFormat:@"7-%d.png", i+1]];
    }
    
    
    UIBarButtonItem *shangButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上传" style:UIBarButtonItemStylePlain target:self action:@selector(pressShang)];
    shangButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = shangButtonItem;
    
    self.navigationController.navigationBar.translucent = NO;
    
    
    
    _layOut = [[UICollectionViewFlowLayout alloc] init];
    
    _myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 111) collectionViewLayout:_layOut];
    [self.view addSubview:_myCollectionView];
    
    _myCollectionView.backgroundColor = [UIColor whiteColor];
    _layOut.minimumLineSpacing = 5;
    _layOut.minimumInteritemSpacing = 5;
    _layOut.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    
    
    [_myCollectionView registerClass:[ShangCollectionViewCell class] forCellWithReuseIdentifier:@"111"];
    
    _myCollectionView.allowsMultipleSelection = YES;
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(90, 90);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    ShangCollectionViewCell *cell = [_myCollectionView dequeueReusableCellWithReuseIdentifier:@"111" forIndexPath:indexPath];

    [cell.button setImage:[UIImage imageNamed:nameArr[indexPath.item]] forState:UIControlStateNormal];
    [cell.button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
//        ShangCollectionViewCell  *cell = [_myCollectionView dequeueReusableCellWithReuseIdentifier:@"Ccell" forIndexPath:indexPath];
//
//        cell.photoButton.tag = 100 + indexPath.item;
//        //添加点击事件
//        [cell.photoButton addTarget:self action:@selector(pressSelected :) forControlEvents:UIControlEventTouchUpInside];
//        cell.photoButton.selected = YES;            //设置photoButton的select值
//        cell.photoImageView.image = [UIImage imageNamed:nameArr[indexPath.item]];
    
    return cell;
}



//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//
//    if(!_image){
//        _image = selectImageView.image;
//    }
//    NSLog(@"确定");
//    if(selectImageView.tag == 0) {
//        selectImageView.tag = 1;
//        NSLog(@"%ld", (long)selectImageView.tag);
//        _numm++;
//        UIImage *image = [UIImage imageNamed:@"开启.png"];
//        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//        imageView.frame = CGRectMake(70, 0, 25, 25);
//        [selectImageView addSubview:imageView];
//    } else {
//        selectImageView.tag = 0;
//        _numm--;
//        [selectImageView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    }
//}

- (void)press:(UIButton *) btn{

    if(!_image){
        _image = btn.imageView.image;
    }

//    UIView * cellView = btn.superview.superview;
//    UICollectionView * collectionView = (UICollectionView *)cellView;

    if(btn.selected == NO){
        UIImage *image = [UIImage imageNamed:@"开启"];
        selectImageView = [[UIImageView alloc] initWithImage:image];
        selectImageView.frame = CGRectMake(70, 0, 25, 25);
        btn.selected = YES;
        _numm++;
        [btn addSubview:selectImageView];
        selectImageView.alpha = 1;
    } else {
        _numm--;
        btn.selected = NO;
        selectImageView.alpha = 0;
    }

}

////点击事件
//-(void)pressSelected : (UIButton *) btn {
//    //根据btn不同的selected值，进行选中和取消操作
//    if (btn.selected == YES) {
//      UIImageView *imageView = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"开启.png"]];
//        imageView.frame = CGRectMake(110, 0, 20, 20);
//        [btn addSubview:imageView];
//        btn.selected = NO;
//        _numm = _numm + 1;
//    } else {
//
//        [btn.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];                //移除在btn上的所有子视图，用来去掉右上角的对勾
//        btn.selected = YES;
//        _numm = _numm - 1;
//    }
//}

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


- (void)pressShang{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"确定上传所选内容" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
        UIAlertController *alert2 = [UIAlertController alertControllerWithTitle:@"" message:@"您已成功上传!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *sureAction2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action){
            
            [self.navigationController popViewControllerAnimated:NO];

        }];
        [alert2 addAction:sureAction2];
        [self presentViewController:alert2 animated:NO completion:nil];
        }];
    [alert addAction:cancelAction];
    [alert addAction:sureAction];
    [self presentViewController:alert animated:NO completion:nil];
    
}

- (void)text:(textBlock)block{
    self.textBlock = block;
}

- (void)text2:(textBlock2)block2{
    self.textBlock2 = block2;
}

- (void)viewWillDisappear:(BOOL)animated{
    if(self.textBlock != nil){
        self.textBlock(self.image);
    }
    if(self.textBlock2 != nil){
        _num = @(_numm);
        self.textBlock2(self.num);
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
