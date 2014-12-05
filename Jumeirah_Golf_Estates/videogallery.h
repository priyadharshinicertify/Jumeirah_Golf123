//
//  videogallery.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 21/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>


@interface videogallery : GAITrackedViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    singleton *manage;
    AVAudioPlayer *audioPlayer;
    NSURL *fileuel;
     NSURL *_urlToLoad;
    NSString *str_id;

    // MPMoviePlayerViewController *moviePlayer;
}
@property(nonatomic,retain)IBOutlet UICollectionView *collectionViewPack;

@property(nonatomic,retain)MPMoviePlayerViewController *playercontroller;

@property(nonatomic,strong)IBOutlet UIView *sample;
//-(void)ShowDetailView:(UIImageView *)imgView;
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property (strong, nonatomic) UIImage *myImage;
@property (strong, nonatomic)IBOutlet UIImageView *img1;
-(IBAction)home:(id)sender;

//-(IBAction)home123:(id)sender;
@property(nonatomic,strong)IBOutlet UILabel *img_tit;

@property(nonatomic,strong) IBOutlet UILabel *title_folder;

@property(nonatomic,retain) NSMutableArray *items;

@property(nonatomic,retain) IBOutlet UIActivityIndicatorView *indicator;



@end
