//
//  ChatViewController.m
//  share
//
//  Created by 郭红乐 on 2020/8/1.
//  Copyright © 2020 无. All rights reserved.
//

#import "ChatViewController.h"
#define W ([UIScreen mainScreen].bounds.size.width)
#define H ([UIScreen mainScreen].bounds.size.height)
@interface ChatViewController ()

@end

@implementation ChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:25];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"聊天";
    self.navigationItem.titleView = titleLabel;
    
    [self createUI];
    
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(W*0.07, H * 0.74 , W*0.75, H*0.06)];
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.layer.borderColor = [UIColor blackColor].CGColor;
    _textField.delegate = self;
    [self.view addSubview:_textField];
    
    //设置发送按钮
    UIButton *sendButton = [UIButton buttonWithType:UIButtonTypeSystem];
    sendButton.backgroundColor = [UIColor blueColor];
    [sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendButton addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchDown];
    sendButton.frame = CGRectMake(W * 0.83, H * 0.74, W * 0.15, H * 0.06);
    sendButton.layer.borderWidth = 1;
    sendButton.layer.cornerRadius = 10;
    [self.view addSubview:sendButton];
    
    
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H-140) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //分割线
    _tableView.separatorStyle = UITableViewCellAccessoryNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    
    _messageAry = [NSMutableArray arrayWithObjects:@"你好你好", @"哈喽哈喽", @"永远对未来有期待，每个人都会成为更好的自己", @"夏天的风热热的，吹的人心烦烦的，作业么有写完还不可以玩呢，什么时候可以放假呢，我还想吃饭旅游考驾照呢", nil];
    _rowHeightAry = [[NSMutableArray alloc] init];
    for(NSString *str in _messageAry) {
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        CGSize size = [str boundingRectWithSize:CGSizeMake(W*0.6, H*0.41) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        int height = size.height + W * 0.15;
        _rowHeight = [NSNumber numberWithInt:height];
        [_rowHeightAry addObject:_rowHeight];
    }
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tap1.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tap1];
    
    //键盘上移
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
    
}



- (void)send
{
    [_messageAry addObject:_textField.text];
    NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    //自适应高度并计算
    CGSize size = [_textField.text boundingRectWithSize:CGSizeMake(W * 0.6, H*0.58) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    int height = size.height + W * 0.15;
    _rowHeight = [NSNumber numberWithInt:height];
    [_rowHeightAry addObject:_rowHeight];
    
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:(_messageAry.count - 1) inSection:0];
    //加入一个cell
    [self.tableView insertRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationBottom];
    //更新tableview
    [_tableView reloadData];
    //滚动界面（随着消息发送上移）
    [self.tableView scrollToRowAtIndexPath:indexpath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    //清空textField
    _textField.text = @"";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }else {
        //tableView的复用，如果不删除，会出现bug
        //删除cell所有的子视图
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView *) [cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if(indexPath.row % 2 != 0) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"假日头像.png"]];
        imageView.frame = CGRectMake(W * 0.01, W * 0.05, W * 0.1, W * 0.1);
        [cell.contentView addSubview:imageView];
        //对话框
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
                                  label.text = _messageAry[indexPath.row];
        label.text = _messageAry[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary *attri = @{NSFontAttributeName:label.font};
        //自适应高度
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.58) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        label.frame = CGRectMake(W * 0.13, W * 0.07, size.width, size.height + W * 0.05);
        
        //设置聊天气泡
        UIImageView *imageViewBubble = [[UIImageView alloc] init];
        imageViewBubble.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
        imageViewBubble.frame = CGRectMake(W * 0.12, W * 0.07, size.width + W * 0.05, size.height + W * 0.03);
        
        [cell.contentView addSubview:imageViewBubble];
        [cell.contentView addSubview:label];
    }else {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"小兰.png"]];
        imageView.frame = CGRectMake(W * 0.89, W * 0.01, W * 0.1, W * 0.1);
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageAry[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary *attri = @{NSFontAttributeName:label.font};
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(W * 0.6, H * 0.58) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        label.frame = CGRectMake(W * 0.86 - size.width, W * 0.05, size.width, size.height);
        
        UIImageView *imageViewBubble = [[UIImageView alloc] init];
        imageViewBubble.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.0];
        imageViewBubble.frame = CGRectMake(W * 0.82 - size.width, W * 0.03, size.width + W * 0.05, size.height + W * 0.03);
        
        [cell.contentView addSubview:imageViewBubble];
        [cell.contentView addSubview:label];
    }
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = [_rowHeightAry[indexPath.row]floatValue];
    return height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _messageAry.count;
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

//键盘上移的两个函数
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY  + 280 - self.view.frame.size.height);}];
}

//点击空白处键盘消失
-(void)viewTapped:(UITapGestureRecognizer*)tap1
{

    [self.view endEditing:YES];

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
