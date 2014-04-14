//
//  YBViewController.m
//  TopAligned Example
//
//  Created by Yoeri Boven on 14-04-14.
//  Copyright (c) 2014 Yoeri.me. All rights reserved.
//

#import "YBViewController.h"
#import "YBExampleCell.h"

#import "YBTopAlignedCollectionViewFlowLayout.h"

static NSString *CellIdentifier = @"CellIdentifier";

@interface YBViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>

@property (nonatomic, retain) NSArray *items;

@end

@implementation YBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [UIApplication sharedApplication].statusBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.items = @[@"This is a very long name to show the value", @"John Doe", @"Max van Gelderen", @"Mr. T", @"This subclass is useful for long names", @"Sir Alex Ferguson"];
    
    // UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    YBTopAlignedCollectionViewFlowLayout *layout = [YBTopAlignedCollectionViewFlowLayout new];
    layout.delegate = self;
    layout.numColumns = 3;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[YBExampleCell class] forCellWithReuseIdentifier:CellIdentifier];
    [self.view addSubview:self.collectionView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.items count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YBExampleCell *cell = (YBExampleCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.nameLabel.text = [self.items objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark -
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    YBExampleCell *cell = [YBExampleCell new];
    
    CGFloat textHeight = [[self.items objectAtIndex:indexPath.row] boundingRectWithSize:CGSizeMake(92, MAXFLOAT)
                                                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                                                               attributes:@{NSFontAttributeName : cell.nameLabel.font}
                                                                                  context:nil].size.height;
    
    return CGSizeMake(92, 100 + (((int)ceilf(textHeight) / 22) * 20));
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

@end
