//
//  FSvirtualtour.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "FSvirtualtour.h"
#import "RESideMenu.h"
#import "imagecell.h"
@interface FSvirtualtour ()
{
    NSMutableData *receivedData;
}

@end



@implementation FSvirtualtour

@synthesize collectionViewPack,itemshowdetailsAr,img1,img_tit,playercontroller;
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
    
    NSString *post =[[NSString alloc] initWithFormat:@"district_id=jge-fs&feature_id=jge-vt"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    //  NSLog(@"postData.....%@", post);
    NSString *URL = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/property_showcase3.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (con) {
        NSLog(@"data sent ");
    } else
    {
        NSLog(@"Not sent");
    }
    [con start];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"l1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
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
    UIAlertView *customAlert = [[UIAlertView alloc]initWithTitle:@"No NetWork" message:@"Interet Connection is Lost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [customAlert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    NSError *e = nil;
    
    NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &e];
    NSLog(@"%@",jsonArray1);
    
    if (jsonArray1) {
        
        NSArray *headlines=jsonArray1[@"virtual_tour"];
        
        for (NSDictionary *tmp in headlines)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            /*
             
             NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
             
             [itemshowdetails setValue:[tmp objectForKey:@"date"] forKey:@"date"];
             [itemshowdetails setValue:[tmp objectForKey:@"description"] forKey:@"description"];
             [itemshowdetails setValue:[tmp objectForKey:@"url_path"] forKey:@"url_path"];
             [itemshowdetails setValue:[tmp objectForKey:@"title"] forKey:@"title"];
             [self.itemshowdetailsAr addObject:itemshowdetails];
             
             */
            [itemshowdetails setValue:tmp[@"video_thumbnail"] forKey:@"video_thumbnail"];
            [itemshowdetails setValue:tmp[@"video_url"] forKey:@"video_url"];
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
    
    dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(q, ^{
        /* Fetch the image from the server... */
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            [AsynchronousFreeloader loadImageFromLink:(self.itemshowdetailsAr)[indexPath.row][@"video_thumbnail"] forImageView:cell.myImageView withPlaceholder:nil andContentMode:UIViewContentModeScaleAspectFill];
            
        });
    });
    
    cell.myImageView.userInteractionEnabled=YES;
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    /* manage.image_gallery = itemshowdetailsAr[indexPath.row];
     NSLog(@"manage.image_gallery==%@",manage.image_gallery);
     //manage.FS15=[[self.itemshowdetailsAr objectAtIndex:indexPath.row]objectForKey:@"video_url"];
     
     NSURL *fileuel=[NSURL URLWithString:(self.itemshowdetailsAr)[indexPath.row][@"video_url"]];
     
     playercontroller = [[MPMoviePlayerViewController alloc]
     initWithContentURL:fileuel ];
     [self presentMoviePlayerViewControllerAnimated:playercontroller];
     playercontroller.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
     playercontroller.moviePlayer.movieSourceType=MPMovieSourceTypeUnknown;
     
     playercontroller.moviePlayer.movieSourceType=MPMovieSourceTypeStreaming;
     playercontroller.view.frame = self.view.bounds;
     //[MPMoviePlayerController setScalingMode:MPMovieScalingModeFill];
     [self.view addSubview:playercontroller.view];
     */
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:(self.itemshowdetailsAr)[indexPath.row][@"video_url"]]];
    
    
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
