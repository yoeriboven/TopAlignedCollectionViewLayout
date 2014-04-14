TopAlignedCollectionViewLayout
====================================

With this UICollectionViewFlowLayout subclass, your UICollectionView looks like a UITableView if you are using cells with dynamic heights.

If items on a row have different heights, the row will get the same height as the biggest item on the row. The smaller items will then center on the y-axis. With YBTopAlignedCollectionViewFlowLayout, all items will be aligned at the top.

![Gif example](http://i58.tinypic.com/13zmhyo.gif).

## How to use

Using YBTopAlignedCollectionViewFlowLayout is very easy:

1. **Add it to your project**. Either download the files or use the pod.
2. Create an object, set the numColumns-property and assign the object to the collectionView.
3. **Implement the two delegate methods:** `- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath` and `- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section`.
