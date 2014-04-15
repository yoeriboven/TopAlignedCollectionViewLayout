TopAlignedCollectionViewLayout
====================================

With this UICollectionViewFlowLayout subclass, your UICollectionView looks like a UITableView if you are using cells with dynamic heights.

If items on a row have different heights, the row will get the same height as the biggest item on the row. The smaller items will then center on the y-axis. With YBTopAlignedCollectionViewFlowLayout, all items will be aligned at the top.

![Gif example](http://i58.tinypic.com/13zmhyo.gif).

## How to use

Using YBTopAlignedCollectionViewFlowLayout is very easy:

Add the pod `YBTopAlignedCollectionViewFlowLayout` to your Podfile or manually download the files and add them to your project.

```objc
#import "YBTopAlignedCollectionViewFlowLayout.h"
```

Now where you would create the `UICollectionViewFlowLayout` do this:

```objc
YBTopAlignedCollectionViewFlowLayout *layout = [[YBTopAlignedCollectionViewFlowLayout alloc] initWithNumColumns:3];
layout.delegate = self;
```

Don't forget to implement the delegate.
```objc
@interface MyViewController : UIViewController <UICollectionViewDelegateFlowLayout>

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;
```

## Requirements
`YBTopAlignedCollectionViewFlowLayout` requires iOS 6.0 or greater.

The example project only works with iOS 7

## License
Usage is provided under the [MIT License](http://http://opensource.org/licenses/mit-license.php).  See LICENSE for the full details.
