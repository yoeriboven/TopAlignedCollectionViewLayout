//
//  YBTopAlignedCollectionViewFlowLayout.h
//  Secret
//
//  Created by Yoeri Boven on 09-04-14.
//  Copyright (c) 2014 Yoeri.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBTopAlignedCollectionViewFlowLayout : UICollectionViewFlowLayout <UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) id <UICollectionViewDelegateFlowLayout> delegate;
@property int numColumns;

- (instancetype)initWithNumColumns:(int)numColumns;

@end
