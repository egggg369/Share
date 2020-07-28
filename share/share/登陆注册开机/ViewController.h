//
//  ViewController.h
//  share
//
//  Created by 郭红乐 on 2020/7/21.
//  Copyright © 2020 无. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"
@interface ViewController : UIViewController <UITextFieldDelegate , RegisterDelegate>
{
    UITextField* _textField;
    UITextField* _textField01;
}
//@property (nonatomic, strong) UIImageView *imageView;
@property  UITextField *textField;
@property  UITextField *textField01;
@property  UIButton *btn01;
@end

