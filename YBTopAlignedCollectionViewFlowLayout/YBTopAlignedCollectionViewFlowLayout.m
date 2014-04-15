//
//  YBTopAlignedCollectionViewFlowLayout.m
//  Secret
//
//  Created by Yoeri Boven on 09-04-14.
//  Copyright (c) 2014 Yoeri.me. All rights reserved.
//

#import "YBTopAlignedCollectionViewFlowLayout.h"

@interface YBTopAlignedCollectionViewFlowLayout() {
    CGFloat firstItemInRowMaxY;
}

@end

@implementation YBTopAlignedCollectionViewFlowLayout

- (instancetype)initWithNumColumns:(int)numColumns {
    self = [super init];
    
    if (self) {
        self.numColumns = numColumns;
    }
    
    return self;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    if (!self.numColumns || self.numColumns == 0) {
        NSLog(@"%@: numColumns not set. Application will crash.", NSStringFromClass([self class]));
    }
    
    NSArray *attributesToReturn = [super layoutAttributesForElementsInRect:rect];
    for (UICollectionViewLayoutAttributes *attributes in attributesToReturn)
    {
        if (nil == attributes.representedElementKind)
        {
            NSIndexPath *indexPath = attributes.indexPath;
            attributes.frame = [self layoutAttributesForItemAtIndexPath:indexPath].frame;
        }
    }
    return attributesToReturn;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *currentItemAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    CGFloat topInset = [self.delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:indexPath.section].top;

    // First row should be aligned at the top
    if (indexPath.item < self.numColumns){
        currentItemAttributes.frame = ({
            CGRect frame = currentItemAttributes.frame;
            frame.origin.y = topInset + 0;
            frame;
        });

        return currentItemAttributes;
    }
    
    /*
     * if (firstItemInRow) Get height of highest item of previous row, add it to the origin.y of that item and assign it to the current item + topinset
     * else (secondItemInRow OR thirdItemInRow) origin.y should be the same as the first item in the row
    */
    if (indexPath.item % 3 == 0) {
        // Get the heights of the previous row's items
        CGRect frameOne = [self getFrameForItem:indexPath.item - self.numColumns inSection:indexPath.section];
        CGRect frameTwo = [self getFrameForItem:indexPath.item - (self.numColumns - 1) inSection:indexPath.section];
        CGRect frameThree = [self getFrameForItem:indexPath.item - (self.numColumns - 2) inSection:indexPath.section];

        // Add them to an array and retreive the biggest value
        NSArray *heights = @[@(frameOne.size.height), @(frameTwo.size.height), @(frameThree.size.height)];
        CGFloat highestValue = [[heights valueForKeyPath:@"@max.self"] floatValue];
        
        // Assign the highest value to the y coordinate of its frame
        currentItemAttributes.frame = ({
            CGRect frame = currentItemAttributes.frame;
            frame.origin.y = topInset + frameOne.origin.y + highestValue;
            frame;
        });
        
        firstItemInRowMaxY = currentItemAttributes.frame.origin.y;
    }
    else {
        // This item should have the same origin.y as the first item in the row
        currentItemAttributes.frame = ({
            CGRect frame = currentItemAttributes.frame;
            frame.origin.y = firstItemInRowMaxY;
            frame;
        });
    }

    return currentItemAttributes;
}

- (CGRect)getFrameForItem:(NSInteger)item inSection:(NSInteger)section {
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:section];
    return [self layoutAttributesForItemAtIndexPath:indexPath].frame;
}

@end
