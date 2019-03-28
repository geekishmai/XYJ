//
//  collectionViewController.m
//  XYJ
//
//  Created by user on 2019/3/27.
//  Copyright © 2019 user. All rights reserved.
//

#import "collectionViewController.h"
#import "trackCell.h"
@interface collectionViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic)NSArray *tracks;
@end

@implementation collectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tracks=@[@"foo",@"bar",@"baz"];
    [self.collectionView reloadData];
}
//numberOfItemsInSection
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.tracks.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //在storyboard设置了cell的identify
    static NSString *cellIdentifier = @"trackCell";
    trackCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    //get the track
    NSString *text = [self.tracks objectAtIndex:indexPath.row];
    
    //populate the cell
    return 0;
}



@end
