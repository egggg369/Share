//
//  RegisterViewController.h
//  share
//
//  Created by 郭红乐 on 2020/7/23.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//1. 声明代理
@protocol RegisterDelegate <NSObject>

//- (void)pass:(NSString *)str;

- (void) input: (NSString *)text;

@end

@interface RegisterViewController : UIViewController <UITextFieldDelegate>
{
    UITextField* _textField;
    UITextField* _textField01;
    UITextField* _textField02;


}

@property UITextField *textField01;
@property UITextField *textField;
@property UITextField *textField02;
typedef void (^ReturnTextBlock)(NSString *showText);
typedef void (^ReturnTextBlock2)(NSString *showText);

@property ReturnTextBlock returnTextBlock;
@property ReturnTextBlock2 returnTextBlock2;
-(void)returnText:(ReturnTextBlock)block;
-(void)returnText2:(ReturnTextBlock2)block;
//@property UIButton *btn01;
//@property NSString *str;

 //2. 生成一个成员变量，便于访问设置
@property (nonatomic,assign)id <RegisterDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
