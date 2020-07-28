//
//  StartViewController.m
//  share
//
//  Created by 郭红乐 on 2020/7/22.
//  Copyright © 2020 无. All rights reserved.
//

#import "StartViewController.h"
#import "ViewController.h"
@interface StartViewController ()

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"开机界面.jpg"]];
    img.frame =  self.view.bounds;
   img.autoresizingMask = UIViewAutoresizingFlexibleWidth;
   [self.view insertSubview:img atIndex:0];
    
    
    [self performSelector:@selector(changeView) withObject:self afterDelay:2];
    
    //UIWindow * window = [UIApplication  sharedApplication].windows[1];
    //window.rootViewController = tabBarController;

}


- (void)changeView {
    UIWindow *window = self.view.window;
    ViewController *main = [[ViewController alloc] init];

    //添加一个缩放效果
    main.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.1 animations:^{
        main.view.transform = CGAffineTransformIdentity;
    }];

    window.rootViewController = main;
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
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
