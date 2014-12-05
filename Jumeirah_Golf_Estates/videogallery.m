//
//  videogallery.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 21/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "videogallery.h"
#import "imagecell.h"
#import "BackgroundLayer.h"
#import "HCYoutubeParser.h"
#import <QuartzCore/QuartzCore.h>
#import <MediaPlayer/MediaPlayer.h>

typedef void(^DrawRectBlock)(CGRect rect);

@interface HCView : UIView {
@private
    DrawRectBlock block;
}

- (void)setDrawRectBlock:(DrawRectBlock)b;

@end

@interface UIView (DrawRect)
+ (UIView *)viewWithFrame:(CGRect)frame drawRect:(DrawRectBlock)block;
@end

@implementation HCView

- (void)setDrawRectBlock:(DrawRectBlock)b {
    block = [b copy];
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    if (block)
        block(rect);
}

@end

@implementation UIView (DrawRect)

+ (UIView *)viewWithFrame:(CGRect)frame drawRect:(DrawRectBlock)block {
    HCView *view = [[HCView alloc] initWithFrame:frame];
    [view setDrawRectBlock:block];
    return view;
}

@end

@interface videogallery ()
{
    NSMutableData *receivedData;
}

@end

@implementation videogallery

@synthesize collectionViewPack,itemshowdetailsAr,img1,img_tit,playercontroller,indicator;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
    [indicator startAnimating];
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.collectionViewPack registerNib:[UINib nibWithNibName:@"imagecell" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    }
    else
    {
        [self.collectionViewPack registerNib:[UINib nibWithNibName:@"imagecell_ipad" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    }
    itemshowdetailsAr=[NSMutableArray new];
    manage=[singleton share];
    NSString *str=manage.imgv1;
    img_tit.text=str;
    //NSString *post =[[NSString alloc] initWithFormat:@"folder_name=%@",str];
   // NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
   // NSLog(@"postData.....%@", post);
    NSString *URL = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/video_gallery.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
   // [request setHTTPBody:postData];
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (con) {
        NSLog(@"data sent ");
    } else
    {
        NSLog(@"Not sent");
    }
    [con start];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (receivedData == NULL) {
        receivedData = [[NSMutableData alloc] init];
    }
    [receivedData setLength:0];}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [error userInfo][NSURLErrorFailingURLStringErrorKey]);
    UIAlertView *customAlert = [[UIAlertView alloc]initWithTitle:@"No NetWork" message:@"Internet Connection is Lost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [customAlert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    NSError *e = nil;
    
    NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &e];
    NSLog(@"%@",jsonArray1);
    
    if (jsonArray1) {
        
        NSArray *headlines=jsonArray1[@"video_gallery"];
        
         for (NSDictionary *tmp in headlines)
        {
             NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
           [itemshowdetails setValue:tmp[@"video_thumbnail"] forKey:@"video_thumbnail"];
            [itemshowdetails setValue:tmp[@"video_url"] forKey:@"video_url"];
               [itemshowdetails setValue:tmp[@"video_title"] forKey:@"video_title"];
            
             [itemshowdetails setValue:tmp[@"youtube_id"] forKey:@"youtube_id"];
            
            //youtube_id
          // NSString *ss=[[headlines objectAtIndex:i]objectForKey:@"video_thumbnail"];
            
            [self.itemshowdetailsAr addObject:itemshowdetails];
            NSLog(@"%@",itemshowdetailsAr);
        }
        

        [self.collectionViewPack reloadData];
    }    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return [itemshowdetailsAr count];
}
- (imagecell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    imagecell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
    
/*  dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(q, ^{
    
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
          [AsynchronousFreeloader loadImageFromLink:(self.itemshowdetailsAr)[indexPath.row][@"video_thumbnail"] forImageView:cell.myImageView withPlaceholder:nil andContentMode:UIViewContentModeScaleAspectFill];
            
        });
    });*/
    cell.activityIndicator.hidden=NO;
    [cell.activityIndicator startAnimating];
     _urlToLoad = nil;
    cell.lbl.hidden=NO;
    cell.lbl.text=(self.itemshowdetailsAr)[indexPath.row][@"video_title"];
   str_id=(self.itemshowdetailsAr)[indexPath.row][@"youtube_id"];
    // NSURL *url = [NSURL URLWithString:(self.itemshowdetailsAr)[indexPath.row][@"video_url"]];
  cell.activityIndicator.hidden = NO;
   // [AsynchronousFreeloader loadImageFromLink:(self.itemshowdetailsAr)[indexPath.row][@"video_thumbnail"] forImageView:cell.myImageView withPlaceholder:nil andContentMode:UIViewContentModeScaleAspectFill];
    [HCYoutubeParser thumbnailForYoutubeID:str_id thumbnailSize:YouTubeThumbnailDefaultHighQuality completeBlock:^(UIImage *image, NSError *error) {
//        
//        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//        spinner.center=self.view.center;
//        spinner.color=[UIColor whiteColor];
//        [self.view addSubview:cell.myImageView];
//        // self.view.center=spinner;
//        
//            //back to the main thread for the UI call
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [spinner startAnimating];
//            });
        
 [cell.activityIndicator startAnimating];
        
        if (!error) {
          // [_playButton setBackgroundImage:image forState:UIControlStateNormal];
          // [AsynchronousFreeloader load:image forImageView:cell.myImageView withPlaceholder:nil andContentMode:UIViewContentModeScaleAspectFill];
           cell.myImageView.image=image;

            NSDictionary *qualities = [HCYoutubeParser h264videosWithYoutubeID:(NSString *)str_id];
            
              //  _playButton.hidden = NO;
                cell.activityIndicator.hidden = YES;
                
               // NSDictionary *qualities = videoDictionary;
                
                NSString *URLString = nil;
                if ([qualities objectForKey:@"small"] != nil) {
                    URLString = [qualities objectForKey:@"small"];
                }
                else if ([qualities objectForKey:@"live"] != nil) {
                    URLString = [qualities objectForKey:@"live"];
                }
                else {
                    [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Couldn't find youtube video" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles: nil] show];
                    return;
                }
                _urlToLoad = [NSURL URLWithString:URLString];
                
            // [AsynchronousFreeloader loadImageFromLink:(self.itemshowdetailsAr)[indexPath.row][@"video_thumbnail"] forImageView:cell.myImageView withPlaceholder:nil andContentMode:UIViewContentModeScaleAspectFill];
                
               // [_playButton setImage:[UIImage imageNamed:@"play_button"] forState:UIControlStateNormal];
            
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            [alert show];
        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//            [spinner stopAnimating];
//            
//        });
        

            }
     
     
     
     ];


    cell.myImageView.userInteractionEnabled=YES;
      [cell.activityIndicator stopAnimating];
    
    [indicator stopAnimating];
    [indicator hidesWhenStopped];

    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
  //  NSURL *url = [NSURL URLWithString:(self.itemshowdetailsAr)[indexPath.row][@"video_url"]];
   // cell.activityIndicator.hidden = NO;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        

   [HCYoutubeParser thumbnailForYoutubeID:str_id thumbnailSize:YouTubeThumbnailDefaultHighQuality completeBlock:^(UIImage *image, NSError *error) {
        if (!error) {
          
            
           NSDictionary *qualities = [HCYoutubeParser h264videosWithYoutubeID:(NSString *)str_id];
                
                //  _playButton.hidden = NO;
               // cell.activityIndicator.hidden = YES;
                
               // NSDictionary *qualities = videoDictionary;
                
                NSString *URLString = nil;
                if ([qualities objectForKey:@"small"] != nil) {
                    URLString = [qualities objectForKey:@"small"];
                }
                else if ([qualities objectForKey:@"live"] != nil) {
                    URLString = [qualities objectForKey:@"live"];
                }
                else {
                    [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Couldn't find youtube video" delegate:nil cancelButtonTitle:@"Close" otherButtonTitles: nil] show];
                    return;
                }
                _urlToLoad = [NSURL URLWithString:URLString];
                
                // [AsynchronousFreeloader loadImageFromLink:(self.itemshowdetailsAr)[indexPath.row][@"video_thumbnail"] forImageView:cell.myImageView withPlaceholder:nil andContentMode:UIViewContentModeScaleAspectFill];
                
                //[_playButton setImage:[UIImage imageNamed:@"play_button"] forState:UIControlStateNormal];
           
        }
        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
            [alert show];
        }
    }];
      });

    
    if (_urlToLoad) {
        
        MPMoviePlayerViewController *mp = [[MPMoviePlayerViewController alloc] initWithContentURL:_urlToLoad];
        [self presentViewController:mp animated:YES completion:NULL];
        
    }
    
    
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)home:(id)sender
{[self.navigationController popViewControllerAnimated:YES];
}
@end
