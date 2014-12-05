//
//  districview1.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 31/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "districview1.h"
#import <QuartzCore/QuartzCore.h>
#import "Ovierview1.h"
#import "DEMOLeftMenuViewController.h"
#import "FTmain.h"
#import "MainWT.h"
#import "DEMOLeftMenuViewController.h"
#import "RESideMenu.h"
#import "contactus.h"
#import "AppDelegate.h"
#import "Ovierview1.h"
#import "Gallery.h"
#import "Reachability.h"
#import "mainWP.h"
#import "golfnewcell.h"
#import "RESideMenu.h"

#import "CMFGalleryCell1.h"
@interface districview1 ()
@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArray;
@property(nonatomic,strong) NSArray *txtviewarray;
@property(nonatomic,strong)NSArray *headerarray;
@property(nonatomic,strong)NSArray *labelarray;
@end

@implementation districview1
@synthesize dataArray;
@synthesize itemshowdetailsAr,itemshowdetailsAr_flame,itemshowdetailsAr_flame1,itemshowdetailsAr_flame2,itemshowdetailsAr_flame3,timer,rft,lft,v1,vearth,vetpi,vfire,animatedImageView1,animatedImageView,lbl,text123,btn1,btn2,btn3,b4,btn5,btn6,navview,btn4,color,text2,text3,text4,indicator;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
        // Custom initialization
    }
    return self;
}
-(IBAction)home:(id)sender
{
//    UIColor *barColour = [UIColor colorWithRed:(60/255.0) green:(169/255.0) blue:(219/255.0) alpha:1];
//    [[UINavigationBar appearance] setBarTintColor: barColour];
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];
 [[UINavigationBar appearance] setBarTintColor: [UIColor clearColor]];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad
{
    
    //UIColor *colorOne5 = [UIColor colorWithRed:(8/255.0) green:(44/255.0) blue:(148/255.0) alpha:1];
    color.backgroundColor=[UIColor colorWithRed:(130/255.0) green:(201/255.0) blue:(79/255.0) alpha:1];
    
    CAGradientLayer *btnGradient11 = [BackgroundLayer blackWhiteGradient];
    btnGradient11.frame = self.sample1.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample1.layer insertSublayer:btnGradient11 atIndex:0];

    
    
    UIColor *colorOne = [UIColor colorWithRed:76.0/255.0 green:76.0/255.0 blue:76.0/255.0 alpha:1.0];
    btn4.backgroundColor=colorOne;
    // btn4.layer.borderColor=(__bridge CGColorRef)(colorOne);
    btn4.layer.borderWidth=1.0;
    btn4.layer.cornerRadius=5;
    
    
    btn5.backgroundColor=colorOne;
    btn5.layer.borderWidth=1.0;
    btn5.layer.cornerRadius=5;

    text2.hidden=YES;
    text3.hidden=YES;
    text4.hidden=YES;
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];

    
    [super viewDidLoad];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
    
//    CAGradientLayer *btnGradient2 = [BackgroundLayer blackWhiteGradientw];
//    btnGradient2.frame = self.navview.bounds;
//    [self.navview.layer insertSublayer:btnGradient2 atIndex:0];
    
    
    
    
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient1];
    btnGradient.frame = self.v1.bounds;
    // btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    //  UIColor *colorOne = [UIColor colorWithRed:119.0/255.0 green:119.0/255.0 blue:119.0/255.0 alpha:1.0];
    // btnGradient.borderColor=(colorOne).CGColor;
    btn2.hidden=YES;
    btn3.hidden=YES;
    b4.hidden=YES;
    UIColor *colorOne1 = [UIColor colorWithRed:76.0/255.0 green:76.0/255.0 blue:76.0/255.0 alpha:1.0];
    btn5.backgroundColor=colorOne1;
    btn5.layer.borderWidth=1.0;
    btn5.layer.cornerRadius=5;
    
       [self.v1.layer insertSublayer:btnGradient atIndex:0];
    
    
    itemshowdetailsAr_flame=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame1=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame2=[[NSMutableArray alloc]init];
    itemshowdetailsAr_flame3=[[NSMutableArray alloc]init];
   
    
    self.labelarray=[[NSArray alloc]init];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
    [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_iphone" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    else
    {
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        if(orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown){
            // self.view = self.potraitView;
            if(orientation ==UIInterfaceOrientationPortraitUpsideDown){
                NSLog(@"Changed Orientation To PortraitUpsideDown");
                //  [self portraitUpsideDownOrientation];
            }else{
                NSLog(@"Changed Orientation To Portrait");
                
                [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
                UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
                collectionViewLayout.sectionInset = UIEdgeInsetsMake(50, 65, 50,50);
                 color.frame = CGRectMake(68, 529, 298, 179);
//                UICollectionViewFlowLayout *aFlowLayout = [[UICollectionViewFlowLayout alloc] init];
//                [aFlowLayout setSectionInset:UIEdgeInsetsMake(50, 120, 50,50)];

            }
        }else{
            // self.view = self.landscapeView;
            if(orientation ==UIInterfaceOrientationLandscapeLeft){
                NSLog(@"Changed Orientation To Landscape left");
                [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_land" bundle:nil] forCellWithReuseIdentifier:@"cell"];
                UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
                collectionViewLayout.sectionInset = UIEdgeInsetsMake(50, 30, 50,50);
            color.frame = CGRectMake(30, 500, 231, 178);
                
                          }else{
                NSLog(@"Changed Orientation To Landscape right");
                [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_land" bundle:nil] forCellWithReuseIdentifier:@"cell"];
                              UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
                              collectionViewLayout.sectionInset = UIEdgeInsetsMake(50, 30, 50,50);
                             color.frame = CGRectMake(30, 500, 231, 178);
                              


                
              
            }
            
        }
 
        }
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    self.dataArray=@[@"WisperingPines.jpg",@"FlameTree.jpg",@"FireSide.jpg",@"WildFlower.jpg"];
   self.headerarray=@[@"Whispering Pines",@"FlameTree Ridge",@"Redwood",@"WildFlower"];
    
    self.labelarray=@[@"Click View Earth Gallery",@"Click to View ETPI Gallery",@"Click to View Fire Gallery",@"Click to View Fire Gallery"];
    // Do any additional setup after loading the view from its nib.
      // text123.text=(self.txtviewarray)[0];
   // lbl.text=(self.itemshowdetailsAr)[0][@"district_name"];;
    UIColor *barColour =  [UIColor colorWithRed:(130/255.0) green:(201/255.0) blue:(79/255.0) alpha:1];
   // cell.backgroundColor=barColour;

    lbl.textColor=barColour;
    
    
   // [self getcontactdetails];
    dispatch_async(dispatch_get_main_queue(), ^{
        [indicator startAnimating];
    });
    

    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/property_showcase4.php"]] ];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (con) {
        NSLog(@"data sent ");
    } else
    {
        NSLog(@"Not sent");
    }
    [con start];
    

    
    
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
    self.itemshowdetailsAr=[[NSMutableArray alloc]init];

    if (jsonArray1) {
        
        NSArray *jsonArray =jsonArray1[@"district"];
        
        
        for (NSDictionary *tmp in jsonArray)
        {
            NSMutableDictionary   *itemshowdetails=[[NSMutableDictionary alloc]init];
            
            [itemshowdetails setValue:tmp[@"district_name"] forKey:@"district_name"];
            [itemshowdetails setValue:tmp[@"district_description"] forKey:@"district_description"];
           // [itemshowdetails setValue:tmp[@"url_path"] forKey:@"url_path"];
            //[itemshowdetails setValue:tmp[@"title"] forKey:@"title"];
            [self.itemshowdetailsAr addObject:itemshowdetails];
            
        }
        
        NSLog(@"llllll.......%@",self.itemshowdetailsAr);
        text123.text=(self.itemshowdetailsAr)[0][@"district_description"];
         lbl.text=(self.itemshowdetailsAr)[0][@"district_name"];
        [self.collectionView reloadData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [indicator stopAnimating];
        });
        
    }    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        dispatch_async(dispatch_get_main_queue(), ^{
            [indicator stopAnimating];
        });
    }
   
  
    
    
}





-(IBAction)sales:(id)sender
{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        salesfeedback *vdo = [[salesfeedback alloc] initWithNibName:@"salesfeedback_iphone" bundle:nil];
        [self.navigationController pushViewController:vdo animated:NO];
    }
    else
    {
        salesfeedback *vdo = [[salesfeedback alloc] initWithNibName:@"salesfeedback_ipad" bundle:nil];
        [self.navigationController pushViewController:vdo animated:NO];
    }

}
-(IBAction)contact:(id)sender
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        contactus *et = [[contactus alloc]initWithNibName:@"contact_iphone" bundle:nil];
        [self.navigationController pushViewController:et animated:NO];
    }
    else
    {
        contactus *et = [[contactus alloc]init];
        [self.navigationController pushViewController:et animated:NO];       }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FGalleryViewControllerDelegate Methods


- (int)numberOfPhotosForPhotoGallery:(FGalleryViewController *)gallery
{
    NSUInteger num1;
    if( gallery == flamegallery ) {
        num1 = [flameimages count];
    }
    else if( gallery == networkGallery ) {
        num1 = [networkImages count];
    }
    else if( gallery == wishperinggallery ) {
        num1 = [wispering count];
    }
    int num=(int)num1;
    
	return num;
}


- (FGalleryPhotoSourceType)photoGallery:(FGalleryViewController *)gallery sourceTypeForPhotoAtIndex:(NSUInteger)index
{
	return FGalleryPhotoSourceTypeNetwork;
}



- (NSString*)photoGallery:(FGalleryViewController*)gallery filePathForPhotoSize:(FGalleryPhotoSize)size atIndex:(NSUInteger)index {
    return localImages[index];
}

- (NSString*)photoGallery:(FGalleryViewController *)gallery urlForPhotoSize:(FGalleryPhotoSize)size atIndex:(NSUInteger)index {
    //  NSString *caption;
    NSString *counting;
    if( gallery == flamegallery ) {
        counting = flameimages[index];
    }
    else if( gallery == networkGallery ) {
        counting = networkImages[index];
    }
    else if( gallery == wishperinggallery ) {
        counting = wispering[index];
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



-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return 4;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
   
    // self.selectedIndexPath=0;
           UICollectionViewCell *cell1 = [collectionView cellForItemAtIndexPath:0];
        cell1.contentView.backgroundColor=[UIColor clearColor];
   
    if (self.selectedIndexPath != nil) {
        // deselect previously selected cell
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:self.selectedIndexPath];
         cell.backgroundColor=[UIColor clearColor];
        cell.backgroundColor=[UIColor clearColor];
        if (cell != nil) {
            cell.backgroundColor=[UIColor clearColor];
            
            // set default color for cell
        }
    }
    // Select newly selected cell:
  UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor=[UIColor clearColor];
    
    if (cell != nil) {
        if (indexPath.row==0) {
            self.selectedIndexPath=0;
             UIColor *colorOne = [UIColor colorWithRed:(130/255.0) green:(201/255.0) blue:(79/255.0) alpha:1];
            cell.backgroundColor=colorOne;
        }
        else if (indexPath.row==1) {
          
            UICollectionViewCell *datasetCell =[collectionView cellForItemAtIndexPath:0];
            datasetCell.backgroundColor = [UIColor blackColor];
             //[collectionView deselectItemAtIndexPath:0 animated:NO];
            color.hidden=YES;
            UIColor *barColour = [UIColor colorWithRed:(255/255.0) green:(167/255.0) blue:(18/255.0) alpha:1];

            cell.backgroundColor=barColour;
        }
        else if (indexPath.row==2)
        
        {
             color.hidden=YES;
          
            [collectionView deselectItemAtIndexPath:0 animated:NO];
            cell.backgroundColor=[UIColor colorWithRed:(198/255.0) green:(32/255.0) blue:(26/255.0) alpha:1];
        }
        else if (indexPath.row==3)
        {
         [collectionView deselectItemAtIndexPath:0 animated:NO];
            UIColor *barColour = [UIColor colorWithRed:(50/255.0) green:(167/255.0) blue:(214/255.0) alpha:1];
             cell.backgroundColor=barColour;
 
        }
     }
     self.selectedIndexPath = indexPath;
    
    if(indexPath.row==0)
    {
        // self.title = @"Earth";
         text123.hidden=NO;
        
        [text123 scrollRectToVisible:CGRectMake(0,0,1,1) animated:NO];
        text123.text=(self.itemshowdetailsAr)[0][@"district_description"];
        text2.hidden=YES;
         text3.hidden=YES;
         text4.hidden=YES;
        NSLog(@"aaaa....%@",text123.text);
        lbl.text=(self.itemshowdetailsAr)[0][@"district_name"];;
        UIColor *colorOne = [UIColor colorWithRed:(130/255.0) green:(201/255.0) blue:(79/255.0) alpha:1];

        lbl.textColor=colorOne;
        btn2.hidden=YES;
        btn3.hidden=YES;
        btn1.hidden=NO;
        b4.hidden=YES;
        
    }
    
   if(indexPath.row==1)
    {
        [text2 scrollRectToVisible:CGRectMake(0,0,1,1) animated:NO];

        text2.hidden=NO;
        text2.text=(self.itemshowdetailsAr)[2][@"district_description"];
        text123.hidden=YES;
        text3.hidden=YES;
        text4.hidden=YES;
        UIColor *barColour = [UIColor colorWithRed:(255/255.0) green:(167/255.0) blue:(18/255.0) alpha:1];
        //[[UINavigationBar appearance] setBarTintColor: barColour];

        lbl.textColor=barColour;
        lbl.text=(self.itemshowdetailsAr)[2][@"district_name"];;
        // [[collectionView cellForItemAtIndexPath:indexPath] setBackgroundColor:[UIColor blueColor]];
        btn2.hidden=NO;
        btn3.hidden=YES;
        btn1.hidden=YES;
        b4.hidden=YES;
        
        
    }
    if(indexPath.row==2)
    {
         [text3 scrollRectToVisible:CGRectMake(0,0,1,1) animated:NO];
        color.hidden=YES;
         text3.hidden=NO;
        text3.text=(self.itemshowdetailsAr)[1][@"district_description"];
        text123.hidden=YES;
        text2.hidden=YES;
        text4.hidden=YES;
        lbl.textColor=[UIColor colorWithRed:(198/255.0) green:(32/255.0) blue:(26/255.0) alpha:1];
        lbl.text=(self.itemshowdetailsAr)[1][@"district_name"];;
        btn2.hidden=YES;
        btn3.hidden=NO;
        btn1.hidden=YES;
        b4.hidden=YES;
        
        
        
    }
    if(indexPath.row==3)
    {
         color.hidden=YES;
         text4.hidden=NO;
        [text4 scrollRectToVisible:CGRectMake(0,0,1,1) animated:NO];

        text4.text=(self.itemshowdetailsAr)[indexPath.row][@"district_description"];
        text123.hidden=YES;
        text3.hidden=YES;
        text2.hidden=YES;
       UIColor *barColour = [UIColor colorWithRed:(50/255.0) green:(167/255.0) blue:(214/255.0) alpha:1];
        
        
        //[[UINavigationBar appearance] setBarTintColor: barColour];

        lbl.textColor=barColour;
        
         cell.backgroundColor=barColour;
        
        lbl.text=(self.itemshowdetailsAr)[indexPath.row][@"district_name"];;
         b4.hidden=NO;
        btn2.hidden=YES;
        btn3.hidden=YES;
       
        
        btn1.hidden=YES;
        
  
    }
    
}
-(IBAction)btn1action:(id)sender
{
    
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    spinner.color=[UIColor blackColor];
    [self.view addSubview:spinner];
    self.view.center=spinner.center;
    dispatch_async(dispatch_get_main_queue(), ^{
        [spinner startAnimating];
    });
 
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {        mainWP *aboutus = [[mainWP alloc] initWithNibName:@"mainWP" bundle:nil];
        mainWP *leftMenuViewController = [[mainWP alloc] initWithNibName:@"mainWP" bundle:nil];
        RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:aboutus leftMenuViewController:leftMenuViewController rightMenuViewController:nil];
        sideMenuViewController.delegate = self;
        sideMenuViewController.contentViewShadowColor = [UIColor grayColor];
        sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
        sideMenuViewController.contentViewShadowOpacity = 0.6;
        sideMenuViewController.contentViewShadowRadius = 12;
        sideMenuViewController.contentViewShadowEnabled = YES;
        
        
        [self.navigationController pushViewController:sideMenuViewController animated:YES];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner stopAnimating];
        });

        
    }
    else
    {
       
        mainWP *aboutus = [[mainWP alloc] initWithNibName:@"mainWP_ipad" bundle:nil];
        mainWP *leftMenuViewController = [[mainWP alloc] initWithNibName:@"mainWP_ipad" bundle:nil];
        RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:aboutus leftMenuViewController:leftMenuViewController rightMenuViewController:nil];
        sideMenuViewController.delegate = self;
        sideMenuViewController.contentViewShadowColor = [UIColor grayColor];
        sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
        sideMenuViewController.contentViewShadowOpacity = 0.6;
        sideMenuViewController.contentViewShadowRadius = 12;
        sideMenuViewController.contentViewShadowEnabled = YES;
        
        
        [self.navigationController pushViewController:sideMenuViewController animated:YES];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner stopAnimating];
        });
        

    }
}
-(IBAction)btn3action:(id)sender

{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    spinner.color=[UIColor whiteColor];
    [self.view addSubview:spinner];
    self.view.center=spinner.center;
    dispatch_async(dispatch_get_main_queue(), ^{
        [spinner startAnimating];
    });
if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
{
    DEMOLeftMenuViewController *aboutus = [[DEMOLeftMenuViewController alloc] initWithNibName:@"DEMOLeftMenuViewController_iphone" bundle:nil];
    DEMOLeftMenuViewController *leftMenuViewController = [[DEMOLeftMenuViewController alloc] initWithNibName:@"DEMOLeftMenuViewController_iphone" bundle:nil];
    
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:aboutus leftMenuViewController:leftMenuViewController rightMenuViewController:nil];
    //sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    sideMenuViewController.delegate = self;
    sideMenuViewController.contentViewShadowColor = [UIColor grayColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    
    
    [self.navigationController pushViewController:sideMenuViewController animated:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [spinner stopAnimating];
    });
    
}
else
{
    
    DEMOLeftMenuViewController *aboutus = [[DEMOLeftMenuViewController alloc] initWithNibName:@"DEMOLeftMenuViewController" bundle:nil];
    DEMOLeftMenuViewController *leftMenuViewController = [[DEMOLeftMenuViewController alloc] initWithNibName:@"DEMOLeftMenuViewController" bundle:nil];
    
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:aboutus leftMenuViewController:leftMenuViewController rightMenuViewController:nil];
    //sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    sideMenuViewController.delegate = self;
    sideMenuViewController.contentViewShadowColor = [UIColor grayColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    
    
    [self.navigationController pushViewController:sideMenuViewController animated:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [spinner stopAnimating];
    });
    
}
    
    
    
    
    
    
    
}
-(IBAction)btn2action:(id)sender{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    spinner.color=[UIColor blackColor];
    [self.view addSubview:spinner];
    self.view.center=spinner.center;
    dispatch_async(dispatch_get_main_queue(), ^{
        [spinner startAnimating];
    });

    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
 
    FTmain *aboutus = [[FTmain alloc] initWithNibName:@"FTmain_iphone" bundle:nil];
    FTmain *leftMenuViewController = [[FTmain alloc] initWithNibName:@"FTmain_iphone" bundle:nil];
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:aboutus leftMenuViewController:leftMenuViewController rightMenuViewController:nil];
    // sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    sideMenuViewController.delegate = self;
    sideMenuViewController.contentViewShadowColor = [UIColor grayColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    
    
    [self.navigationController pushViewController:sideMenuViewController animated:YES];
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner stopAnimating];
        });

    }
    else
    {
        FTmain *aboutus = [[FTmain alloc] initWithNibName:@"FTmain" bundle:nil];
        FTmain *leftMenuViewController = [[FTmain alloc] initWithNibName:@"FTmain" bundle:nil];
        RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:aboutus leftMenuViewController:leftMenuViewController rightMenuViewController:nil];
        // sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
        sideMenuViewController.delegate = self;
        sideMenuViewController.contentViewShadowColor = [UIColor grayColor];
        sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
        sideMenuViewController.contentViewShadowOpacity = 0.6;
        sideMenuViewController.contentViewShadowRadius = 12;
        sideMenuViewController.contentViewShadowEnabled = YES;
        
        
        [self.navigationController pushViewController:sideMenuViewController animated:YES];
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner stopAnimating];
        });


    }
}
-(IBAction)btn4action:(id)sender{
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    spinner.color=[UIColor blackColor];
    [self.view addSubview:spinner];
    self.view.center=spinner.center;
    dispatch_async(dispatch_get_main_queue(), ^{
        [spinner startAnimating];
    });

    NSLog(@"hiiiii");
    MainWT *aboutus = [[MainWT alloc] init];
    MainWT *leftMenuViewController = [[MainWT alloc] init];
    
    
    RESideMenu *sideMenuViewController = [[RESideMenu alloc] initWithContentViewController:aboutus leftMenuViewController:leftMenuViewController rightMenuViewController:nil];
    // sideMenuViewController.menuPreferredStatusBarStyle = 1; // UIStatusBarStyleLightContent
    sideMenuViewController.delegate = self;
    sideMenuViewController.contentViewShadowColor = [UIColor grayColor];
    sideMenuViewController.contentViewShadowOffset = CGSizeMake(0, 0);
    sideMenuViewController.contentViewShadowOpacity = 0.6;
    sideMenuViewController.contentViewShadowRadius = 12;
    sideMenuViewController.contentViewShadowEnabled = YES;
    
    
    [self.navigationController pushViewController:sideMenuViewController animated:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        [spinner stopAnimating];
    });

    
}
-(golfnewcell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell";
    
    
    golfnewcell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    
    cell.txt.text=(self.itemshowdetailsAr)[indexPath.row][@"district_description"];//district_name  description
    
    
    cell.myImageView.image=[UIImage imageNamed:[dataArray objectAtIndex:indexPath.row]];
    
    
    NSLog(@"lan....%@",cell.title.text);
    
    
    cell.title1.text=(self.labelarray)[indexPath.row];
    
    cell.title1.textColor=[UIColor whiteColor];
    if (indexPath.row==0) {
        //cell.title.textColor=[UIColor greenColor];
        UIColor *colorOne = [UIColor colorWithRed:(130/255.0) green:(201/255.0) blue:(79/255.0) alpha:1];
        cell.backgroundColor=colorOne;
        cell.title.text=(self.itemshowdetailsAr)[0][@"district_name"];
        
    }
    if (indexPath.row==1) {
        // cell.title.textColor=[UIColor blueColor];
        cell.title1.layer.borderColor = [UIColor blueColor].CGColor;
        cell.title1.layer.borderWidth = 4.0;
        cell.title1.layer.cornerRadius=10;
        // lbl.text=(self.txtviewarray)[1];
        cell.title.text=(self.itemshowdetailsAr)[2][@"district_name"];
        
        
    }
    if (indexPath.row==2) {
        // cell.title.textColor=[UIColor orangeColor];
        cell.title1.layer.borderColor = [UIColor orangeColor].CGColor;
        cell.title1.layer.borderWidth = 4.0;
        cell.title1.layer.cornerRadius=10;
        cell.title.text=(self.itemshowdetailsAr)[1][@"district_name"];
        // lbl.text=(self.txtviewarray)[2];
        
        
    }
    
    if (indexPath.row==3) {
        // cell.title.textColor=[UIColor orangeColor];
        cell.title1.layer.borderColor = [UIColor orangeColor].CGColor;
        cell.title1.layer.borderWidth = 4.0;
        cell.title1.layer.cornerRadius=10;
        cell.title.text=(self.itemshowdetailsAr)[3][@"district_name"];
        // lbl.text=(self.txtviewarray)[2];
        
        
    }
    
    
    if ([self.selectedIndexPath isEqual:indexPath]) {
        if (indexPath.row==0) {
            UIColor *barColour =  [UIColor colorWithRed:(130/255.0) green:(201/255.0) blue:(79/255.0) alpha:1];
            cell.backgroundColor=barColour;
        }
        if (indexPath.row==1) {
            UIColor *barColour = [UIColor colorWithRed:(90/255.0) green:(233/255.0) blue:(255/255.0) alpha:1];
            cell.backgroundColor=barColour;
        }
        if (indexPath.row==2) {
            cell.backgroundColor=[UIColor orangeColor];
        }
        
        
        // set highlight color
    } else {
        if (indexPath.row==0) {
            
            
            //            UIColor *barColour =  [UIColor colorWithRed:(60/255.0) green:(169/255.0) blue:(219/255.0) alpha:1];
            //            cell.backgroundColor=barColour;
            cell.backgroundColor=[UIColor clearColor];
            
        }
        if (indexPath.row==1) {
            cell.backgroundColor=[UIColor clearColor];
        }
        if (indexPath.row==2) {
            cell.backgroundColor=[UIColor clearColor];
        }
        
        if(indexPath.row==3)
        {
            cell.backgroundColor=[UIColor clearColor];
        }
        
        
        
        
        // set default color
    }
    
    return cell;
    
    
}
/*-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:
(NSTimeInterval)duration {
    _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
  //  [self.collectionView.collectionViewLayout invalidateLayout];
    // Fade the collectionView out
    [self.collectionView setAlpha:0.0f];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_iphone" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    else
    {
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        if(orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown){
            // self.view = self.potraitView;
            if(orientation ==UIInterfaceOrientationPortraitUpsideDown){
                NSLog(@"Changed Orientation To PortraitUpsideDown");
                //  [self portraitUpsideDownOrientation];
            }else{
                NSLog(@"Changed Orientation To Portrait");
                [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
            }
        }else{
            // self.view = self.landscapeView;
            if(orientation ==UIInterfaceOrientationLandscapeLeft){
                NSLog(@"Changed Orientation To Landscape left");
                [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_land" bundle:nil] forCellWithReuseIdentifier:@"cell"];
                
                
            }else{
                NSLog(@"Changed Orientation To Landscape right");
                [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_land" bundle:nil] forCellWithReuseIdentifier:@"cell"];
                
                
                
            }
            
        }
        
    }
    CGSize sizes;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
      sizes=  CGSizeMake(140, 98);
        
    }
    else
    {
        if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
           sizes=CGSizeMake(231, 178);
        }
        else
        {
            sizes= CGSizeMake(302, 182);
        }
    }
}*/
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Adjust cell size for orientation
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        return CGSizeMake(140, 98);
        
    }
    else
    {
    if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        return CGSizeMake(231, 178);
        UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
        collectionViewLayout.sectionInset = UIEdgeInsetsMake(50, 30, 50,50);
        color.frame = CGRectMake(30, 500, 231, 178);
        

    }
        else
        {
             return CGSizeMake(302, 182);
            UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
            collectionViewLayout.sectionInset = UIEdgeInsetsMake(50, 65, 50,50);
           color.frame = CGRectMake(68, 529, 298, 179);
            

        }
    }
    return CGSizeMake(302, 182);
}
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
   // CGSize sizes;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
      // [self.collectionView.collectionViewLayout invalidateLayout];
        
    }else
    {
       [self.collectionView.collectionViewLayout invalidateLayout];
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        if(orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown){
            // self.view = self.potraitView;
            if(orientation ==UIInterfaceOrientationPortraitUpsideDown){
                NSLog(@"Changed Orientation To PortraitUpsideDown");
                //  [self portraitUpsideDownOrientation];
            }else{
                NSLog(@"Changed Orientation To Portrait");
                UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
                collectionViewLayout.sectionInset = UIEdgeInsetsMake(50, 65, 50,50);
                color.frame = CGRectMake(68, 529, 298, 179);
                
                
                [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
            }
        }else{
            // self.view = self.landscapeView;
            if(orientation ==UIInterfaceOrientationLandscapeLeft){
                NSLog(@"Changed Orientation To Landscape left");
                [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_land" bundle:nil] forCellWithReuseIdentifier:@"cell"];
                UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
                collectionViewLayout.sectionInset = UIEdgeInsetsMake(50, 30, 50,50);
                color.frame = CGRectMake(30, 500, 231, 178);
                
                
                
                
                
            }else{
                NSLog(@"Changed Orientation To Landscape right");
                [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_land" bundle:nil] forCellWithReuseIdentifier:@"cell"];
                UICollectionViewFlowLayout *collectionViewLayout = (UICollectionViewFlowLayout*)self.collectionView.collectionViewLayout;
                collectionViewLayout.sectionInset = UIEdgeInsetsMake(50, 30, 50,50);
                color.frame = CGRectMake(30, 500, 231, 178);
                
                
                
                
            }
            
        }
    }


}
/*-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize sizes;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
          sizes= CGSizeMake(140, 100);
        
    }else
    {
    if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        sizes= CGSizeMake(224.f, 188.f);
        
    }
        else
        {
             sizes= CGSizeMake(302.f, 188.f);
            
        }
    }
   return sizes;
}
*/
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  /*  CGSize sizes;

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        sizes= CGSizeMake(140, 100);
        
    }else
    {
        if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
            sizes= CGSizeMake(224.f, 188.f);
            
            
        }
        else
        {
            sizes= CGSizeMake(302.f, 188.f);
        }
    }
*/
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
    [self.collectionView reloadData];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
  /*  CGSize sizes;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell_iphone" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    else
    {
        [self.collectionView registerNib:[UINib nibWithNibName:@"golfnewcell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
          sizes= CGSizeMake(140, 100);
        
    }else
    {
        if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
            sizes= CGSizeMake(224.f, 188.f);
        
            
        }
        else
        {
            sizes= CGSizeMake(302.f, 188.f);
        }
    }
    //return sizes;
    [self.collectionView.collectionViewLayout invalidateLayout];*/
}




@end
