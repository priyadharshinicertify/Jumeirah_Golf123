//
//  fav.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 27/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "fav.h"
#import "tblcell.h"
#import "YFJLeftSwipeDeleteTableView.h"
#import "newsletter.h"
#import "teebooking.h"

#import "latestnews.h"
#import "events.h"
#import "Eservices.h"
#import "abt_JGE.h"

#import "BackgroundLayer.h"
#import "imagecell.h"
#import "LoginViewController.h"
#import "vacancy.h"
#import "JGEWebsite.h"
#import "facebook.h"
#import "twitter.h"
#import "Abtus.h"
#import "applicationfeedback.h"
#import "expo2020.h"
#import "singleton.h"
#import "customerfeedback.h"
#import "settings.h"
#import "AppDelegate.h"
#import "fav.h"
#import "videogallery.h"
#import "salesfeedback.h"

#import <QuartzCore/QuartzCore.h>
#import "CollectionViewItem.h"
//#import "SKSTableView.h"
//#import "SKSTableViewCell.h"
#import "Notifications.h"
#import "car_register.h"
@interface fav ()

{
    NSArray *arr1;
    id object;
    NSString *uservalue;
    NSMutableArray      *sectionTitleArray;
    NSMutableDictionary *sectionContentDict;
    NSMutableArray      *u_sectionTitleArray;
    NSMutableDictionary *u_sectionContentDict;
    NSMutableArray      *arrayForBool,*temparray, *notifycount;;
    NSArray *mutableRetrievedDictionary ;
     NSArray *u_mutableRetrievedDictionary ;
    Boolean *mybooleans;
 
}
@property (nonatomic, strong) NSArray *contents;
@property (strong, nonatomic) UIWindow *window;
-(void)showMenu;
-(void)hideMenu;
@end

@implementation fav

@synthesize itemshowdetailsAr,collectionViewPack,itemshowdetailsAr1,tbl,show,insertionarray,deletearray,menuTable,content,tableView1,tbl1,nav1,show1,user,login,logout,u_itemshowdetailsAr,u_itemshowdetailsAr1;
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
    CAGradientLayer *btnGradient7 = [BackgroundLayer blackWhiteGradient];
    btnGradient7.frame = self.sample.bounds;
   
    [self.sample.layer insertSublayer:btnGradient7 atIndex:0];
    
    //logoutboolean=FALSE;
    CAGradientLayer *btnGradient8 = [BackgroundLayer blackWhiteGradient];
    btnGradient8.frame = self.show1.bounds;
   
    [self.show1.layer insertSublayer:btnGradient8 atIndex:0];
    
    
    [super viewDidLoad];
    
    
    

    self.collectionViewPack.dataSource = self;
    self.collectionViewPack.delegate = self;
    manage=[singleton share];
    NSString *sss=manage.user;
    NSLog(@"sss...%@",sss);
    
    if ([sss length]==0) {
        logout.hidden=YES;
        login.hidden=NO;
         user.text=@"Guest";
        
    }
    else
    {
        login.hidden=YES;
        logout.hidden=NO;
        user.text=manage.userlogin;

    }

    
    if (manage.logoutboolean==YES) {
         [self showMenu];
    }
    
    
    
    collectionViewPack.dataSource=self;
    [self.navigationItem setHidesBackButton:YES animated:YES];
    [self.navigationController setNavigationBarHidden:YES];
   // [UINavigationController setNavigationBarHidden:YES];
    
    
    self.tableView1.contentInset=UIEdgeInsetsMake(0, 0, 120, 0);
    
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.nav1.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.nav1.layer insertSublayer:btnGradient1 atIndex:0];
    
 
    
           uservalue=manage.userlogin;
        NSLog(@"uservalue==%@",uservalue);
        
        if (uservalue.length == 0) {
              sectionTitleArray = [NSMutableArray arrayWithObjects:@"JGE", @"Service", @"Favorites", @"JGE Account", @"Careers",@"Inbox",@"Settings",@"Contact Us", nil];
            mutableRetrievedDictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"item1"] ;
            
            if ([mutableRetrievedDictionary count]>0) {
                [itemshowdetailsAr removeAllObjects];
                [itemshowdetailsAr1 removeAllObjects];
                
                
                itemshowdetailsAr  = [[NSMutableArray alloc] init];
                itemshowdetailsAr1 = [[NSMutableArray alloc] init];
                
                NSArray *mutable = [[NSUserDefaults standardUserDefaults] objectForKey:@"item2"] ;
                
                NSArray *arrr1=[[NSUserDefaults standardUserDefaults] objectForKey:@"arraya"] ;
                 NSArray *arr2=[[NSUserDefaults standardUserDefaults] objectForKey:@"arrayb"] ;
                 NSArray *arr3=[[NSUserDefaults standardUserDefaults] objectForKey:@"arrayc"] ;
                 NSArray *arr4=[[NSUserDefaults standardUserDefaults] objectForKey:@"arrayd"] ;
                 NSArray *arr5=[[NSUserDefaults standardUserDefaults] objectForKey:@"arraye"] ;
                 NSArray *arr6=[[NSUserDefaults standardUserDefaults] objectForKey:@"arrayf"] ;
                 NSArray *arr7=[[NSUserDefaults standardUserDefaults] objectForKey:@"arrayg"] ;
                
                
                
                itemshowdetailsAr1=[mutableRetrievedDictionary mutableCopy];
                itemshowdetailsAr=[mutable mutableCopy];
                array1=[arrr1 mutableCopy];
                array2=[arr2 mutableCopy];
                array3=[arr3 mutableCopy];

                array4=[arr4 mutableCopy];

                array5=[arr5 mutableCopy];
                array6=[arr6 mutableCopy];

                array7=[arr7 mutableCopy];
                
                sectionContentDict  = [[NSMutableDictionary alloc] init];
                [sectionContentDict setValue:array1 forKey:sectionTitleArray[0]];
                [sectionContentDict setValue:array2 forKey:sectionTitleArray[1]];
                [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
                 [sectionContentDict setValue:array4 forKey:sectionTitleArray[3]];
                [sectionContentDict setValue:array5 forKey:sectionTitleArray[4]];
                [sectionContentDict setValue:array6 forKey:sectionTitleArray[5]];
                
                [sectionContentDict setValue:array7 forKey:sectionTitleArray[6]];
                 
            }
            else{
            
            temparray=[NSMutableArray new];
            
            sectionContentDict  = [[NSMutableDictionary alloc] init];
            
            sectionTitleArray = [NSMutableArray arrayWithObjects:@"JGE", @"Service", @"Favorites", @"JGE Account", @"Careers",@"Inbox",@"Settings",@"Contact Us", nil];
            
            itemshowdetailsAr=[[NSMutableArray alloc ] initWithObjects: @"bill_enquiry_icon.png",@"maintenance_icon.png",@"about_jme_app.png",@"contactus.png",@"news3.png",@"events.png",@"church2.png",@"property_show_case_icon.png",@"tee_icon.png",@"golf_icon.png",@"sales_enquiry_icon.png",@"settings.png",@"membership.png",@"newsletter1.png",@"photo1.png",@"video_gallery_icon.png",@"facebook_icon.png",@"twitter_icon.png",@"website_icon.png",@"eservices_icon.png",@"show_vacancies_icon.png",@"carrer_register__icon.png",@"review.png",@"about_app_icon - Copy.png" ,nil];
            
            
            itemshowdetailsAr1=[NSMutableArray arrayWithObjects:@"Bill Enquiry",@"Maintenance Request" ,@"About JGE", @"Contact Us", @"Latest News",@"Tournaments & Events",@"Notifications",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Notification Settings",@"Club Membership Registration",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"E-Services",@"Show Vacancies",@"Career Registration",@"Survey",@"About JGE Application", nil];
            
            
            
            array1= [NSMutableArray arrayWithObjects:@"About JGE", @"Latest News", @"Newsletter", @"Tournaments & Events",@"Image Gallery",@"Video Gallery",@"Property Showcase",@"Facebook",@"Twitter",@"Sales Enquiry",@"JGE Website",@"Survey", nil];
            [sectionContentDict setValue:array1 forKey:sectionTitleArray[0]];
            array2= [NSMutableArray arrayWithObjects:@"Book a Teetime", @"E-Services", @"Golf",@"Club Membership Registration",@"Maintenance Request", nil];
            [sectionContentDict setValue:array2 forKey:sectionTitleArray[1]];
            array3     = [NSMutableArray arrayWithObjects:@"Bill Enquiry",@"Maintenance Request" ,@"About JGE", @"Contact Us", @"Latest News",@"Tournaments & Events",@"Notifications",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Notification Settings",@"Club Membership Registration",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"E-Services",@"Show Vacancies",@"Career Registration",@"Survey",@"About JGE Application", nil];
            
            
            [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
            
            array4     = [NSMutableArray arrayWithObjects:@"Bill Enquiry",nil];
            [sectionContentDict setValue:array4 forKey:sectionTitleArray[3]];
            array5     = [NSMutableArray arrayWithObjects:@"Show Vacancies", @"Career Registration", nil];
            [sectionContentDict setValue:array5 forKey:sectionTitleArray[4]];
            array6     = [NSMutableArray arrayWithObjects:@"Notifications", nil];
            [sectionContentDict setValue:array6 forKey:sectionTitleArray[5]];
            array7     = [NSMutableArray arrayWithObjects:@"Notification Settings",@"About JGE Application", nil];
            [sectionContentDict setValue:array7 forKey:sectionTitleArray[6]];
            }
            imgarray=[NSMutableArray arrayWithObjects:@"about_jme_app1.png",@"service_icon.png",@"fav.png",@"jgeaccount.png",@"careers.png",@"bx.png",@"settings1.png",@"contactus1.png", nil];
        }
        else{
            u_mutableRetrievedDictionary = [[NSUserDefaults standardUserDefaults] objectForKey:@"u_item1"] ;
            
            if ([u_mutableRetrievedDictionary count]>0) {
                [u_itemshowdetailsAr removeAllObjects];
                [u_itemshowdetailsAr1 removeAllObjects];
                u_sectionTitleArray = [NSMutableArray arrayWithObjects:@"JGE", @"Service", @"Favorites", @"JGE Account", @"Careers",@"Inbox",@"Settings",@"Contact Us", nil];
                

                
                u_itemshowdetailsAr  = [[NSMutableArray alloc] init];
                u_itemshowdetailsAr1 = [[NSMutableArray alloc] init];
                
                NSArray *mutable = [[NSUserDefaults standardUserDefaults] objectForKey:@"u_item2"] ;
                
                NSArray *arrr1=[[NSUserDefaults standardUserDefaults] objectForKey:@"u_arraya"] ;
                NSArray *arr2=[[NSUserDefaults standardUserDefaults] objectForKey:@"u_arrayb"] ;
                NSArray *arr3=[[NSUserDefaults standardUserDefaults] objectForKey:@"u_arrayc"] ;
                NSArray *arr4=[[NSUserDefaults standardUserDefaults] objectForKey:@"u_arrayd"] ;
                NSArray *arr5=[[NSUserDefaults standardUserDefaults] objectForKey:@"u_arraye"] ;
                NSArray *arr6=[[NSUserDefaults standardUserDefaults] objectForKey:@"u_arrayf"] ;
                NSArray *arr7=[[NSUserDefaults standardUserDefaults] objectForKey:@"u_arrayg"] ;
                
                
                
                u_itemshowdetailsAr1=[u_mutableRetrievedDictionary mutableCopy];
                u_itemshowdetailsAr=[mutable mutableCopy];
                u_array1=[arrr1 mutableCopy];
                u_array2=[arr2 mutableCopy];
                u_array3=[arr3 mutableCopy];
                
                u_array4=[arr4 mutableCopy];
                
                u_array5=[arr5 mutableCopy];
                u_array6=[arr6 mutableCopy];
                
                u_array7=[arr7 mutableCopy];
                
                u_sectionContentDict  = [[NSMutableDictionary alloc] init];
                [u_sectionContentDict setValue:u_array1 forKey:u_sectionTitleArray[0]];
                [u_sectionContentDict setValue:u_array2 forKey:u_sectionTitleArray[1]];
                [u_sectionContentDict setValue:u_array3 forKey:u_sectionTitleArray[2]];
                [u_sectionContentDict setValue:u_array4 forKey:u_sectionTitleArray[3]];
                [u_sectionContentDict setValue:u_array5 forKey:u_sectionTitleArray[4]];
                [u_sectionContentDict setValue:u_array6 forKey:u_sectionTitleArray[5]];
                
                [u_sectionContentDict setValue:u_array7 forKey:u_sectionTitleArray[6]];
                
                
                
                
                
                
            }
            else{

            temparray=[NSMutableArray new];
            
            u_sectionContentDict  = [[NSMutableDictionary alloc] init];
            
            u_sectionTitleArray = [NSMutableArray arrayWithObjects:@"JGE", @"Service", @"Favorites", @"JGE Account", @"Careers",@"Inbox",@"Settings",@"Contact Us", nil];
            
            u_itemshowdetailsAr=[[NSMutableArray alloc ] initWithObjects:@"bill_enquiry_icon.png",@"jge_account_icon.png",@"maintenance_icon.png",@"about_jme_app.png",@"contactus.png",@"news3.png",@"events.png",@"church2.png",@"property_show_case_icon.png",@"tee_icon.png",@"golf_icon.png",@"sales_enquiry_icon.png",@"settings.png",@"membership.png",@"newsletter1.png",@"photo1.png",@"video_gallery_icon.png",@"facebook_icon.png",@"twitter_icon.png",@"website_icon.png",@"eservices_icon.png",@"show_vacancies_icon.png",@"carrer_register__icon.png",@"review.png",@"about_app_icon - Copy.png",@"changepassword.png",nil];
            
            //file:///Users/veeramani/Desktop/28.08.2014/Jumeirah_Golf/Jumeirah_Golf_Estates/about_jme_app.png
            
            u_itemshowdetailsAr1=[NSMutableArray arrayWithObjects:@"View & Pay Bills",@"Transaction History",@"Maintenance Request", @"About JGE", @"Contact Us", @"Latest News",@"Tournaments & Events",@"Notifications",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Notification Settings",@"Club Membership Registration",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"E-Services",@"Show Vacancies",@"Career Registration",@"Survey",@"About JGE Application",@"Change Password", nil];
            
            
            
            u_array1= [NSMutableArray arrayWithObjects:@"About JGE", @"Latest News", @"Newsletter", @"Tournaments & Events",@"Image Gallery",@"Video Gallery",@"Property Showcase",@"Facebook",@"Twitter",@"Sales Enquiry",@"JGE Website",@"Survey", nil];
            [u_sectionContentDict setValue:u_array1 forKey:u_sectionTitleArray[0]];
            u_array2= [NSMutableArray arrayWithObjects:@"Book a Teetime", @"E-Services", @"Golf",@"Club Membership Registration",@"Maintenance Request", nil];
            [u_sectionContentDict setValue:u_array2 forKey:u_sectionTitleArray[1]];
            u_array3     = [NSMutableArray arrayWithObjects:@"View & Pay Bills",@"Transaction History",@"Change password", @"About JGE", @"Contact Us", @"Latest News",@"Tournaments & Events",@"Notifications",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Maintenance Request",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"Survey",@"E-Services",@"Show Vacancies",@"Career Registration",@"Notification Settings",@"Club Membership Registration",@"About JGE Application",@"Change Password", nil];
            
            
            [u_sectionContentDict setValue:u_array3 forKey:u_sectionTitleArray[2]];
            
            u_array4     = [NSMutableArray arrayWithObjects:@"View & Pay Bills",@"Transaction History",nil];
            [u_sectionContentDict setValue:u_array4 forKey:u_sectionTitleArray[3]];
            u_array5     = [NSMutableArray arrayWithObjects:@"Show Vacancies", @"Career Registration", nil];
            [u_sectionContentDict setValue:u_array5 forKey:u_sectionTitleArray[4]];
            u_array6     = [NSMutableArray arrayWithObjects:@"Notifications", nil];
            [u_sectionContentDict setValue:u_array6 forKey:u_sectionTitleArray[5]];
            u_array7     = [NSMutableArray arrayWithObjects:@"Notification Settings",@"About JGE Application",@"Change Password", nil];
            [u_sectionContentDict setValue:u_array7 forKey:u_sectionTitleArray[6]];
            

}
            imgarray=[NSMutableArray arrayWithObjects:@"about_jme_app1.png",@"service_icon.png",@"fav.png",@"jgeaccount.png",@"careers.png",@"bx.png",@"settings1.png",@"contactus1.png", nil];
}

        
   


  //  file:///Users/veeramani/Desktop/28.08.2014/Jumeirah_Golf/Jumeirah_Golf_Estates/about_jme_app%20_icon.png
    

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {

    
    [self.collectionViewPack registerNib:[UINib nibWithNibName:@"CollectionViewItem_iphone" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
    }
    else
    {
        [self.collectionViewPack registerNib:[UINib nibWithNibName:@"CollectionViewItem_ipad" bundle:nil] forCellWithReuseIdentifier:@"CELL"];
 
    }
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight:)];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self.view addGestureRecognizer:swipeRight];
    
    
   tableView1.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    self.show.hidden=YES;
        

  }
- (void)highlightLetter:(UITapGestureRecognizer*)sender {
    if(content.frame.origin.x != 0)
        [self hideMenu];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];
     self.screenName = @"favorite Screen";
    
    
    
   [self.collectionViewPack reloadData];
    [self.tbl reloadData];
    [self.tableView1 reloadData];
    
}
# pragma sliding animations

- (IBAction)showMenuDown:(id)sender {
    
    
    if(content.frame.origin.x == 0) //only show the menu if it is not already shown
        [self showMenu];
    else
        [self hideMenu];
    
    
    
}


#pragma mark - animations -
-(void)showMenu{
    
    //slide the content view to the right to reveal the menu
    [UIView animateWithDuration:.25
                     animations:^{
                         
                         [content setFrame:CGRectMake(menuTable.frame.size.width, content.frame.origin.y, content.frame.size.width, content.frame.size.height)];
                     }
     ];
    
}

-(void)hideMenu{
    
    //slide the content view to the left to hide the menu
    [UIView animateWithDuration:.25
                     animations:^{
                         
                         [content setFrame:CGRectMake(0, content.frame.origin.y, content.frame.size.width, content.frame.size.height)];
                     }
     ];
}

#pragma mark - Gesture handlers -

-(void)handleSwipeLeft:(UISwipeGestureRecognizer*)recognizer{
    
    if(content.frame.origin.x != 0)
        [self hideMenu];
}

-(void)handleSwipeRight:(UISwipeGestureRecognizer*)recognizer{
    if(content.frame.origin.x == 0)
        [self showMenu];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (uservalue.length==0) {
        return [self.itemshowdetailsAr count] ;
    }
    else
       return [self.u_itemshowdetailsAr1 count] ;
	
}

-(CollectionViewItem*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
   
    static NSString *cellIdentifier = @"CELL";

    
    CollectionViewItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
     cell.textlabel.hidden=YES;
    
   // UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //flowLayout.scrollDirection =  UICollectionViewScrollDirectionHorizontal;
    
   
  /*  if (indexPath.row==5)
    
    {
         cell.textlabel.hidden=NO;
        NSLog(@"wel.............come%@",manage.welcome);
        if (![manage.welcome isEqualToString:@""]) {
            cell.textlabel.text=@"1";
        }
        else
        {
            cell.textlabel.hidden=YES;
        }
        if([manage.str1 isEqualToString:@"failure"])
        {
            cell.textlabel.hidden=YES;
        }
        else
        {
            
            if  ([notifycount count]>0)
            {
                
                cell.textlabel.hidden=NO;
            
            cell.textlabel.text=[NSString stringWithFormat:@"%lu",(unsigned long)[notifycount count]];
            }
            else
            {
                 cell.textlabel.hidden=YES;
            }
            
        }
        
    }*/
    
    if (uservalue.length==0) {
        if (indexPath.row==6)
            
        {
            cell.textlabel.hidden=NO;
            NSLog(@"wel.............come%@",manage.welcome);
           
            if (![manage.welcome isEqualToString:@""]) {
                //cell.textlabel.text=@"1";
              //  cell.textlabel.text=[NSString stringWithFormat@"%d", myInt];
                [ cell.textlabel setText:[NSString stringWithFormat:@"%u", [manage.deviealert count]+1]];
                
            }
            else if(![manage.deviealert count]==0)
            {
              [ cell.textlabel setText:[NSString stringWithFormat:@"%lu", (unsigned long)[manage.deviealert count]]];
            }
            else
            {
                cell.textlabel.hidden=YES;
            }
            
        }
        

        cell.label.text=(itemshowdetailsAr1)[indexPath.row];
        cell.myImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",(self.itemshowdetailsAr)[indexPath.row]]];
    }
    else
    {
        if (indexPath.row==7)
            
        {
            cell.textlabel.hidden=NO;
            NSLog(@"wel.............come%@",manage.welcome);
            if (![manage.welcome isEqualToString:@""]) {
                [ cell.textlabel setText:[NSString stringWithFormat:@"%u", [manage.deviealert count]+1]];
                
            }
            else if(![manage.deviealert count]==0)
            {
                [ cell.textlabel setText:[NSString stringWithFormat:@"%lu", (unsigned long)[manage.deviealert count]]];
            }

            else
            {
                cell.textlabel.hidden=YES;
            }
            
        }
        
        

        cell.label.text=(u_itemshowdetailsAr1)[indexPath.row];
        cell.myImageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",(self.u_itemshowdetailsAr)[indexPath.row]]];
        
    }
   
    
    
    
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    if(content.frame.origin.x != 0)
    {
    [self hideMenu];
    }
    else
    {
        
        if (uservalue.length==0)
        {
        
        if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Bill Enquiry"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }

       // UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"" message:@"Coming Soon!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //[alrt show];
        

             if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Notifications"]) {
                
                
                if([manage.str1 isEqualToString:@"failure"])
                {
                    
                    
                    
                    
                   [[[UIAlertView alloc]initWithTitle:@"message !!!" message:@"please enable your settings in notification center" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
                    
                }
                
                else
                {
                    [notifycount removeAllObjects];
                    
                    
                    
                    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    {
                        Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_iphone" bundle:nil];
                        [self.navigationController pushViewController:vdo animated:NO];
                    }
                    else
                    {
                        Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_ipad" bundle:nil];
                        [self.navigationController pushViewController:vdo animated:NO];
                    }
                    
                }
                
        }
        
                
                
                

    
    /*
     
     
     itemshowdetailsAr1=[NSMutableArray arrayWithObjects:@"Bill Enquiry", @"About JGE", @"Contact Us", @"Latest News",@"Events",@"Notification",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Settings",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"E-Services",@"Show vacancy",@"Career registration",@"
     
     
     
     
     
     Settings",@"About JGE Application", nil];

     
     :@"Bill Enquiry",@"Maintenance Request" ,@"About JGE", @"Contact Us", @"Latest News",@"Tournament & Events",@"Notification",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Notification Settings",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"E-Services",@"Show Vacancies",@"Career Registration",@"Survey",@"About JGE Application", nil];
     
     
     
     
     */
            if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Maintenance Request"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }

    
    
            if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"About JGE"]){
        
      /* if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
       {
         abtjgeus *et = [[abtjgeus alloc]initWithNibName:@"abtjgeus_iphone" bundle:nil];
            [self.navigationController pushViewController:et animated:NO];
        }
        else
       {
       abtjgeus *vdo = [[abtjgeus alloc] initWithNibName:@"abtjgeus" bundle:nil];
        [self.navigationController pushViewController:vdo animated:NO];//        }
       
        
    }*/
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:YES];
                }
                else
                {
                    RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];//        }
                    
                    
                }

    }
     if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Contact Us"]){
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
    

    
            if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Latest News"]){
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            latestnews *vdo = [[latestnews alloc] initWithNibName:@"latestnews_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            latestnews *vdo = [[latestnews alloc] initWithNibName:@"latestnews_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        

    }
            if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Tournaments & Events"]){
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            events *nl = [[events alloc]initWithNibName:@"events_iphone" bundle:nil];
            [self.navigationController pushViewController:nl animated:NO];
        }
        else
        {
            events *nl = [[events alloc]initWithNibName:@"events_ipad" bundle:nil];
            [self.navigationController pushViewController:nl animated:NO];
        }

        
        
    }
            
          /*  if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Survey"]){
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    events *nl = [[events alloc]initWithNibName:@"events_iphone" bundle:nil];
                    [self.navigationController pushViewController:nl animated:NO];
                }
                else
                {
                    events *nl = [[events alloc]initWithNibName:@"events_ipad" bundle:nil];
                    [self.navigationController pushViewController:nl animated:NO];
                }
                
                
                
            }
       */
            
            
            
            
            
  /*if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Notification"]){
       
        
        if([manage.str1 isEqualToString:@"failure"])
        {
            [[[UIAlertView alloc]initWithTitle:@"message !!!" message:@"please enable your settings in notification center" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
            
        }
        
        else
        {
            [notifycount removeAllObjects];
            
                      
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        
        
        
        
        
        
    }*/

     if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Property Showcase"]){
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
       {
           districview1 *vdo = [[districview1 alloc] initWithNibName:@"districview1_iphone" bundle:nil];
           [self.navigationController pushViewController:vdo animated:NO];

      
        
       }
        else
        {  districview1 *dis=[[districview1 alloc]init];
            [self.navigationController pushViewController:dis animated:NO];
                   }
        
    }
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Book a Teetime"]){
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        


        
        
    }
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Golf"]){
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];

        }
        else{
            
            newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
                   }
        
        
    }
   if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Sales Enquiry"]){
        
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
      
  //Bill Enquiry
            
            
            
    
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Newsletter"]) {
        
        //push the
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            newsletter *vdo = [[newsletter alloc] initWithNibName:@"newsletter_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            newsletter *vdo = [[newsletter alloc] initWithNibName:@"newsletter_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Image Gallery"]) {
        
        //push the
       // if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
       // {
           // gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"imagegallery_iphone" bundle:nil];
            //[self.navigationController pushViewController:vdo animated:NO];
//        }
//        else
//        {
            gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"gallery_f" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        //}
        
    }
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Video Gallery"]) {
        
        //push the
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }

       
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Twitter"]) {
        
        //push the
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"JGE Website"]) {
        
        //push the
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
        
    }
   if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"E-Services"]) {
        
        //push the
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            Eservices *jge = [[Eservices alloc] initWithNibName:@"Eservices_iphone" bundle:nil];
            [self.navigationController pushViewController:jge animated:NO];
        }
        else
        {
            Eservices *jge = [[Eservices alloc] initWithNibName:@"Eservices_ipad" bundle:nil];
            [self.navigationController pushViewController:jge animated:NO];
        }
        
        
    }
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Facebook"]) {
        
        //push the
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Show Vacancies"]) {
        
        //push the
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Career Registration"]) {
        
        //push the
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }
    
    if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Notification Settings"]) {
        
        //push the
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            settings *vdo = [[settings alloc] initWithNibName:@"settings_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            settings *vdo = [[settings alloc] initWithNibName:@"settings_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }
            
            
            
            if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"About JGE Application"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Survey"])
            {

            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            

            }
            
            if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Club Membership Registration"])
            {
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
            }
  
            
            
            
            
            
    }
    else
    {
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Notifications"]) {

        if([manage.str1 isEqualToString:@"failure"])
        {
            
            
            
            
            [[[UIAlertView alloc]initWithTitle:@"message !!!" message:@"please enable your settings in notification center" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
            
        }
        
        else
        {
            [notifycount removeAllObjects];
            
            
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            

        }
    }
        
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Survey"]) {
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
        }

        
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"About JGE Application"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }

        
        
        
        
        
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Change Password"]) {
            
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                changepassword *et = [[changepassword alloc]initWithNibName:@"changepassword_iphone" bundle:nil];
                [self.navigationController pushViewController:et animated:NO];
            }
            else
            {
                changepassword *vdo = [[changepassword alloc] initWithNibName:@"changepassword" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];//        }
                
                
            }
        }

        //Payment History
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Transaction History"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                trancation *vdo = [[trancation alloc] initWithNibName:@"trancation_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                trancation *vdo = [[trancation alloc] initWithNibName:@"trancation" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }

        
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Maintenance Request"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }


        
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"About JGE"]) {
            
            
           /* if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                abtjgeus *et = [[abtjgeus alloc]initWithNibName:@"abtjgeus_iphone" bundle:nil];
                [self.navigationController pushViewController:et animated:NO];
            }
            else
            {
                abtjgeus *vdo = [[abtjgeus alloc] initWithNibName:@"abtjgeus" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];//        }
                
                
            }*/
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController" bundle:nil];
                [self.navigationController pushViewController:vdo animated:YES];
            }
            else
            {
                RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];//        }
                
                
            }

        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Contact Us"]) {
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
        
        
        
       if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Latest News"])  {
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                latestnews *vdo = [[latestnews alloc] initWithNibName:@"latestnews_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                latestnews *vdo = [[latestnews alloc] initWithNibName:@"latestnews_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }
         if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Tournaments & Events"])  {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                events *nl = [[events alloc]initWithNibName:@"events_iphone" bundle:nil];
                [self.navigationController pushViewController:nl animated:NO];
            }
            else
            {
                events *nl = [[events alloc]initWithNibName:@"events_ipad" bundle:nil];
                [self.navigationController pushViewController:nl animated:NO];
            }
            
            
            
        }
        
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Property Showcase"]) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                districview1 *vdo = [[districview1 alloc] initWithNibName:@"districview1_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
                
                
                
            }
            else
            {  districview1 *dis=[[districview1 alloc]init];
                [self.navigationController pushViewController:dis animated:NO];
            }
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Book a Teetime"]){
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
            
            
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Golf"]) {
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
                
            }
            else{
                
                newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Sales Enquiry"]) {
            
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
       if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Notification Settings"]){
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                settings *vdo = [[settings alloc] initWithNibName:@"settings_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                settings *vdo = [[settings alloc] initWithNibName:@"settings_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
            
        }
        
        
        
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Newsletter"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                newsletter *vdo = [[newsletter alloc] initWithNibName:@"newsletter_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                newsletter *vdo = [[newsletter alloc] initWithNibName:@"newsletter_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Image Gallery"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
           {
             gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"galleryf_iphone" bundle:nil];
          [self.navigationController pushViewController:vdo animated:NO];
                }
                  else
                  {
            gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"gallery_f" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
           }
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Video Gallery"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        
        
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Twitter"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"JGE Website"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"View & Pay Bills"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }

        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"E-Services"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                Eservices *jge = [[Eservices alloc] initWithNibName:@"Eservices_iphone" bundle:nil];
                [self.navigationController pushViewController:jge animated:NO];
            }
            else
            {
                Eservices *jge = [[Eservices alloc] initWithNibName:@"Eservices_ipad" bundle:nil];
                [self.navigationController pushViewController:jge animated:NO];
            }
            
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Facebook"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Show Vacancies"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Career Registration"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        if ([u_itemshowdetailsAr1[indexPath.row]isEqualToString:@"Club Membership Registration"])
        {
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }

        
      /*  if ([deletearray[indexPath.row]isEqualToString:@"Notification Settings"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                settings *vdo = [[settings alloc] initWithNibName:@"settings_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                settings *vdo = [[settings alloc] initWithNibName:@"settings_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }

        
        
        
        }*/
        
        
        
        
        
        
    }

}
}
# pragma mark=tableview



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSUInteger num1;
    if (tableView==tableView1) {
         if (uservalue.length==0) {
        num1=[sectionTitleArray count];
         }
        else
        {
           num1=[u_sectionTitleArray count];
        }
    }
    else
    {
         if (uservalue.length==0) {
        num1=[sectionTitleArray count];
         }
        else
        {
            num1=[u_sectionTitleArray count];
  
        }
        
    }
    int num=(int)num1;
    return num;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==tableView1) {
        if (uservalue.length==0) {
             return [[sectionContentDict valueForKey:sectionTitleArray[section]] count];
        }else
        {
            return [[u_sectionContentDict valueForKey:u_sectionTitleArray[section]] count];
        }
        


    }
    else
    {
        if (uservalue.length==0) {

        return [[sectionContentDict valueForKey:sectionTitleArray[section]] count];
        }
        else
        {
           return [[u_sectionContentDict valueForKey:u_sectionTitleArray[section]] count];
        }
    }
       return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView              = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    headerView.tag                  = section;
    headerView.backgroundColor      = [UIColor whiteColor];
    UILabel *headerString           = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, self.view.frame.size.width-20-50-20, 50)];
    if (tableView == tableView1) {
        if (uservalue.length==0) {
            UILabel *ll=[[UILabel alloc] initWithFrame:CGRectMake(0, headerView.frame.size.height-1, 300, 1)];
            ll.backgroundColor=[UIColor blackColor];
            [headerView addSubview:ll];
            
            headerString.text=sectionTitleArray[section];
            headerString.textAlignment      = NSTextAlignmentLeft;
            headerString.textColor          = [UIColor blackColor];
            headerView.backgroundColor      = [UIColor whiteColor];
            [headerView addSubview:headerString];
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 40, 40)];
            imgView.contentMode = UIViewContentModeScaleAspectFit;
            imgView.image = [UIImage imageNamed:imgarray[section]];
            
            [headerView addSubview:imgView];
            
            UIImageView *upDownArrow        = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"downArrowBlack"]];
            [headerView addSubview:upDownArrow];
            
            
            
            upDownArrow.autoresizingMask    = UIViewAutoresizingFlexibleLeftMargin;
            upDownArrow.frame               = CGRectMake(self.view.frame.size.width-40, 10, 20, 20);
            [headerView addSubview:upDownArrow];
            if([headerString.text isEqualToString:@"Contact Us"])
            {
                upDownArrow.hidden=YES;
                UITapGestureRecognizer  *headerTapped1   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped1:)];
                [headerView addGestureRecognizer:headerTapped1];
                
                
            }
            

        }
        else
        {
            UILabel *ll=[[UILabel alloc] initWithFrame:CGRectMake(0, headerView.frame.size.height-1, 300, 1)];
            ll.backgroundColor=[UIColor blackColor];
            [headerView addSubview:ll];
            
            headerString.text=u_sectionTitleArray[section];
            headerString.textAlignment      = NSTextAlignmentLeft;
            headerString.textColor          = [UIColor blackColor];
            headerView.backgroundColor      = [UIColor whiteColor];
            [headerView addSubview:headerString];
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 40, 40)];
            imgView.contentMode = UIViewContentModeScaleAspectFit;
            imgView.image = [UIImage imageNamed:imgarray[section]];
            
            [headerView addSubview:imgView];
            
            UIImageView *upDownArrow        = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"downArrowBlack"]];
            [headerView addSubview:upDownArrow];
            
            
            
            upDownArrow.autoresizingMask    = UIViewAutoresizingFlexibleLeftMargin;
            upDownArrow.frame               = CGRectMake(self.view.frame.size.width-40, 10, 20, 20);
            [headerView addSubview:upDownArrow];
            if([headerString.text isEqualToString:@"Contact Us"])
            {
                upDownArrow.hidden=YES;
                UITapGestureRecognizer  *headerTapped1   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped1:)];
                [headerView addGestureRecognizer:headerTapped1];
                
                
            }
            
   
        }
      //  CGRect sepFrame = CGRectMake(0, headerView.frame.size.height-1, 300, 1);
               return headerView;
    }
    else
    {
        if (uservalue.length==0) {
            headerString.text=sectionTitleArray[section];
            headerString.textAlignment      = NSTextAlignmentLeft;
            headerString.textColor          = [UIColor whiteColor];
            headerView.backgroundColor      = [UIColor blackColor                                                                                                                                                                                                                                                                                                                                  ];
            [headerView addSubview:headerString];
        }
        else
        {
            headerString.text=u_sectionTitleArray[section];
            headerString.textAlignment      = NSTextAlignmentLeft;
            headerString.textColor          = [UIColor whiteColor];
            headerView.backgroundColor      = [UIColor blackColor                                                                                                                                                                                                                                                                                                                                  ];
            [headerView addSubview:headerString];
        }
       
         return headerView;
        
    }
        return headerView;
}
- (void)sectionHeaderTapped1:(UITapGestureRecognizer *)gestureRecognizer
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
        
//
//        contactus *et = [[contactus alloc]init];
//        [self.navigationController pushViewController:et animated:NO];
    }
/*- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    // UIView *footer  = [[UIView alloc] initWithFrame:CGRectZero];
       return 0;

}*/
- (void)sectionTapped:(UIButton*)btn {
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        contactus *et = [[contactus alloc]initWithNibName:@"contact_iphone" bundle:nil];
        [self.navigationController pushViewController:et animated:NO];
    }
    else
    {
        contactus *et = [[contactus alloc]init];
        [self.navigationController pushViewController:et animated:NO];
    }

    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    int num;
    if (tableView==tableView1)
    {

   num=50;
    }
    else{
       num=50;
    }
    return num;
}
/*- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0;
}*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==tableView1) {
//        if ([arrayForBool[indexPath.section] boolValue]) {
            return 50;
//        }

    }else
    {
        return 50;
  
    }
        return 1;
}
// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    NSString *str=@"cell";
    UITableViewCell *cell;
    
    if (tableView==tableView1) {
        
   
    
    
      cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (!cell)
        {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
        
        
        
        if (uservalue.length==0) {
            NSArray *content1 = [sectionContentDict valueForKey:sectionTitleArray[indexPath.section]];
            
            cell.textLabel.text = content1[indexPath.row];
            NSLog(@"[sectionContentDict valueForKey:sectionTitleArray[indexPath.section]];==%@",[sectionContentDict valueForKey:sectionTitleArray[indexPath.section]]);
            
            //        }
            
            cell.textLabel.textColor=[UIColor whiteColor];
            cell.backgroundColor=[UIColor blackColor];
            cell.textLabel.font=[UIFont systemFontOfSize:16];
            
            UIImageView *upDownArrow        = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrrght"]];
            
            
            
            //upDownArrow.autoresizingMask    = UIViewAutoresizingFlexibleLeftMargin;
            // upDownArrow.frame               = CGRectMake(self.view.frame.size.width, 10, 20, 20);
            
            //[cell addSubview:upDownArrow];
            // cell.backgroundColor=[UIColor whiteColor];
            UIView *myAccessoryView = [[UIView alloc] initWithFrame:cell.accessoryView.frame];
            [myAccessoryView addSubview:upDownArrow];
            [cell setAccessoryView:myAccessoryView];
            //  cell.myAccessoryView = upDownArrow;

        }
        else
        {
            NSArray *content1 = [u_sectionContentDict valueForKey:u_sectionTitleArray[indexPath.section]];
            
            cell.textLabel.text = content1[indexPath.row];
            NSLog(@"[sectionContentDict valueForKey:sectionTitleArray[indexPath.section]];==%@",[u_sectionContentDict valueForKey:u_sectionTitleArray[indexPath.section]]);
            
            //        }
            
            cell.textLabel.textColor=[UIColor whiteColor];
            cell.backgroundColor=[UIColor blackColor];
            cell.textLabel.font=[UIFont systemFontOfSize:16];
            
            UIImageView *upDownArrow        = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrrght"]];
            
            
            
            //upDownArrow.autoresizingMask    = UIViewAutoresizingFlexibleLeftMargin;
            // upDownArrow.frame               = CGRectMake(self.view.frame.size.width, 10, 20, 20);
            
            //[cell addSubview:upDownArrow];
            // cell.backgroundColor=[UIColor whiteColor];
            UIView *myAccessoryView = [[UIView alloc] initWithFrame:cell.accessoryView.frame];
            [myAccessoryView addSubview:upDownArrow];
            [cell setAccessoryView:myAccessoryView];
 
        }
        
                   return cell;

     }
    else
    {
        //favorities
        
        tblcell  *cell=[self.tbl dequeueReusableCellWithIdentifier:str];
        [cell setBackgroundColor:[UIColor clearColor]];
        
        if (cell==nil)
        {
            NSArray *arr12=[[NSBundle mainBundle]loadNibNamed:@"tblcell" owner:nil options:nil ];
            for(UIView *vie in arr12)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(tblcell*)vie;
                }
            }
        }
 
        
        if (uservalue.length==0) {
            NSArray *content1 = [sectionContentDict valueForKey:sectionTitleArray[indexPath.section]];
            cell.txt.text = content1[indexPath.row];
            
            if (uservalue.length==0) {
                if (indexPath.section==0)
                {
                    
                    
                    
                    if (indexPath.row==2 || indexPath.row==4 || indexPath.row==5 || indexPath.row==7 || indexPath.row==8 || indexPath.row==10 || indexPath.row==11 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        
                        /*
                         
                         */
                        
                        if ( [itemshowdetailsAr1 containsObject:array1[indexPath.row]] )
                            
                            
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                            
                            
                        }
                        
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                
                
                
                if (indexPath.section==1)
                {
                    if (indexPath.row==1)
                    {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        
                        if ([itemshowdetailsAr1 containsObject:array2[indexPath.row]])
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        
                    }
                    
                }
                if (indexPath.section==2)
                {
                    
                    
                    if (indexPath.row>11)
                        
                    {
                        
                        
                        cell.imgbtnminus.hidden=NO;
                        
                        cell.imgbtnminus.tag = indexPath.row;
                        
                        
                        [cell.imgbtnminus addTarget:self action:@selector(imgbtnButtonClicked11:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        
                    }
                    else
                    {
                        cell.imgbtnminus.hidden=YES;
                    }
                    
                    
                    
                }
                
                
                
                
                
                
                if (indexPath.section==4) {
                    
                    
                    if (indexPath.row==0 || indexPath.row==1 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        if ([itemshowdetailsAr1 containsObject:array5[indexPath.row]])
                        {
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        
                        
                        
                        /*
                         if (indexPath.row==0) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         if (indexPath.row==1) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         */
                        
                        
                    }
                }
                if (indexPath.section==6) {
                    
                    if (indexPath.row==0 || indexPath.row==1 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        if ([itemshowdetailsAr1 containsObject:array7[indexPath.row]])
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        /*
                         if (indexPath.row==0) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         if (indexPath.row==1) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         */
                        
                    }
                }
                
                
                return cell;
                
                
            }
            else
            {
                if (indexPath.section==0)
                {
                    
                    
                    
                    if (indexPath.row==2 || indexPath.row==4 || indexPath.row==5 || indexPath.row==7 || indexPath.row==8 || indexPath.row==10 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        
                        /*
                         
                         */
                        
                        if ( [itemshowdetailsAr1 containsObject:array1[indexPath.row]] )
                            
                            
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                            
                            
                        }
                        
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                
                
                
                if (indexPath.section==1)
                {
                    if (indexPath.row==1)
                    {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        
                        if ([itemshowdetailsAr1 containsObject:array2[indexPath.row]])
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        
                    }
                    
                }
                if (indexPath.section==2)
                {
                    
                    
                    if (indexPath.row>10)
                        
                    {
                        
                        
                        cell.imgbtnminus.hidden=NO;
                        
                        cell.imgbtnminus.tag = indexPath.row;
                        
                        
                        [cell.imgbtnminus addTarget:self action:@selector(imgbtnButtonClicked11:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        
                    }
                    else
                    {
                        cell.imgbtnminus.hidden=YES;
                    }
                    
                    
                    
                }
                
                
                
                
                
                
                if (indexPath.section==4) {
                    
                    
                    if (indexPath.row==0 || indexPath.row==1 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        if ([itemshowdetailsAr1 containsObject:array5[indexPath.row]])
                        {
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        
                        
                        
                        /*
                         if (indexPath.row==0) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         if (indexPath.row==1) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         */
                        
                        
                    }
                }
                if (indexPath.section==6) {
                    
                    if (indexPath.row==0 || indexPath.row==1 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        if ([itemshowdetailsAr1 containsObject:array7[indexPath.row]])
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        /*
                         if (indexPath.row==0) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         if (indexPath.row==1) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         */
                        
                    }
                }
                
                
                return cell;
                
                
                
            }
            
            

        }
        else
        {
            NSArray *content1 = [u_sectionContentDict valueForKey:u_sectionTitleArray[indexPath.section]];
            cell.txt.text = content1[indexPath.row];
            
            if (uservalue.length==0) {
                if (indexPath.section==0)
                {
                    
                    
                    
                    if (indexPath.row==2 || indexPath.row==4 || indexPath.row==5 || indexPath.row==7 || indexPath.row==8 || indexPath.row==10 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        
                        /*
                         
                         */
                        
                        if ( [itemshowdetailsAr1 containsObject:array1[indexPath.row]] )
                            
                            
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                            
                            
                        }
                        
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                
                
                
                if (indexPath.section==1)
                {
                    if (indexPath.row==1)
                    {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        
                        if ([itemshowdetailsAr1 containsObject:array2[indexPath.row]])
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        
                    }
                    
                }
                if (indexPath.section==2)
                {
                    
                    
                    if (indexPath.row>10)
                        
                    {
                        
                        
                        cell.imgbtnminus.hidden=NO;
                        
                        cell.imgbtnminus.tag = indexPath.row;
                        
                        
                        [cell.imgbtnminus addTarget:self action:@selector(imgbtnButtonClicked11:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        
                    }
                    else
                    {
                        cell.imgbtnminus.hidden=YES;
                    }
                    
                    
                    
                }
                
                
                
                
                
                
                if (indexPath.section==4) {
                    
                    
                    if (indexPath.row==0 || indexPath.row==1 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        if ([itemshowdetailsAr1 containsObject:array5[indexPath.row]])
                        {
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        
                        
                        
                        /*
                         if (indexPath.row==0) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         if (indexPath.row==1) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         */
                        
                        
                    }
                }
                if (indexPath.section==6) {
                    
                    if (indexPath.row==0 || indexPath.row==1 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        if ([itemshowdetailsAr1 containsObject:array7[indexPath.row]])
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        /*
                         if (indexPath.row==0) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         if (indexPath.row==1) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         */
                        
                    }
                }
                
                
                return cell;
                
                
            }
            else
            {
                if (indexPath.section==0)
                {
                    
                    
                    
                    if (indexPath.row==2 || indexPath.row==4 || indexPath.row==5 || indexPath.row==7 || indexPath.row==8 || indexPath.row==10 || indexPath.row==11  ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        
                        /*
                         
                         */
                        
                        if ( [u_itemshowdetailsAr1 containsObject:u_array1[indexPath.row]] )
                            
                            
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                            
                            
                        }
                        
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                
                
                
                if (indexPath.section==1)
                {
                    if (indexPath.row==1)
                    {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        
                        if ([u_itemshowdetailsAr1 containsObject:u_array2[indexPath.row]])
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        
                    }
                    if (indexPath.row==3)
                    {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        
                        if ([u_itemshowdetailsAr1 containsObject:u_array2[indexPath.row]])
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        
                    }

                    
                    
                    
                }
                if (indexPath.section==2)
                {
                    
                    
                    if (indexPath.row>11)
                        
                    {
                        
                        
                        cell.imgbtnminus.hidden=NO;
                        
                        cell.imgbtnminus.tag = indexPath.row;
                        
                        
                        [cell.imgbtnminus addTarget:self action:@selector(imgbtnButtonClicked11:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                        
                        
                        
                    }
                    else
                    {
                        cell.imgbtnminus.hidden=YES;
                    }
                    
                    
                    
                }
                
                
                
                
                
                
                if (indexPath.section==4) {
                    
                    
                    if (indexPath.row==0 || indexPath.row==1 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        if ([u_itemshowdetailsAr1 containsObject:u_array5[indexPath.row]])
                        {
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        
                        
                        
                        /*
                         if (indexPath.row==0) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         if (indexPath.row==1) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         */
                        
                        
                    }
                }
                if (indexPath.section==6) {
                    
                    if (indexPath.row==1 || indexPath.row==2 ) {
                        
                        cell.imgbtn.tag = indexPath.row;
                        
                        if ([u_itemshowdetailsAr1 containsObject:u_array7[indexPath.row]])
                        {
                            
                            
                            
                            cell.imgbtn.hidden=YES;
                            
                            
                        }
                        else
                        {
                            cell.imgbtn.hidden=NO;
                            [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:withEvent:) forControlEvents:UIControlEventTouchUpInside];
                            
                            
                        }
                        
                        /*
                         if (indexPath.row==0) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         if (indexPath.row==1) {
                         cell.imgbtn.hidden=NO;
                         cell.imgbtnminus.hidden=YES;
                         cell.imgbtn.tag = indexPath.row;
                         [cell.imgbtn addTarget:self action:@selector(imgbtnButtonClicked1:) forControlEvents:UIControlEventTouchUpInside];
                         
                         }
                         */
                        
                    }
                }
                
                
                return cell;
                
                
                
            }
            
            

        }
       
      

    }
    [self.collectionViewPack reloadData];
    
       return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   // [self.tableView1 deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    if (tableView==tableView1) {
        
        
        uservalue=manage.userlogin;
        NSLog(@"uservalue==%@",uservalue);
        
        if (uservalue.length == 0)
        {
        
        /*
        if (indexPath.row == 0) {
            ///it's the first row of any section so it would be your custom section header
            
            ///put in your code to toggle your boolean value here
            mybooleans[indexPath.section] =!mybooleans[indexPath.section];
            
            ///reload this section
            [self.tableView1 reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
        }
         */
        
  
    if (indexPath.section==0) {

    if (indexPath.row==0)
    
    {
        
      /*  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            abtjgeus *et = [[abtjgeus alloc]initWithNibName:@"abtjgeus_iphone" bundle:nil];
            [self.navigationController pushViewController:et animated:NO];
        }
        else
        {
            abtjgeus *vdo = [[abtjgeus alloc] initWithNibName:@"abtjgeus" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];//        }
            
            
        }*/
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController" bundle:nil];
            [self.navigationController pushViewController:vdo animated:YES];
        }
        else
        {
            RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];//        }
            
            
        }
        
        /*
        
//        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//        {
//            Abtus *vdo = [[Abtus alloc] initWithNibName:@"Abtus_iphone" bundle:nil];
//            [self.navigationController pushViewController:vdo animated:NO];
//        }
//        else
//        {
            abtjgeus *vdo = [[abtjgeus alloc] init];
            [self.navigationController pushViewController:vdo animated:NO];
//        }
*/
    }
    
    if (indexPath.row==1) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            latestnews *ln = [[latestnews alloc]initWithNibName:@"latestnews_iphone" bundle:nil];
            [self.navigationController pushViewController:ln animated:NO];
        }
        else
        {
            latestnews *ln = [[latestnews alloc]initWithNibName:@"latestnews_ipad" bundle:nil];
            [self.navigationController pushViewController:ln animated:NO];
        }
        

        
    }

    
    
    if (indexPath.row==2) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            newsletter *nl = [[newsletter alloc]initWithNibName:@"newsletter_iphone" bundle:nil];
            [self.navigationController pushViewController:nl animated:NO];
        }
        else
        {
            newsletter *nl = [[newsletter alloc]initWithNibName:@"newsletter_ipad" bundle:nil];
            [self.navigationController pushViewController:nl animated:NO];
        }
        
    }

    
    
    if (indexPath.row==3) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            events *et = [[events alloc]initWithNibName:@"events_iphone" bundle:nil];
            [self.navigationController pushViewController:et animated:NO];
        }
        else
        {
            events *et = [[events alloc]initWithNibName:@"events_ipad" bundle:nil];
            [self.navigationController pushViewController:et animated:NO];
        }
        
    }

    
    
    if (indexPath.row==4) {
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"galleryf_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"gallery_f" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
       
        
        
    }

    
    
    
    if (indexPath.row==5) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }

        
    }

    
    
    
    
    if (indexPath.row==6) {
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            districview1 *vdo = [[districview1 alloc] initWithNibName:@"districview1_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
            
            
            
        }
        else
        {  districview1 *dis=[[districview1 alloc]init];
            [self.navigationController pushViewController:dis animated:NO];
        }
        
    }

    
    
    
    
    if (indexPath.row==7) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
    }

    
    
    
    if (indexPath.row==8) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }

    if (indexPath.row==9) {
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
    
    if (indexPath.row==10) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }
    

    if (indexPath.row==11) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }
    }
    if (indexPath.section==1) {

    if (indexPath.row==0) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }
    
    if (indexPath.row==1) {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            Eservices *vdo = [[Eservices alloc] initWithNibName:@"Eservices_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        else
        {
            Eservices *vdo = [[Eservices alloc] initWithNibName:@"Eservices_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
        
    }
    if (indexPath.row==2)
    {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_iphone" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
            
        }
        else{
            
            newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_ipad" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
        }
    }
        if (indexPath.row==3)
        {
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }
        

        
        if (indexPath.row==4)
        {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }


        }
        
        
        
//        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//        {
//            golfgallery *vdo = [[golfgallery alloc] initWithNibName:@"golfgallery_iphone" bundle:nil];
//            [self.navigationController pushViewController:vdo animated:NO];
//        }
//        else
//        {
//            golfgallery *vdo = [[golfgallery alloc] initWithNibName:@"golfgallery_ipad" bundle:nil];
//            [self.navigationController pushViewController:vdo animated:NO];
//        }
//
        /*
        [[UINavigationBar appearance] setBarTintColor:[UIColor yellowColor]];
//        CMFViewController *vdo = [[CMFViewController alloc] init];
//        [self.navigationController pushViewController:vdo animated:NO];
        newgolf  *vdo = [[newgolf alloc] init];
        [self.navigationController pushViewController:vdo animated:NO];
        
        */

    }

   
    if (indexPath.section==2)
    {
        
        
        
        
        
        
        if ([array3[indexPath.row]isEqualToString:@"Bill Enquiry"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        
        // UIAlertView *alrt=[[UIAlertView alloc]initWithTitle:@"" message:@"Coming Soon!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //[alrt show];
        
        
        if ([array3[indexPath.row]isEqualToString:@"Notifications"]) {
            
            
            if([manage.str1 isEqualToString:@"failure"])
            {
                
                
                
                
                [[[UIAlertView alloc]initWithTitle:@"message !!!" message:@"please enable your settings in notification center" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
                
            }
            
            else
            {
                [notifycount removeAllObjects];
                
                
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            
        }
        
        
        
        
        
        
        /*
         
         
         itemshowdetailsAr1=[NSMutableArray arrayWithObjects:@"Bill Enquiry", @"About JGE", @"Contact Us", @"Latest News",@"Events",@"Notification",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Settings",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"E-Services",@"Show vacancy",@"Career registration",@"
         
         
         
         
         
         Settings",@"About JGE Application", nil];
         
         
         :@"Bill Enquiry",@"Maintenance Request" ,@"About JGE", @"Contact Us", @"Latest News",@"Tournament & Events",@"Notification",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Notification Settings",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"E-Services",@"Show Vacancies",@"Career Registration",@"Survey",@"About JGE Application", nil];
         
         
         
         
         */
        if ([array3[indexPath.row]isEqualToString:@"Maintenance Request"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        
        
        
        if ([array3[indexPath.row]isEqualToString:@"About JGE"]){
            
            /*if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                abtjgeus *et = [[abtjgeus alloc]initWithNibName:@"abtjgeus_iphone" bundle:nil];
                [self.navigationController pushViewController:et animated:NO];
            }
            else
            {
                abtjgeus *vdo = [[abtjgeus alloc] initWithNibName:@"abtjgeus" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];//        }
                
                
            }*/
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController" bundle:nil];
                [self.navigationController pushViewController:vdo animated:YES];
            }
            else
            {
                RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];//        }
                
                
            }

        }
        if ([array3[indexPath.row]isEqualToString:@"Contact Us"]){
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
        
        
        
        if ([array3[indexPath.row]isEqualToString:@"Latest News"]){
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                latestnews *vdo = [[latestnews alloc] initWithNibName:@"latestnews_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                latestnews *vdo = [[latestnews alloc] initWithNibName:@"latestnews_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }
        if ([array3[indexPath.row]isEqualToString:@"Tournaments & Events"]){
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                events *nl = [[events alloc]initWithNibName:@"events_iphone" bundle:nil];
                [self.navigationController pushViewController:nl animated:NO];
            }
            else
            {
                events *nl = [[events alloc]initWithNibName:@"events_ipad" bundle:nil];
                [self.navigationController pushViewController:nl animated:NO];
            }
            
            
            
        }
        
        /*  if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Survey"]){
         if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
         {
         events *nl = [[events alloc]initWithNibName:@"events_iphone" bundle:nil];
         [self.navigationController pushViewController:nl animated:NO];
         }
         else
         {
         events *nl = [[events alloc]initWithNibName:@"events_ipad" bundle:nil];
         [self.navigationController pushViewController:nl animated:NO];
         }
         
         
         
         }
         */
        
        
        
        
        
        /*  if ([itemshowdetailsAr1[indexPath.row]isEqualToString:@"Notification"]){
         
         
         
         if([manage.str1 isEqualToString:@"failure"])
         {
         [[[UIAlertView alloc]initWithTitle:@"message !!!" message:@"please enable your settings in notification center" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
         
         }
         
         else
         {
         [notifycount removeAllObjects];
         
         
         
         if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
         {
         Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_iphone" bundle:nil];
         [self.navigationController pushViewController:vdo animated:NO];
         }
         else
         {
         Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_ipad" bundle:nil];
         [self.navigationController pushViewController:vdo animated:NO];
         }
         
         }
         
         
         
         
         
         
         }
         */
        if ([array3[indexPath.row]isEqualToString:@"Property Showcase"]){
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                districview1 *vdo = [[districview1 alloc] initWithNibName:@"districview1_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
                
                
                
            }
            else
            {  districview1 *dis=[[districview1 alloc]init];
                [self.navigationController pushViewController:dis animated:NO];
            }
            
        }
        if ([array3[indexPath.row]isEqualToString:@"Book a Teetime"]){
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
            
            
            
        }
        if ([array3[indexPath.row]isEqualToString:@"Golf"]){
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
                
            }
            else{
                
                newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }
        if ([array3[indexPath.row]isEqualToString:@"Sales Enquiry"]){
            
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
        
        //Bill Enquiry
        
        
        
        
        if ([array3[indexPath.row]isEqualToString:@"Newsletter"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                newsletter *vdo = [[newsletter alloc] initWithNibName:@"newsletter_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                newsletter *vdo = [[newsletter alloc] initWithNibName:@"newsletter_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        if ([array3[indexPath.row]isEqualToString:@"Image Gallery"]) {
            
            //push the
            // if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            // {
            // gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"imagegallery_iphone" bundle:nil];
            //[self.navigationController pushViewController:vdo animated:NO];
            //        }
            //        else
            //        {
            gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"gallery_f" bundle:nil];
            [self.navigationController pushViewController:vdo animated:NO];
            //}
            
        }
        if ([array3[indexPath.row]isEqualToString:@"Video Gallery"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        
        
        if ([array3[indexPath.row]isEqualToString:@"Twitter"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        if ([array3[indexPath.row]isEqualToString:@"JGE Website"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }
        if ([array3[indexPath.row]isEqualToString:@"E-Services"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                Eservices *jge = [[Eservices alloc] initWithNibName:@"Eservices_iphone" bundle:nil];
                [self.navigationController pushViewController:jge animated:NO];
            }
            else
            {
                Eservices *jge = [[Eservices alloc] initWithNibName:@"Eservices_ipad" bundle:nil];
                [self.navigationController pushViewController:jge animated:NO];
            }
            
            
        }
        if ([array3[indexPath.row]isEqualToString:@"Facebook"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        if ([array3[indexPath.row]isEqualToString:@"Show Vacancies"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        if ([array3[indexPath.row]isEqualToString:@"Career Registration"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        
       // if ([array3[indexPath.row]isEqualToString:@"Notification Settings"]) {
            
            //push the
        //    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        //    {
         //       settings *vdo = [[settings alloc] initWithNibName:@"settings_iphone" bundle:nil];
         //       [self.navigationController pushViewController:vdo animated:NO];
         //   }
         //   else
         //   {
         //       settings *vdo = [[settings alloc] initWithNibName:@"settings_ipad" bundle:nil];
         //       [self.navigationController pushViewController:vdo animated:NO];
         //   }
        
      //  }
        
         if ([array3[indexPath.row]isEqualToString:@"Survey"]) {
        
             if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
             {
                 applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_iphone" bundle:nil];
                 [self.navigationController pushViewController:vdo animated:NO];
             }
             else
             {
                 applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_ipad" bundle:nil];
                 [self.navigationController pushViewController:vdo animated:NO];
             }
         }
        
        if ([array3[indexPath.row]isEqualToString:@"About JGE Application"]) {
            
            //push the
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
        }
        
        
        if ([array3[indexPath.row]isEqualToString:@"Club Membership Registration"])
        {
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }

        
        
        
        
        
        
        
    }
    if (indexPath.section==3) {
        
        if (indexPath.row==0) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }

            
            
        }
        
            
        
        
    }
    if (indexPath.section==4) {
        
        if (indexPath.row==0) {
                            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
           

            
        }
        if (indexPath.row==1) {
           
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
            
        }
        
        

        
    }
    if (indexPath.section==5) {
        
        if (indexPath.row==0) {
           {
               
               
               if([manage.str1 isEqualToString:@"failure"])
               {
                   [[[UIAlertView alloc]initWithTitle:@"message !!!" message:@"please enable your settings in notification center" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
                   
               }
               
               else
               {
                   [notifycount removeAllObjects];
                   
                   
                   
                   if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                   {
                       Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_iphone" bundle:nil];
                       [self.navigationController pushViewController:vdo animated:NO];
                   }
                   else
                   {
                       Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_ipad" bundle:nil];
                       [self.navigationController pushViewController:vdo animated:NO];
                   }
                   
               }
     

               
               
//                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//                {
//                    Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_iphone" bundle:nil];
//                    [self.navigationController pushViewController:vdo animated:NO];
//                }
//                else
//                {
//                    Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_ipad" bundle:nil];
//                    [self.navigationController pushViewController:vdo animated:NO];
//                }
           
            
            
        }

    
}
    }
    if (indexPath.section==6) {
        
        if (indexPath.row==0) {
           
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    settings *vdo = [[settings alloc] initWithNibName:@"settings_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    settings *vdo = [[settings alloc] initWithNibName:@"settings_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
           
            
            
        }
        if (indexPath.row==1) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }
     /* if (indexPath.row==2)
        {
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            
            
        }*/
        


        
    }
   
    if (indexPath.section==7) {
        
        NSLog(@"contact u seee");
        
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            contactus *et = [[contactus alloc]initWithNibName:@"contact_iphone" bundle:nil];
            [self.navigationController pushViewController:et animated:NO];
        }
        else
        {
            contactus *et = [[contactus alloc]init];
            [self.navigationController pushViewController:et animated:NO];
        }
        
 }
        
        /*
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    contact *vdo = [[contact alloc] initWithNibName:@"contact_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    contact *vdo = [[contact alloc] initWithNibName:@"contact_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
          }
          }
         
    */
    }
    else
    {
        //{
            /*
             
             
             itemshowdetailsAr1=[NSMutableArray arrayWithObjects:@"Bill Enquiry", @"About JGE", @"Contact Us", @"Latest News",@"Events",@"Notification",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Settings",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"E-Services",@"Show vacancy",@"Career registration",@"Notification Settings",@"About JGE Application", nil];
             
             
             
             
             
             
             
             */
        if (indexPath.section==0) {
            
            if (indexPath.row==0) {
                
                
              /*  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    abtjgeus *et = [[abtjgeus alloc]initWithNibName:@"abtjgeus_iphone" bundle:nil];
                    [self.navigationController pushViewController:et animated:NO];
                }
                else
                {
                    abtjgeus *vdo = [[abtjgeus alloc] initWithNibName:@"abtjgeus" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];//        }
                    
                    
                }*/
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:YES];
                }
                else
                {
                    RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];//        }
                    
                    
                }

            }
            
            
            if (indexPath.row==1)  {
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    latestnews *vdo = [[latestnews alloc] initWithNibName:@"latestnews_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    latestnews *vdo = [[latestnews alloc] initWithNibName:@"latestnews_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
            }

            
            if (indexPath.row==2) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    newsletter *vdo = [[newsletter alloc] initWithNibName:@"newsletter_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    newsletter *vdo = [[newsletter alloc] initWithNibName:@"newsletter_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if (indexPath.row==3)  {
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    events *nl = [[events alloc]initWithNibName:@"events_iphone" bundle:nil];
                    [self.navigationController pushViewController:nl animated:NO];
                }
                else
                {
                    events *nl = [[events alloc]initWithNibName:@"events_ipad" bundle:nil];
                    [self.navigationController pushViewController:nl animated:NO];
                }
                
            }
            
            if (indexPath.row==4) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"galleryf_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"gallery_f" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }

            if (indexPath.row==5) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if (indexPath.row==6) {
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    districview1 *vdo = [[districview1 alloc] initWithNibName:@"districview1_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                    
                    
                    
                }
                else
                {  districview1 *dis=[[districview1 alloc]init];
                    [self.navigationController pushViewController:dis animated:NO];
                }
                
            }
            
            
            if (indexPath.row==7) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            
            if (indexPath.row==8) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if (indexPath.row==9) {
                
                //push the
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

            if (indexPath.row==10) {
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                

                
                
            }
             if (indexPath.row==11) {

            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            

             }
            
            
            
            
            
            
            
            

        }
        
        
        if (indexPath.section==1) {
            if ([u_array2[indexPath.row]isEqualToString:@"Book a Teetime"]){
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
                
                
                
            }
            if ([u_array2[indexPath.row]isEqualToString:@"Golf"]) {
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                    
                }
                else{
                    
                    newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
            }
            if ([u_array2[indexPath.row]isEqualToString:@"Maintenance Request"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if ([u_array2[indexPath.row]isEqualToString:@"E-Services"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    Eservices *jge = [[Eservices alloc] initWithNibName:@"Eservices_iphone" bundle:nil];
                    [self.navigationController pushViewController:jge animated:NO];
                }
                else
                {
                    Eservices *jge = [[Eservices alloc] initWithNibName:@"Eservices_ipad" bundle:nil];
                    [self.navigationController pushViewController:jge animated:NO];
                }
                
                
            }


        }
        
        if (indexPath.section==2) {
            if ([u_array3[indexPath.row]isEqualToString:@"Change password"]) {
                
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    changepassword *et = [[changepassword alloc]initWithNibName:@"changepassword_iphone" bundle:nil];
                    [self.navigationController pushViewController:et animated:NO];
                }
                else
                {
                    changepassword *vdo = [[changepassword alloc] initWithNibName:@"changepassword" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];//        }
                    
                    
                }
            }
            
            
            
            //Payment History
            if ([u_array3[indexPath.row]isEqualToString:@"Transaction History"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    trancation *vdo = [[trancation alloc] initWithNibName:@"trancation_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    trancation *vdo = [[trancation alloc] initWithNibName:@"trancation" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            
            
            if ([u_array3[indexPath.row]isEqualToString:@"Maintenance Request"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    maintanance *vdo = [[maintanance alloc] initWithNibName:@"maintanance" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"About JGE Application"]) {

            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_iphone" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }
            else
            {
                abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_ipad" bundle:nil];
                [self.navigationController pushViewController:vdo animated:NO];
            }

            }
            
            if ([u_array3[indexPath.row]isEqualToString:@"About JGE"]) {
                
                
             /*   if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    abtjgeus *et = [[abtjgeus alloc]initWithNibName:@"abtjgeus_iphone" bundle:nil];
                    [self.navigationController pushViewController:et animated:NO];
                }
                else
                {
                    abtjgeus *vdo = [[abtjgeus alloc] initWithNibName:@"abtjgeus" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];//        }
                    
                    
                }*/
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:YES];
                }
                else
                {
                    RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];//        }
                    
                    
                }

            }
            if ([u_array3[indexPath.row]isEqualToString:@"Contact Us"]) {
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
            
            
            
            if ([u_array3[indexPath.row]isEqualToString:@"Latest News"])  {
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    latestnews *vdo = [[latestnews alloc] initWithNibName:@"latestnews_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    latestnews *vdo = [[latestnews alloc] initWithNibName:@"latestnews_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"Tournaments & Events"])  {
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    events *nl = [[events alloc]initWithNibName:@"events_iphone" bundle:nil];
                    [self.navigationController pushViewController:nl animated:NO];
                }
                else
                {
                    events *nl = [[events alloc]initWithNibName:@"events_ipad" bundle:nil];
                    [self.navigationController pushViewController:nl animated:NO];
                }
                
                
                
            }
            
            if ([u_array3[indexPath.row]isEqualToString:@"Property Showcase"]) {
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    districview1 *vdo = [[districview1 alloc] initWithNibName:@"districview1_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                    
                    
                    
                }
                else
                {  districview1 *dis=[[districview1 alloc]init];
                    [self.navigationController pushViewController:dis animated:NO];
                }
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"Book a Teetime"]){
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    teebooking *vdo = [[teebooking alloc] initWithNibName:@"teebooking_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
                
                
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"Golf"]) {
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                    
                }
                else{
                    
                    newgolf  *vdo = [[newgolf alloc] initWithNibName:@"newgolf_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"Sales Enquiry"]) {
                
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
            if ([u_array3[indexPath.row]isEqualToString:@"Settings"]){
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    settings *vdo = [[settings alloc] initWithNibName:@"settings_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    settings *vdo = [[settings alloc] initWithNibName:@"settings_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
                
            }

            
            if ([u_array3[indexPath.row]isEqualToString:@"Notification Settings"]){
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    settings *vdo = [[settings alloc] initWithNibName:@"settings_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    settings *vdo = [[settings alloc] initWithNibName:@"settings_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
                
            }
            
            
            
            if ([u_array3[indexPath.row]isEqualToString:@"Newsletter"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    newsletter *vdo = [[newsletter alloc] initWithNibName:@"newsletter_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    newsletter *vdo = [[newsletter alloc] initWithNibName:@"newsletter_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"Image Gallery"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"galleryf_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    gallery_f *vdo = [[gallery_f alloc] initWithNibName:@"gallery_f" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"Video Gallery"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    videogallery *vdo = [[videogallery alloc] initWithNibName:@"videogallery_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            
            
            if ([u_array3[indexPath.row]isEqualToString:@"Twitter"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    twitter *vdo = [[twitter alloc] initWithNibName:@"twitter_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"JGE Website"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"View & Pay Bills"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            
            if ([u_array3[indexPath.row]isEqualToString:@"E-Services"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    Eservices *jge = [[Eservices alloc] initWithNibName:@"Eservices_iphone" bundle:nil];
                    [self.navigationController pushViewController:jge animated:NO];
                }
                else
                {
                    Eservices *jge = [[Eservices alloc] initWithNibName:@"Eservices_ipad" bundle:nil];
                    [self.navigationController pushViewController:jge animated:NO];
                }
                
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"Facebook"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    facebook *vdo = [[facebook alloc] initWithNibName:@"facebook_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"Club Membership Registration"])
            {
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
            }
            

            if ([u_array3[indexPath.row]isEqualToString:@"Show Vacancies"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            if ([u_array3[indexPath.row]isEqualToString:@"Notifications"])
            {
            
            if([manage.str1 isEqualToString:@"failure"])
            {
                
                
                
                
                [[[UIAlertView alloc]initWithTitle:@"message !!!" message:@"please enable your settings in notification center" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
                
            }
            
            else
            {
                [notifycount removeAllObjects];
                
                
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            }
            if ([u_array3[indexPath.row]isEqualToString:@"Survey"]) {
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    applicationfeedback *vdo = [[applicationfeedback alloc] initWithNibName:@"applicationfeedback_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
            }

            
            if ([u_array3[indexPath.row]isEqualToString:@"Career Registration"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            

        }
        
        if (indexPath.section==3) {
            
            
            if ([u_array4[indexPath.row]isEqualToString:@"View & Pay Bills"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    billenquiry *vdo = [[billenquiry alloc] initWithNibName:@"billenquiry" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }

            
            if ([u_array4[indexPath.row]isEqualToString:@"Transaction History"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    trancation *vdo = [[trancation alloc] initWithNibName:@"trancation_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    trancation *vdo = [[trancation alloc] initWithNibName:@"trancation" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            
  
            
            
            
        }
        
        if (indexPath.section==4) {
            if ([u_array5[indexPath.row]isEqualToString:@"Show Vacancies"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    vacancy *vdo = [[vacancy alloc] initWithNibName:@"vacancy_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            
            if ([u_array5[indexPath.row]isEqualToString:@"Career Registration"]) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    car_register *vdo = [[car_register alloc] initWithNibName:@"carregister_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }

            
            
            

        }
       
        if (indexPath.section==5) {
        
            if ([u_array6[indexPath.row]isEqualToString:@"Notifications"])
            {
                
                if([manage.str1 isEqualToString:@"failure"])
                {
                    
                    
                    
                    
                    [[[UIAlertView alloc]initWithTitle:@"message !!!" message:@"please enable your settings in notification center" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];
                    
                }
                
                else
                {
                    [notifycount removeAllObjects];
                    
                    
                    
                    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                    {
                        Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_iphone" bundle:nil];
                        [self.navigationController pushViewController:vdo animated:NO];
                    }
                    else
                    {
                        Notifications *vdo = [[Notifications alloc] initWithNibName:@"Notifications_ipad" bundle:nil];
                        [self.navigationController pushViewController:vdo animated:NO];
                    }
                    
                }
            }
            

    }
       
             if (indexPath.section==6)
             {
            
if( indexPath.row==0){
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    settings *vdo = [[settings alloc] initWithNibName:@"settings_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    settings *vdo = [[settings alloc] initWithNibName:@"settings_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
                
}
            
           if( indexPath.row==1) {
                
                //push the
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_iphone" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                else
                {
                    abt_JGE *vdo = [[abt_JGE alloc] initWithNibName:@"abtJGE_ipad" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];
                }
                
            }
            
             if( indexPath.row==2) {
                
                
                if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                {
                    changepassword *et = [[changepassword alloc]initWithNibName:@"changepassword_iphone" bundle:nil];
                    [self.navigationController pushViewController:et animated:NO];
                }
                else
                {
                    changepassword *vdo = [[changepassword alloc] initWithNibName:@"changepassword" bundle:nil];
                    [self.navigationController pushViewController:vdo animated:NO];//        }
                    
                    
                }
            }

               /*  if (indexPath.row==3)
                 {
                     
                     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
                     {
                         membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform_iphone" bundle:nil];
                         [self.navigationController pushViewController:vdo animated:NO];
                     }
                     else
                     {
                         membershipform *vdo = [[membershipform alloc] initWithNibName:@"membershipform" bundle:nil];
                         [self.navigationController pushViewController:vdo animated:NO];
                     }
                     
                     
                 }*/

        
             }
        
            }
    
    }
}


  
    

#pragma mark - gesture tapped
- (void)sectionHeaderTapped:(UITapGestureRecognizer *)gestureRecognizer{
//    if (indexPath.row == 0) {
//        ///it's the first row of any section so it would be your custom section header
//        
//        ///put in your code to toggle your boolean value here
//        mybooleans[indexPath.section] =!mybooleans[indexPath.section];
//        
//        ///reload this section
//        [self.tableView1 reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
//    }

    
   NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:gestureRecognizer.view.tag];
    if (gestureRecognizer.view.tag==0) {
        NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndex:1];
         [self.tableView1 reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
        
        NSIndexSet *sectionToReload1 = [NSIndexSet indexSetWithIndex:2];
        [self.tableView1 reloadSections:sectionToReload1 withRowAnimation:UITableViewRowAnimationFade];

        NSIndexSet *sectionToReload2 = [NSIndexSet indexSetWithIndex:3];
        [self.tableView1 reloadSections:sectionToReload2 withRowAnimation:UITableViewRowAnimationFade];
        
        
        
        
    }
           if (indexPath.row == 0) {
            BOOL collapsed  = [arrayForBool[indexPath.section] boolValue];
           // arrayForBool[gestureRecognizer.view.tag] = !arrayForBool[gestureRecognizer.view.tag];
            collapsed       = !collapsed;
            arrayForBool[indexPath.section] = @(collapsed);
            
            //reload specific section animated
            NSRange range   = NSMakeRange(indexPath.section, 1);
            NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
            [self.tableView1 reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
        }

  
 /*
     NSMutableArray *isSectionTouched =[[NSMutableArray alloc]initWithCapacity:arrayForBool.count];
     isSectionTouched=[arrayForBool mutableCopy];
     
     for(int i = 1; i <[arrayForBool count] ; i ++){
     if(i != gestureRecognizer.view.tag){
     [isSectionTouched replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:NO]];
     }else{
     if ([[isSectionTouched objectAtIndex:gestureRecognizer.view.tag]boolValue]==YES) {
     [isSectionTouched replaceObjectAtIndex:gestureRecognizer.view.tag withObject:[NSNumber numberWithBool:NO]];
     }else if ([[isSectionTouched objectAtIndex:gestureRecognizer.view.tag]boolValue]==NO){
     [isSectionTouched replaceObjectAtIndex:gestureRecognizer.view.tag withObject:[NSNumber numberWithBool:YES]];
     }
     }
     }
     arrayForBool=isSectionTouched;
     NSRange range   = NSMakeRange(1,arrayForBool.count - 1);
     NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
     [self.tableView1 reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationFade];
     
  
    */
    
   
    }


-(IBAction)edit:(id)sender
{
    self.show.hidden=NO;
    
    
    
}
/*
 
 array1= [NSMutableArray arrayWithObjects:@"About JGE", @"Latest News", @"Newsletter", @"Events",@"Image Gallery",@"Video Gallery",@"Property Showcase",@"Facebook",@"Twitter",@"Sales Enquiry",@"JGE Website",@"Survey", nil];
 [sectionContentDict setValue:array1 forKey:[sectionTitleArray objectAtIndex:0]];
 array2= [NSMutableArray arrayWithObjects:@"Book a Tee Time", @"E-Services", @"Golf", nil];
 [sectionContentDict setValue:array2 forKey:[sectionTitleArray objectAtIndex:1]];
 array3     = [NSMutableArray arrayWithObjects:@"Bill Enquiry", @"About JGE Application", @"Contact Us", @"Latest News",@"Events",@"Notification",@"Property Showcase",@"Book a Tee Time",@"Golf",@"Sales Enquiry",@"Settings", nil];
 
 
 [sectionContentDict setValue:array3 forKey:[sectionTitleArray objectAtIndex:2]];
 
 array4     = [NSMutableArray arrayWithObjects:@"Bill Enquiry",nil];
 [sectionContentDict setValue:array4 forKey:[sectionTitleArray objectAtIndex:3]];
 array5     = [NSMutableArray arrayWithObjects:@"Show Vacancy", @"Career registration", nil];
 [sectionContentDict setValue:array5 forKey:[sectionTitleArray objectAtIndex:4]];
 array6     = [NSMutableArray arrayWithObjects:@"Notification", nil];
 [sectionContentDict setValue:array6 forKey:[sectionTitleArray objectAtIndex:5]];
 array7     = [NSMutableArray arrayWithObjects:@"Notification Settings",@"About JGE Application", nil];
 [sectionContentDict setValue:array7 forKey:[sectionTitleArray objectAtIndex:6]];

 
 */

#pragma mark - gesture tapped





-(IBAction)loginBtn:(id)sender
{
   // [[[UIAlertView alloc]initWithTitle:nil message:@"Coming Soon!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show ];

    
  
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        LoginViewController *login1 = [[LoginViewController alloc]initWithNibName:@"LoginViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:login1 animated:YES];
    }
    else
    {
        LoginViewController *login1 = [[LoginViewController alloc]initWithNibName:@"LoginViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:login1 animated:YES];
    }
   
}


-(IBAction)contact:(id)sender
{
    
    /*
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        contact *login = [[contact alloc]initWithNibName:@"contact_iphone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        contact *login = [[contact alloc]initWithNibName:@"contact_ipad" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
     */
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        contactus *et = [[contactus alloc]initWithNibName:@"contact_iphone" bundle:nil];
        [self.navigationController pushViewController:et animated:NO];
    }
    else
    {
        contactus *et = [[contactus alloc]init];
        [self.navigationController pushViewController:et animated:NO];
    }

    
}


-(IBAction)settings:(id)sender
{
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        settings *ln = [[settings alloc]initWithNibName:@"settings_iphone" bundle:nil];
        [self.navigationController pushViewController:ln animated:YES];
    }
    else
    {
        settings *ln = [[settings alloc]initWithNibName:@"settings_ipad" bundle:nil];
        [self.navigationController pushViewController:ln animated:YES];
    }
    
    
}

//applicationfeedback
-(IBAction)login:(id)sender
{
    
    
    
    /*
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController_iPhone" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
    else
    {
        LoginViewController *login = [[LoginViewController alloc]initWithNibName:@"LoginViewController_iPad" bundle:nil];
        [self.navigationController pushViewController:login animated:YES];
    }
     */
    
}



-(IBAction)expo:(id)sender
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        expo2020 *vdo = [[expo2020 alloc] initWithNibName:@"expo2020_iphone" bundle:nil];
        [self.navigationController pushViewController:vdo animated:YES];
    }
    else
    {
        expo2020 *vdo = [[expo2020 alloc] initWithNibName:@"expo2020_ipad" bundle:nil];
        [self.navigationController pushViewController:vdo animated:YES];
    }
    
}


-(IBAction)Abtus:(id)sender
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        RZTableViewController *vdo = [[RZTableViewController alloc] initWithNibName:@"RZTableViewController" bundle:nil];
        [self.navigationController pushViewController:vdo animated:YES];
    }
   /* else
    {
        Abtus *vdo = [[Abtus alloc] initWithNibName:@"Abtus_ipad" bundle:nil];
        [self.navigationController pushViewController:vdo animated:YES];
    }*/
    
}
//vacancy


-(IBAction)root:(id)sender
{
    fav *vdo = [[fav alloc] init];
    [self.navigationController pushViewController:vdo animated:YES];
    
}
-(IBAction)fav:(id)sender
{
 self.show.hidden=NO;
    [self hideMenu];
}
-(void)imgbtnButtonClicked1:(UIButton*)sender withEvent: (UIEvent *) event
{
    NSLog(@"plus clicked");
    
    
    UITouch * touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView: self.tbl1];
    NSIndexPath * indexPath = [self.tbl1 indexPathForRowAtPoint: location];
    
     NSLog(@"indexPath.section==%ld",(long)indexPath.section);
    
      NSLog(@"row==%ld",(long)indexPath.row);
    
    
    // oth section
    if (uservalue==0) {
        
   
    
   if (indexPath.section==0)
    {
        
        [array3 addObject:array1[sender.tag]];
        if (indexPath.row==2) {
             [self.itemshowdetailsAr addObject:@"newsletter1.png"];
            
          //  [temparray addObject:array1[sender.tag]];
        }
        if (indexPath.row==4) {
            [self.itemshowdetailsAr addObject:@"photo1.png"];
        }
        if (indexPath.row==5) {
            [self.itemshowdetailsAr addObject:@"video_gallery_icon.png"];
        }
        if (indexPath.row==7) {
            [self.itemshowdetailsAr addObject:@"facebook_icon.png"];
        }
        if (indexPath.row==8) {
         [self.itemshowdetailsAr addObject:@"twitter_icon.png"];
        }
        if (indexPath.row==10) {
            [self.itemshowdetailsAr addObject:@"website_icon.png"];
        }
        if (indexPath.row==11) {
            [self.itemshowdetailsAr addObject:@"review.png"];
        }

        [self.itemshowdetailsAr1 addObject:array1[sender.tag]];
                
        [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
        
        
    }
    
    else  if (indexPath.section==1)
    {
        
        [array3 addObject:array2[sender.tag]];
        [self.itemshowdetailsAr1 addObject:array2[sender.tag]];

        if (indexPath.row==1) {
            [self.itemshowdetailsAr addObject:@"eservices_icon.png"];
        }

       // [self.itemshowdetailsAr1 addObject:[array1 objectAtIndex:sender.tag]];

        
        
        
        [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
    }
        
    else  if (indexPath.section==4)
    {
        
        [array3 addObject:array5[sender.tag]];
        if (indexPath.row==0) {
            [self.itemshowdetailsAr addObject:@"show_vacancies_icon.png"];
        }
        if (indexPath.row==1) {
            [self.itemshowdetailsAr addObject:@"review.png"];
        }
        [self.itemshowdetailsAr1 addObject:array5[sender.tag]];

        
        
        [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
    }
    else  if (indexPath.section==6)
    {
        
        [array3 addObject:array7[sender.tag]];
        
        [self.itemshowdetailsAr1 addObject:array7[sender.tag]];
        if (indexPath.row==0) {
            [self.itemshowdetailsAr addObject:@"settingsnotify.png"];
        }
        if (indexPath.row==1)
        {
            [self.itemshowdetailsAr addObject:@"about_app_icon - Copy.png"];
            
              [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
    }
    }
    else
    {
        // do nothing
    }
}
else
{
    if (indexPath.section==0)
    {
        
        [u_array3 addObject:u_array1[sender.tag]];
        if (indexPath.row==2) {
            [self.u_itemshowdetailsAr addObject:@"newsletter1.png"];
            
            //  [temparray addObject:array1[sender.tag]];
        }
        if (indexPath.row==4) {
            [self.u_itemshowdetailsAr addObject:@"photo1.png"];
        }
        if (indexPath.row==5) {
            [self.u_itemshowdetailsAr addObject:@"video_gallery_icon.png"];
        }
        if (indexPath.row==7) {
            [self.u_itemshowdetailsAr addObject:@"facebook_icon.png"];
        }
        if (indexPath.row==8) {
            [self.u_itemshowdetailsAr addObject:@"twitter_icon.png"];
        }
        if (indexPath.row==10) {
            [self.u_itemshowdetailsAr addObject:@"website_icon.png"];
        }
        if (indexPath.row==11) {
             [self.u_itemshowdetailsAr addObject:@"review.png"];
        }
        [self.u_itemshowdetailsAr1 addObject:u_array1[sender.tag]];
        
        [u_sectionContentDict setValue:u_array3 forKey:u_sectionTitleArray[2]];
        
        
    }
    
    else  if (indexPath.section==1)
    {
        
        [u_array3 addObject:u_array2[sender.tag]];
        [self.u_itemshowdetailsAr1 addObject:u_array2[sender.tag]];
        
        if (indexPath.row==1) {
            [self.u_itemshowdetailsAr addObject:@"eservices_icon.png"];
        }
        
        // [self.itemshowdetailsAr1 addObject:[array1 objectAtIndex:sender.tag]];
        
        
        //@"maintenance_icon.png"
        if (indexPath.row==3) {
            [self.u_itemshowdetailsAr addObject:@"maintenance_icon.png"];
        }

        [u_sectionContentDict setValue:u_array3 forKey:u_sectionTitleArray[2]];
    }
    
    else  if (indexPath.section==4)
    {
        
        [u_array3 addObject:u_array5[sender.tag]];
        if (indexPath.row==0) {
            [self.u_itemshowdetailsAr addObject:@"show_vacancies_icon.png"];
        }
        if (indexPath.row==1) {
            [self.u_itemshowdetailsAr addObject:@"carrer_register__icon.png"];
        }
        [self.u_itemshowdetailsAr1 addObject:u_array5[sender.tag]];
        
        
        
        [u_sectionContentDict setValue:u_array3 forKey:u_sectionTitleArray[2]];
    }
    else  if (indexPath.section==6)
    {
        
        [u_array3 addObject:u_array7[sender.tag]];
        
        [self.u_itemshowdetailsAr1 addObject:u_array7[sender.tag]];
        if (indexPath.row==1)
        {
            [self.u_itemshowdetailsAr addObject:@"about_app_icon - Copy.png"];
            
            
            
//            [itemshowdetailsAr1 removeObject:@"About JGE Application"];
//            [itemshowdetailsAr removeObject:@"about_app_icon - Copy.png"];
//            

        }
        if (indexPath.row==2) {
            [self.u_itemshowdetailsAr addObject:@"changepassword.png"];
        }
        [u_sectionContentDict setValue:u_array3 forKey:u_sectionTitleArray[2]];
    }
    else
    {
        // do nothing
    }

    /*
     
     
     if ([u_array3[indexPath.row] isEqualToString:@"Change Password"] )
     
     {
     
     
     
     
     [u_itemshowdetailsAr1 removeObject:@"Change Password"];
     [u_itemshowdetailsAr removeObject:@"changepassword.png"];
     
     
     
     }

     */
}

    
    
   
    
    [self.tbl reloadData];
    [self.tbl1 reloadData];
    [self.tableView1 reloadData];
    [self.collectionViewPack reloadData];
   
   
   }

-(void)imgbtnButtonClicked11:(UIButton*)sender withEvent:(UIEvent *) event
{
    
    
    
     NSLog(@"minus clicked");
    
    
    UITouch * touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView: self.tbl1];
    NSIndexPath * indexPath = [self.tbl1 indexPathForRowAtPoint: location];
    
    NSLog(@"indexPath.section==%ld",(long)indexPath.section);
    
    
    NSLog(@" array3  remove object ==%@",array3[indexPath.row]);
    
    
    if (uservalue.length==0) {
        
   
        if ([array3[indexPath.row] isEqualToString:@"Survey"] )
            
        {
            
            [itemshowdetailsAr1 removeObject:@"Survey"];
            [itemshowdetailsAr removeObject:@"review.png"];
            
            
            //  [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
        }
        
        

        if ([array3[indexPath.row] isEqualToString:@"About JGE Application"] )
            
        {
            
            [itemshowdetailsAr1 removeObject:@"About JGE Application"];
            [itemshowdetailsAr removeObject:@"about_app_icon - Copy.png"];
            
            
            //  [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
        }
        
        
//@"Survey",@"About JGE Application"  @"review.png",@"about_app_icon - Copy.png"
        
        
        
        
        
        
    
    if ([array3[indexPath.row] isEqualToString:@"Image Gallery"] )
        
    {
        
       [itemshowdetailsAr1 removeObject:@"Image Gallery"];
       [itemshowdetailsAr removeObject:@"photo1.png"];
        
        
      //  [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
    }
    
    
   
    
     if ([array3[indexPath.row] isEqualToString:@"Newsletter"] )
        
    {
        
    [itemshowdetailsAr1 removeObject:@"Newsletter"];
        [itemshowdetailsAr removeObject:@"newsletter1.png"];
        
        // [temparray addObject:array1[sender.tag]];
        
       // [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
    }
    
     if ([array3[indexPath.row] isEqualToString:@"Notification Settings"] )
        
    {
        
       // [array3 removeObject:array3[indexPath.row]];
        
        
        
        [itemshowdetailsAr1 removeObject:@"Notification Settings"];
        [itemshowdetailsAr removeObject:@"settingsnotify.png"];
        
        
      //  [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
    }
    
     if ([array3[indexPath.row] isEqualToString:@"Career Registration"] )
        
    {
        
      //  [array3 removeObject:array3[indexPath.row]];
        
        
        
        [itemshowdetailsAr1 removeObject:@"Career Registration"];
        [itemshowdetailsAr removeObject:@"carrer_register__icon.png"];
        
        
      //  [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
    }
    
    
    
    
     if ([array3[indexPath.row] isEqualToString:@"Show Vacancies"] )
        
    {
        
        
        [itemshowdetailsAr1 removeObject:@"Show Vacancies"];
        [itemshowdetailsAr removeObject:@"show_vacancies_icon.png"];
        
        
      
    }
    
    
     if ([array3[indexPath.row] isEqualToString:@"E-Services"] )
        
    {
        
        
        [itemshowdetailsAr1 removeObject:@"E-Services"];
        [itemshowdetailsAr removeObject:@"eservices_icon.png"];
        
        
     
    }
    
   
    
     if ([array3[indexPath.row] isEqualToString:@"JGE Website"] )
        
    {
        
        
        [itemshowdetailsAr1 removeObject:@"JGE Website"];
        [itemshowdetailsAr removeObject:@"website_icon.png"];
        
        
         }
    
     if ([array3[indexPath.row] isEqualToString:@"Twitter"] )
        
    {
        
             
        [itemshowdetailsAr1 removeObject:@"Twitter"];
        [itemshowdetailsAr removeObject:@"twitter_icon.png"];
        
        
       
    }
    
     if ([array3[indexPath.row] isEqualToString:@"Facebook"] )
        
    {
        
        
        
        
        [itemshowdetailsAr1 removeObject:@"Facebook"];
        [itemshowdetailsAr removeObject:@"facebook_icon.png"];
        
        
          }
    
   
    
     if ([array3[indexPath.row] isEqualToString:@"Video Gallery"] )
        
    {
        
             
        
        
        [itemshowdetailsAr1 removeObject:@"Video Gallery"];
        [itemshowdetailsAr removeObject:@"video_gallery_icon.png"];
        
        
        
    }
    
    [array3 removeObject:array3[indexPath.row]];
    

    
    [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
  }
    else
    {
        /*
         
         
         [NSMutableArray arrayWithObjects:@"Bill Enquiry",@"Maintenance Request" ,@"About JGE", @"Contact Us", @"Latest News",@"Tournament & Events",@"Notification",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Notification Settings",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"E-Services",@"Show vacancies",@"Career Registration",@"Survey",@"About JGE Application", nil];
         
         u_itemshowdetailsAr=[[NSMutableArray alloc ] initWithObjects:@"bill_enquiry_icon.png",@"jge_account_icon.png",@"maintenance_icon.png",@"about_jme_app_icon.png",@"contactus.png",@"news3.png",@"events.png",@"church2.png",@"property_show_case_icon.png",@"tee_icon.png",@"golf_icon.png",@"sales_enquiry_icon.png",@"settings.png",@"newsletter_icon.png",@"photo1.png",@"video_gallery_icon.png",@"facebook_icon.png",@"twitter_icon.png",@"website_icon.png",@"eservices_icon.png",@"show_vacancies_icon.png",@"carrer_register__icon.png",@"review.png",@"about_app_icon - Copy.png",@"change_password_icon.png",nil];
         
         
         
         u_itemshowdetailsAr1=[NSMutableArray arrayWithObjects:@"View&Pay bills",@"Transation History",@"Maintenance Request", @"About JGE", @"Contact Us", @"Latest News",@"Tournament & Events",@"Notification",@"Property Showcase",@"Book a Teetime",@"Golf",@"Sales Enquiry",@"Notification Settings",@"Newsletter",@"Image Gallery",@"Video Gallery",@"Facebook",@"Twitter",@"JGE Website",@"E-Services",@"Show vacancies",@"Career Registration",@"Survey",@"About JGE Application",@"Change Password", nil];
         
         
         */
            
            
            
            if ([u_array3[indexPath.row] isEqualToString:@"Image Gallery"] )
                
            {
                
                [u_itemshowdetailsAr1 removeObject:@"Image Gallery"];
                [u_itemshowdetailsAr removeObject:@"photo1.png"];
                
                
                //  [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
            }
            
        if ([u_array3[indexPath.row] isEqualToString:@"About JGE Application"] )
            
        {
            
            [u_itemshowdetailsAr1 removeObject:@"About JGE Application"];
            [u_itemshowdetailsAr removeObject:@"about_app_icon - Copy.png"];
            
            
            //  [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
        }
        
        

        
        
            if ([u_array3[indexPath.row] isEqualToString:@"Newsletter"] )
                
            {
                
                [u_itemshowdetailsAr1 removeObject:@"Newsletter"];
                [u_itemshowdetailsAr removeObject:@"newsletter1.png"];
                
                
                // [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
            }
            
            if ([u_array3[indexPath.row] isEqualToString:@"Notification Settings"] )
                
            {
                
                // [array3 removeObject:array3[indexPath.row]];
                
                
                
                [u_itemshowdetailsAr1 removeObject:@"Notification Settings"];
                [u_itemshowdetailsAr removeObject:@"settings.png"];
                
                
                //  [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
            }
            
            if ([u_array3[indexPath.row] isEqualToString:@"Career Registration"] )
                
            {
                
                //  [array3 removeObject:array3[indexPath.row]];
                
                
                
                [u_itemshowdetailsAr1 removeObject:@"Career Registration"];
                [u_itemshowdetailsAr removeObject:@"carrer_register__icon.png"];
                
                
                //  [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
            }
            
        if ([u_array3[indexPath.row] isEqualToString:@"Maintenance Request"] )
            
        {
            
            
            
            [u_itemshowdetailsAr1 removeObject:@"Maintenance Request"];
            [u_itemshowdetailsAr removeObject:@"maintenance_icon.png"];
            
            
            // [sectionContentDict setValue:array3 forKey:sectionTitleArray[2]];
        }

        
        
            if ([u_array3[indexPath.row] isEqualToString:@"Show Vacancies"] )
                
            {
                
                
                [u_itemshowdetailsAr1 removeObject:@"Show Vacancies"];
                [u_itemshowdetailsAr removeObject:@"show_vacancies_icon.png"];
                
                
                
            }
            
            
            if ([u_array3[indexPath.row] isEqualToString:@"E-Services"] )
                
            {
                
                
                [u_itemshowdetailsAr1 removeObject:@"E-Services"];
                [u_itemshowdetailsAr removeObject:@"eservices_icon.png"];
                
                
                
            }
            
            
            
            if ([u_array3[indexPath.row] isEqualToString:@"JGE Website"] )
                
            {
                
                
                [u_itemshowdetailsAr1 removeObject:@"JGE Website"];
                [u_itemshowdetailsAr removeObject:@"website_icon.png"];
                
                
            }
            
            if ([u_array3[indexPath.row] isEqualToString:@"Twitter"] )
                
            {
                
                
                [u_itemshowdetailsAr1 removeObject:@"Twitter"];
                [u_itemshowdetailsAr removeObject:@"twitter_icon.png"];
                
                
                
            }
            
            if ([u_array3[indexPath.row] isEqualToString:@"Facebook"] )
                
            {
                
                
                
                
                [u_itemshowdetailsAr1 removeObject:@"Facebook"];
                [u_itemshowdetailsAr removeObject:@"facebook_icon.png"];
                
                
            }
            
            
            
            if ([u_array3[indexPath.row] isEqualToString:@"Video Gallery"] )
                
            {
                
                
                
                
                [u_itemshowdetailsAr1 removeObject:@"Video Gallery"];
                [u_itemshowdetailsAr removeObject:@"video_gallery_icon.png"];
                
                
                
            }
        
        if ([u_array3[indexPath.row] isEqualToString:@"Change Password"] )
            
        {
            
            
            
            
            [u_itemshowdetailsAr1 removeObject:@"Change Password"];
            [u_itemshowdetailsAr removeObject:@"changepassword.png"];
            
            
            
        }
        

        
        
            [u_array3 removeObject:u_array3[indexPath.row]];
            
            
            
            [u_sectionContentDict setValue:u_array3 forKey:u_sectionTitleArray[2]];
       
    }
  
      [self.tbl reloadData];
    [self.tbl1 reloadData];
    [self.tableView1 reloadData];
    
    [self.collectionViewPack reloadData];
    
}
-(IBAction)done:(id)sender
{
    self.show.hidden=YES;
    
    if (uservalue.length==0) {
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"item1"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"item2"];
        
        
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"arraya"];
        
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"arrayb"];
        
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"arrayc"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"arrayd"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"arraye"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"arrayf"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"arrayg"];
        
        
        
        
        [[NSUserDefaults standardUserDefaults]setObject:itemshowdetailsAr1 forKey:@"item1"];
        [[NSUserDefaults standardUserDefaults]setObject:itemshowdetailsAr forKey:@"item2"];
        [[NSUserDefaults standardUserDefaults]setObject:array3 forKey:@"arrayc"];
        [[NSUserDefaults standardUserDefaults]setObject:array1 forKey:@"arraya"];
        [[NSUserDefaults standardUserDefaults]setObject:array2 forKey:@"arrayb"];
        [[NSUserDefaults standardUserDefaults]setObject:array4 forKey:@"arrayd"];
        [[NSUserDefaults standardUserDefaults]setObject:array5 forKey:@"arraye"];
        [[NSUserDefaults standardUserDefaults]setObject:array6 forKey:@"arrayf"];
        [[NSUserDefaults standardUserDefaults]setObject:array7 forKey:@"arrayg"];
        

    }
    else
    {
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"u_item1"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"u_item2"];
        
        
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"u_arraya"];
        
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"u_arrayb"];
        
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"u_arrayc"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"u_arrayd"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"u_arraye"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"u_arrayf"];
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"u_arrayg"];
        
        
        
        
        [[NSUserDefaults standardUserDefaults]setObject:u_itemshowdetailsAr1 forKey:@"u_item1"];
        [[NSUserDefaults standardUserDefaults]setObject:u_itemshowdetailsAr forKey:@"u_item2"];
        [[NSUserDefaults standardUserDefaults]setObject:u_array3 forKey:@"u_arrayc"];
        [[NSUserDefaults standardUserDefaults]setObject:u_array1 forKey:@"u_arraya"];
        [[NSUserDefaults standardUserDefaults]setObject:u_array2 forKey:@"u_arrayb"];
        [[NSUserDefaults standardUserDefaults]setObject:u_array4 forKey:@"u_arrayd"];
        [[NSUserDefaults standardUserDefaults]setObject:u_array5 forKey:@"u_arraye"];
        [[NSUserDefaults standardUserDefaults]setObject:u_array6 forKey:@"u_arrayf"];
        [[NSUserDefaults standardUserDefaults]setObject:u_array7 forKey:@"u_arrayg"];
  
    }
    
    
    
      NSLog(@"arr ...%@",array3);
   // [[NSUserDefaults standardUserDefaults]setObject:sectionTitleArray forKey:@"sectionTitleArray"];
   // [[NSUserDefaults standardUserDefaults]setObject:sectionContentDict forKey:@"sectionContentDict"];
    
  //  NSLog(@"section.....%@",sectionContentDict);
    [[NSUserDefaults standardUserDefaults]synchronize];

  
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==999) {
        
        if (buttonIndex==0) {
            
        }
        else
        {
            manage.user=@"";
            manage.userlogin=@"";
            login.hidden=NO;
            logout.hidden=YES;
            [collectionViewPack reloadData];
            [tableView1 reloadData];
            [tbl1 reloadData];
            manage.logoutboolean=YES;
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                fav *home = [[fav alloc]initWithNibName:@"fav_iphone" bundle:nil];
                [self.navigationController pushViewController:home animated:YES];
            }
            else
            {
                fav *home = [[fav alloc]initWithNibName:@"fav_ipad" bundle:nil];
                [self.navigationController pushViewController:home animated:YES];
            }

            
        }
        
        
        
        
    }
}
-(IBAction)logouting:(id)sender
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sign Out" message:@"Do you want to sign out?"
                                                   delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Confirm", nil];
    alert.tag=999;
    [alert show];
    
    
    
    
    
    
}

@end
