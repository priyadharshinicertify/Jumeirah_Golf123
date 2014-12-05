//
//  imagecell.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 25/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BackgroundLayer.h"
@interface imagecell : UICollectionViewCell

@property(nonatomic,strong)IBOutlet UIView *sample;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property(strong,nonatomic)IBOutlet UIActivityIndicatorView *activityIndicator;
@property(strong,nonatomic)IBOutlet UILabel *lbl;
@end
