//
//  FTaugusta.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "FTaugusta.h"
#import "imagecell.h"

#import "RESideMenu.h"
@interface FTaugusta ()

@end

@implementation FTaugusta

@synthesize itemshowdetailsAr,itemshowdetailsAr_flame1;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"l1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    [self.navigationItem setHidesBackButton:YES animated:YES];
    flamegallery = [[FGalleryViewController1 alloc] initWithPhotoSource:self];
    [self.navigationController presentViewController:flamegallery animated:YES completion:^{
        nil;}];
    return self;
}


#pragma mark - View lifecycle
-(void)viewDidLoad
{
    
    [self.navigationItem setHidesBackButton:YES animated:YES];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"l1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:YES animated:NO];
    [self.navigationItem setBackBarButtonItem:nil];
    flamegallery = [[FGalleryViewController1 alloc] initWithPhotoSource:self];
    [self.navigationController pushViewController:flamegallery animated:YES];
    
    
}
-(void) backButtonAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)loadView {
	[super loadView];
    
    //	self.title = @"Image Gallery";
    //    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    //    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
    //  networkGallery = [[FGalleryViewController alloc] initWithPhotoSource:self];
    // [self.navigationController pushViewController:networkGallery animated:YES];
    
    
    itemshowdetailsAr=[[NSMutableArray alloc]init];
    // itemshowdetailsAr_flame=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame1=[[NSMutableArray alloc]init];
    // itemshowdetailsAr_flame2=[[NSMutableArray alloc]init];
    // itemshowdetailsAr_flame3=[[NSMutableArray alloc]init];
    
	localCaptions = @[@"Lava", @"Hawaii", @"Audi", @"Happy New Year!",@"Frosty Web"];
    localImages = @[@"lava.jpeg", @"hawaii.jpeg", @"audi.jpg"];
    
    
    NSString *post1 =[[NSString alloc] initWithFormat:@"district_id=jge-ftr&feature_id=jge-fp&floorplan_id=jge-fp-au"];
    NSData *postData1 = [post1 dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    NSLog(@"postData.....%@", post1);
    NSString *URL1 = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/property_showcase2.php"];
    NSMutableURLRequest *request1 = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL1] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request1 setHTTPMethod:@"POST"];
    //[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    //[request setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
    [request1 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request1 setHTTPBody:postData1];
    NSError *err1;
    NSURLResponse *response1;
    NSData *responseData1 = [NSURLConnection sendSynchronousRequest:request1 returningResponse:&response1 error:&err1];
    
    NSDictionary *jsonArrayflame1 = [NSJSONSerialization JSONObjectWithData:responseData1 options: NSJSONReadingMutableContainers error: &err1];
    // NSLog(@"%@",jsonArray1);
    NSLog(@"%@",jsonArrayflame1);
    
    if (jsonArrayflame1) {
        
        NSArray *headlines=jsonArrayflame1[@"picture_gallery"];
        
        for (int i=0;i<[headlines count]; i++)
        {
            NSString *ss=headlines[i][@"pg_image_url"];
            
            [self.itemshowdetailsAr_flame1 addObject:ss];
            NSLog(@"%@",itemshowdetailsAr_flame1);
            
        }
        
        flameimages = [[NSArray alloc] initWithArray:itemshowdetailsAr_flame1];
        
    }
    
    self.title = @"Area Plan";
    
    //    UIBarButtonItem *systemItem1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"image.png"] style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    //
    //    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    //
    //    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"l1.png"] style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    //    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void) viewWillDisappear:(BOOL)animated {
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
    }
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    if ([self.navigationController.viewControllers indexOfObject:self]==NSNotFound) {
        // back button was pressed.  We know this is true because self is no longer
        // in the navigation stack.
    }
}
-(void)viewDidAppear:(BOOL)animated
{
}
-(void)viewWillAppear:(BOOL)animated
{
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (receivedData == NULL) {
        receivedData = [[NSMutableData alloc] init];
    }
    else
    {
        receivedData_flame=[[NSMutableData alloc] init];
    }
    [receivedData setLength:0];}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
    [receivedData_flame appendData:data];
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
    /*
     NSError *err1;
     
     NSDictionary *jsonArrayflame1 = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &err1];
     // NSLog(@"%@",jsonArray1);
     NSLog(@"%@",jsonArrayflame1);
     
     if (jsonArrayflame1) {
     
     NSArray *headlines=[jsonArrayflame1 objectForKey:@"picture_gallery"];
     
     for (int i=0;i<[headlines count]; i++)
     {
     NSString *ss=[[headlines objectAtIndex:i]objectForKey:@"pg_image_url"];
     
     [self.itemshowdetailsAr_flame1 addObject:ss];
     NSLog(@"%@",itemshowdetailsAr_flame1);
     
     }
     
     flameimages = [[NSArray alloc] initWithArray:itemshowdetailsAr_flame1];
     
     // [self.collectionViewPack reloadData];
     }    else
     {
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
     [alert show];
     }*/
    
    
}


#pragma mark - FGalleryViewControllerDelegate Methods


- (int)numberOfPhotosForPhotoGallery:(FGalleryViewController1 *)gallery
{
     NSUInteger num1;    if( gallery == flamegallery ) {
        num1 = [flameimages count];
    }
    
     int num=(int)num1;
	return num;
}


- (FGalleryPhotoSourceType1)photoGallery:(FGalleryViewController1 *)gallery sourceTypeForPhotoAtIndex:(NSUInteger)index
{
	return FGalleryPhotoSourceTypeNetwork1;
}



- (NSString*)photoGallery:(FGalleryViewController1*)gallery filePathForPhotoSize:(FGalleryPhotoSize1)size atIndex:(NSUInteger)index {
    return localImages[index];
}

- (NSString*)photoGallery:(FGalleryViewController1 *)gallery urlForPhotoSize:(FGalleryPhotoSize1)size atIndex:(NSUInteger)index {
    //  NSString *caption;
    NSString *counting;
    if( gallery == flamegallery ) {
        counting = flameimages[index];
    }
 	return counting;
    // return [networkImages objectAtIndex:index];
    
}

- (void)handleTrashButtonTouch:(id)sender {
    // here we could remove images from our local array storage and tell the gallery to remove that image
    // ex:
    //[localGallery removeImageAtIndex:[localGallery currentIndex]];
}


- (void)handleEditCaptionButtonTouch:(id)sender {
    // here we could implement some code to change the caption for a stored image
}


#pragma mark - Memory management


- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
