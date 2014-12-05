//
//  DEMOLeftMenuViewController.m
//  Jumeirah
//
//  Created by Veeramani on 11/07/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "DEMOLeftMenuViewController.h"
#import "Ovierview1.h"
#import "Gallery.h"
#import "FSvirtualtour.h"
#import "STCollapseTableView.h"
#import "FSareaplan.h"
#import "FSaberdeen.h"
#import "FSashburn.h"
#import "anenuemap.h"
#import "FSexterior.h"
#import "FSparkfp.h"
#import "FSparkspec.h"
#import "FSparkmap.h"

#import "FSblack.h"
#import "FScape.h"
#import "FScounty.h"
#import "FSjersey.h"
#import "FSmelbourne.h"
#import "FSmougins.h"
#import "FSontario.h"
#import "FSsydney.h"
#import "FStroon.h"
#import "wpcell.h"

@interface DEMOLeftMenuViewController ()
{
    NSArray *titles;
}
@property (retain,nonatomic)IBOutlet UITableView *tableView;

@end

@implementation DEMOLeftMenuViewController
@synthesize tableView;
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
       sectionContentDict  = [[NSMutableDictionary alloc] init];
    sectionTitleArray=[[NSMutableArray alloc] init];
    
    UIColor *barColour = [UIColor colorWithRed:(198/255.0) green:(32/255.0) blue:(26/255.0) alpha:1];
    [[UINavigationBar appearance] setBarTintColor: barColour];

    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[Ovierview1 alloc] initWithNibName:@"Ovierview1_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[Ovierview1 alloc] initWithNibName:@"Ovierview1_ipad" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];
    
    
    titles = @[ @"Overview", @"Gallery", @"Virtual Tour", @"Redwood Avenue",@"    Floor Paln",@"    Map",@"Redwood Park",@"    Exterior",@"    Interior",@"    Floor Plan",@"    Map",@"    Specification",@"Downloads "];
    
        tableView.backgroundColor = [UIColor clearColor];
         tableView.backgroundView = nil;
           tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
           tableView.bounces = NO;

 
    array4= [NSMutableArray arrayWithObjects:@"    Aberdeen",@"    Ashburn",@"    Blackheath",@"    Cape",@"    Country Down",@"    Jersey",@"    Melbourne",@"    Mougins",@"    Ontario",@"    Sydney",@"    Troon",nil];
   // [sectionContentDict setValue:array4 forKey:sectionTitleArray[0]];
    
    
    array5=[NSMutableArray arrayWithObjects:@"3 Bedrooms",@"4 Bedrooms", nil];
    
    
    NSLog(@"array.....%@",array5);
    
    
    
    
    
    [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark UITableView Delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView              = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    headerView.tag                  = section;
    headerView.backgroundColor      = [UIColor blackColor];
    UILabel *headerString           = [[UILabel alloc] initWithFrame:CGRectMake(40, 0, self.view.frame.size.width-20-50-20, 50)];
    
    
            UILabel *ll=[[UILabel alloc] initWithFrame:CGRectMake(0, headerView.frame.size.height-1, 300, 1)];
            ll.backgroundColor=[UIColor blackColor];
            [headerView addSubview:ll];
            
            headerString.text=titles[section];
            headerString.textAlignment      = NSTextAlignmentLeft;
            headerString.textColor          = [UIColor whiteColor];
            headerView.backgroundColor      = [UIColor blackColor];
            [headerView addSubview:headerString];
    
    
    
     if(section==0)
     
     {
         UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 25, 25)];
         imgView.contentMode = UIViewContentModeScaleAspectFit;
         imgView.image = [UIImage imageNamed:@"reside_overview_icon.png"];
         
         [headerView addSubview:imgView];
         
         UITapGestureRecognizer  *headerTapped1   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped1:)];
         [headerView addGestureRecognizer:headerTapped1];
         
         
          }
    else if(section==1)
     
     {
         UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10,10, 20, 20)];
         imgView.contentMode = UIViewContentModeScaleAspectFit;
         imgView.image =[UIImage imageNamed:@"reside_gallery_icon.png"];
         
         [headerView addSubview:imgView];
         UITapGestureRecognizer  *headerTapped2   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped2:)];
         [headerView addGestureRecognizer:headerTapped2];
         

         

     //cell.imgv.image =
     //cell.imageView.image=theImage;
     
     
     }
    else if(section==2)
     
     {
         UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
         imgView.contentMode = UIViewContentModeScaleAspectFit;
         imgView.image =[UIImage imageNamed:@"reside_video_icon.gif"];
         
         [headerView addSubview:imgView];
         UITapGestureRecognizer  *headerTapped3   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped3:)];
         [headerView addGestureRecognizer:headerTapped3];

     //cell.imgv.image=
     // cell.imageView.image=theImage;
     
     
     }
    else if(section==3)
     
     {
         UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
         imgView.contentMode = UIViewContentModeScaleAspectFit;
         imgView.image =[UIImage imageNamed:@"reside_floorplan_icon.png"];
         
         [headerView addSubview:imgView];

    // cell.imgv.image =
     //cell.imageView.image=theImage;
     
     
     }
    else if(section==5){
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image =[UIImage imageNamed:@"Black.jpg"];
        
        [headerView addSubview:imgView];
        UITapGestureRecognizer  *headerTapped4   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped4:)];
        [headerView addGestureRecognizer:headerTapped4];
    }

    else if(section==6)

{
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    imgView.contentMode = UIViewContentModeScaleAspectFit;
    imgView.image =[UIImage imageNamed:@"park.png"];
    
    [headerView addSubview:imgView];
    
    // cell.imgv.image =
    //cell.imageView.image=theImage;
    
    
}
    else if(section==7){
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image =[UIImage imageNamed:@"Black.jpg"];
        
        [headerView addSubview:imgView];
        UITapGestureRecognizer  *headerTapped5   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped5:)];
        [headerView addGestureRecognizer:headerTapped5];
    }
    else if(section==9){
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image =[UIImage imageNamed:@"Black.jpg"];
        
        [headerView addSubview:imgView];
        UITapGestureRecognizer  *headerTapped6   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped6:)];
        [headerView addGestureRecognizer:headerTapped6];
    }
    else if(section==10){
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image =[UIImage imageNamed:@"Black.jpg"];
        
        [headerView addSubview:imgView];
        UITapGestureRecognizer  *headerTapped7   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped7:)];
        [headerView addGestureRecognizer:headerTapped7];
    }
    else if(section==11){
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image =[UIImage imageNamed:@"Black.jpg"];
        
        [headerView addSubview:imgView];
        UITapGestureRecognizer  *headerTapped8   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped8:)];
        [headerView addGestureRecognizer:headerTapped8];
    }
    else if(section==12){
        
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image =[UIImage imageNamed:@"reside_download_icon.png"];
        
        [headerView addSubview:imgView];
        UITapGestureRecognizer  *headerTapped9   = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sectionHeaderTapped9:)];
        [headerView addGestureRecognizer:headerTapped9];
    }


     else
     {
         UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
         imgView.contentMode = UIViewContentModeScaleAspectFit;
         imgView.image =[UIImage imageNamed:@"Black.jpg"];
         
         [headerView addSubview:imgView];
    // cell.imgv.image =
     //cell.imageView.image=theImage;
     
     
     }
    
    /* if(indexPath.row==9)
     
     {
     
     UIImage* theImage = [UIImage imageNamed:@"reside_interior_icon.png"];
     cell.imageView.image=theImage;
     
     
     }*/

    
    
    if (section ==4) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 15, 20, 20)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image =[UIImage imageNamed:@"newplus.png"];
        
        [headerView addSubview:imgView];

    }
    if (section ==8) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 15, 20, 20)];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.image =[UIImage imageNamed:@"newplus.png"];
        
        [headerView addSubview:imgView];

        
    }
                       return headerView;
}


- (void)sectionHeaderTapped1:(UITapGestureRecognizer *)gestureRecognizer
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[Ovierview1 alloc] initWithNibName:@"Ovierview1_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[Ovierview1 alloc] initWithNibName:@"Ovierview1_ipad" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];
}

- (void)sectionHeaderTapped2:(UITapGestureRecognizer *)gestureRecognizer
{
    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[Gallery alloc] init]]
                                                 animated:YES];
    [self.sideMenuViewController hideMenuViewController];
   
    
    
    
    
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//    {
//        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[Gallery alloc] initWithNibName:@"Gallery" bundle:nil]]animated:YES];
//    }
//    else
//    {
//        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[Gallery alloc] initWithNibName:@"Gallery" bundle:nil]]animated:YES];
//        
//        
//    }
   // [self.sideMenuViewController hideMenuViewController];

}

- (void)sectionHeaderTapped3:(UITapGestureRecognizer *)gestureRecognizer
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSvirtualtour alloc] initWithNibName:@"FSvirtualtour" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSvirtualtour alloc] initWithNibName:@"FSvirtualtour_ipad" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];
    
}

- (void)sectionHeaderTapped4:(UITapGestureRecognizer *)gestureRecognizer
{
    //Map  anenuemap
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[anenuemap alloc] initWithNibName:@"anenuemap_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[anenuemap alloc] initWithNibName:@"anenuemap" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];
    

    
   }

- (void)sectionHeaderTapped5:(UITapGestureRecognizer *)gestureRecognizer
{
    //Exterior
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSexterior alloc] initWithNibName:@"FSexterior_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSexterior alloc] initWithNibName:@"FSexterior_ipad" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];

}

- (void)sectionHeaderTapped6:(UITapGestureRecognizer *)gestureRecognizer
{
    
    //Floor Plan FSparkfp
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSparkfp alloc] initWithNibName:@"FSparkfp_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSparkfp alloc] initWithNibName:@"FSparkfp" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];
}


- (void)sectionHeaderTapped7:(UITapGestureRecognizer *)gestureRecognizer
{
    
    //Secon Map FSparkmap
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSparkmap alloc] initWithNibName:@"FSparkmap_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSparkmap alloc] initWithNibName:@"FSparkmap" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];
    
}

- (void)sectionHeaderTapped8:(UITapGestureRecognizer *)gestureRecognizer
{
    
    //Specification 
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSparkspec alloc] initWithNibName:@"FSparkspec_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSparkspec alloc] initWithNibName:@"FSparkspec" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];
    

    
    
}

- (void)sectionHeaderTapped9:(UITapGestureRecognizer *)gestureRecognizer
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSdownloads alloc] initWithNibName:@"FSdownloads_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSdownloads alloc] initWithNibName:@"FSdownloads" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];
    

    }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
  
    
    if (indexPath.section==4) {
        if (indexPath.row==0) {
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSaberdeen alloc] initWithNibName:@"FSaberdeen_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSaberdeen alloc] initWithNibName:@"FSaberdeen_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];

        }
        if (indexPath.row==1) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSashburn alloc] initWithNibName:@"FSashburn_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSashburn alloc] initWithNibName:@"FSashburn_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            

        }
        if (indexPath.row==2) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSblack alloc] initWithNibName:@"FSblack_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSblack alloc] initWithNibName:@"FSblack_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            

        }
        if (indexPath.row==3) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FScape alloc] initWithNibName:@"FScape_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FScape alloc] initWithNibName:@"FScape_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            

        }
        if (indexPath.row==4) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FScounty alloc] initWithNibName:@"FScounty_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FScounty alloc] initWithNibName:@"FScounty_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            

        }
        if (indexPath.row==5) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSjersey alloc] initWithNibName:@"FSjersey_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSjersey alloc] initWithNibName:@"FSjersey_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];

        }
        if (indexPath.row==6) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSmelbourne alloc] initWithNibName:@"FSmelbourne_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSmelbourne alloc] initWithNibName:@"FSmelbourne_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            

        }
        if (indexPath.row==7) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSmougins alloc] initWithNibName:@"FSmougins_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSmougins alloc] initWithNibName:@"FSmougins_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            

        }
        if (indexPath.row==8) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSontario alloc] initWithNibName:@"FSontario_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSontario alloc] initWithNibName:@"FSontario_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            

        }
        
        
        if (indexPath.row==9) {
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSsydney alloc] initWithNibName:@"FSsydney_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSsydney alloc] initWithNibName:@"FSsydney_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];

        }
        
        
        if (indexPath.row==10) {
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FStroon alloc] initWithNibName:@"FStroon_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FStroon alloc] initWithNibName:@"FStroon_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            

            
        }
    }
    if (indexPath.section==8) {
        if (indexPath.row==0) {
            
            //3bedrooms  3bedrooms
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSthreebed alloc] initWithNibName:@"FSthreebed_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSthreebed alloc] initWithNibName:@"FSthreebed_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            

            
            
            
        }
        if (indexPath.row==1) {
            
            //4 bedrooms
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSfourbed alloc] initWithNibName:@"FSfourbed_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FSfourbed alloc] initWithNibName:@"FSfourbed_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            
            
            

            
        }
    }
    
            
      
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str=@"cell";
    
    wpcell *cell=[self.tableView dequeueReusableCellWithIdentifier:str];
    
    
    if (cell==nil)
    {
        
        NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"wpcell" owner:nil options:nil ];
        for(UIView *vie in arr1)
        {
            if([vie isKindOfClass:[UITableViewCell class]])
            {
                cell=(wpcell*)vie;
                cell.backgroundColor = [UIColor clearColor];
                cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
                cell.lbla.textColor = [UIColor whiteColor];
                cell.lbla.highlightedTextColor = [UIColor lightGrayColor];
                cell.selectedBackgroundView = [[UIView alloc] init];
                
            }
        }
    }
    
    
    if (indexPath.section==4) {
        
        cell.lbla.text= array4[indexPath.row];
    }
    if (indexPath.section==8) {
        
        cell.lbla.text= array5[indexPath.row];
    }

   

    return cell;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Demo LeftMenu Screen";
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [titles count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
   // NSInteger *aa;
    
    if (sectionIndex == 4) {
        NSLog(@"arr....%lu",(unsigned long)[array4 count]);
        return [array4 count];

    }
    if (sectionIndex == 8) {
        NSLog(@"arr....%lu",(unsigned long)[array5 count]);
        return [array5 count];
        
    }
        
    
     return 0;
  
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)dist:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
