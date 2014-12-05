//
//  CMFGalleryCell1.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 31/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMFGalleryCell1 : UICollectionViewCell

@property (nonatomic, strong) NSString *imageName;
@property (strong, nonatomic) IBOutlet UILabel *headtxt;
@property (strong, nonatomic) IBOutlet UITextView *brieftx;
@property (strong, nonatomic) IBOutlet UIButton *txt;

-(void)updateCell;


@end
