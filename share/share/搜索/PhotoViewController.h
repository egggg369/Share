//
//  PhotoViewController.h
//  share
//
//  Created by 郭红乐 on 2020/7/27.
//  Copyright © 2020 无. All rights reserved.
//

#import "ViewController.h"
#import "UpViewController.h"
NS_ASSUME_NONNULL_BEGIN


//typedef void ^(ReturnTextBlock)(UIImage *imagee);
//typedef void ^(ReturnTextBlock2)(NSNumber *num);
@interface PhotoViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property UIImageView *imageView;
@property UICollectionView *myCollectionView;
@property UICollectionViewFlowLayout *layOut;
@property UIImage *image;
@property NSNumber *num;
@property int numm;
@property BOOL select;

@property (nonatomic, copy) ReturnTextBlock returnTextBlock;
@property (nonatomic, copy) ReturnTextBlock2 returnTextBlock2;

- (void)returnText:(ReturnTextBlock)block;
- (void)returnText2:(ReturnTextBlock2)block2;


@end

NS_ASSUME_NONNULL_END
