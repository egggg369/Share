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


typedef void (^textBlock)(UIImage *imagee);
typedef void (^textBlock2)(NSNumber *num);
@interface PhotoViewController : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property UIImageView *imageView;
@property UICollectionView *myCollectionView;
@property UICollectionViewFlowLayout *layOut;
@property UIImage *image;
@property NSNumber *num;
@property int numm;
@property BOOL select;

@property (nonatomic, copy) textBlock textBlock;
@property (nonatomic, copy) textBlock2 textBlock2;

- (void)text:(textBlock)block;
- (void)text2:(textBlock2)block2;


@end

NS_ASSUME_NONNULL_END
