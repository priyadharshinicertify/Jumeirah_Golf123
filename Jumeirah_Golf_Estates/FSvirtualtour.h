//
//  FSvirtualtour.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
#import "singleton.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
@interface FSvirtualtour : GAITrackedViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    singleton *manage;
    AVAudioPlayer *audioPlayer;
    
    // MPMoviePlayerViewController *moviePlayer;
}
@property(nonatomic,retain)IBOutlet UICollectionView *collectionViewPack;

@property(nonatomic,retain)MPMoviePlayerViewController *playercontroller;


//-(void)ShowDetailView:(UIImageView *)imgView;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property (strong, nonatomic) UIImage *myImage;
@property (strong, nonatomic)IBOutlet UIImageView *img1;
-(IBAction)home:(id)sender;

//-(IBAction)home123:(id)sender;
@property(nonatomic,strong)IBOutlet UILabel *img_tit;

@property(nonatomic,strong) IBOutlet UILabel *title_folder;




@end
