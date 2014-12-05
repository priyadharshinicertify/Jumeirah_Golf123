//
//  CollectionViewItem.h
//  Jumeirah
//
//  Created by Veeramani on 20/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewItem : UICollectionViewCell
@property (retain, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UILabel *textlabel;

@end
