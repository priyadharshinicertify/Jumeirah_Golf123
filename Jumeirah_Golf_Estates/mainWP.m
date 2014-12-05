//
//  mainWP.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 30/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "mainWP.h"
#import "WPareaplan.h"
#import "WPoverview.h"
#import "WPGallery.h"
#import "WPVirtualtour.h"
#import "WPfirestone.h"
#import "wpcell.h"
#import "WPdoral.h"
#import "WPmuirfield.h"
#import "WPsawgrass.h"
#import "BackgroundLayer.h"
#import "WPcontempo.h"
#import "WPcontrast.h"
#import "WPtimeless.h"
#import "WPtradition.h"
#import "WPdownloads.h"
#import "UIViewController+RESideMenu.h"
@interface mainWP ()
{
    NSArray *titles;
}
@property (strong, readwrite, nonatomic)IBOutlet UITableView *tableView;

@end

@implementation mainWP

@synthesize tableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPoverview alloc] initWithNibName:@"WPoverview_iphone" bundle:nil]]animated:YES];
        }
        else
        {
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPoverview alloc] initWithNibName:@"WPoverview_ipad" bundle:nil]]animated:YES];
            
            
        }


        
           }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"MainWP Screen";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *barColour = [UIColor colorWithRed:(130/255.0) green:(201/255.0) blue:(79/255.0) alpha:1];
    [[UINavigationBar appearance] setBarTintColor: barColour];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

   
     //CAGradientLayer *btnGradient2 = [BackgroundLayer blackWhiteGradient2];
    // btnGradient2.frame = UINavigationController;
    

     
     
     
    
   /* UINavigationBar *navigationBar= [[self.navigationController.navigationBar subviews]objectAtIndex:0];
    
    
    UIView* gradientViewnavigationBar = [[UIView alloc] initWithFrame:CGRectMake(0,0,navigationBar.frame.size.width,navigationBar.frame.size.height)];
    
    
    CAGradientLayer * gradientLayernavigationBar = [BackgroundLayer blackWhiteGradientw];
    
    gradientLayernavigationBar.frame = gradientViewnavigationBar.bounds;
    //gradientLayernavigationBar.colors = [NSArray arrayWithObjects:(id)[startColornavigationBar CGColor], (id)[endColornavigationBar CGColor], nil];
    
    gradientLayernavigationBar.opacity=1.0;
    [gradientViewnavigationBar.layer insertSublayer:gradientLayernavigationBar atIndex:0];
    [navigationBar insertSubview:gradientViewnavigationBar atIndex:0];
    
    */
    
    //[self.navigationController.navigationBar.layer insertSublayer:btnGradient2 atIndex:0];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPoverview alloc] initWithNibName:@"WPoverview_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPoverview alloc] initWithNibName:@"WPoverview_ipad" bundle:nil]]animated:YES];
        
        
    }
  // [self.sideMenuViewController hideMenuViewController];

       // [self.sideMenuViewController presentLeftMenuViewController];
 
    
       
    
    //[self.sideMenuViewController presentLeftMenuViewController ];
    
    
    tableView.backgroundColor = [UIColor blackColor];
   // tableView.backgroundView = nil;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.bounces = NO;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.opaque = NO;
    //    self.tableView = ({
    //        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,200, 568) style:UITableViewStylePlain];
    //        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    //        tableView.delegate = self;
    //        tableView.dataSource = self;
    //        tableView.opaque = NO;
    //        tableView.backgroundColor = [UIColor clearColor];
    //        tableView.backgroundView = nil;
    //        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //        tableView.bounces = NO;
    //        tableView;
    //    });
    
 /*   NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mobileapp.certifytechnologies.com/jumeirah/property_showcase.php"]];
    
    // NSString *requestString = [NSString stringWithFormat:@"userid=%@",manage.appuserid,nil];
    
    NSString *requestString = [NSString stringWithFormat:@"district_id=",nil];
    
    
    NSLog(@" RequestString: %@",requestString);
    
    NSMutableData *requestData =[NSMutableData dataWithBytes:[requestString UTF8String] length: [requestString length]];
    
    [request setHTTPMethod: @"POST"];
    
    [request setHTTPBody: requestData];
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (con) {
        NSLog(@"data sent ");
    } else
    {
        NSLog(@"Not sent");
    }
    [con start];
    

    [self.view addSubview:self.tableView];*/
    }

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPoverview alloc] initWithNibName:@"WPoverview_iphone" bundle:nil]]animated:YES];
            }
                else
                {
                    [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPoverview alloc] initWithNibName:@"WPoverview_ipad" bundle:nil]]animated:YES];

                    
                }
            [self.sideMenuViewController hideMenuViewController];
            
                break;
        case 1:
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPGallery alloc] initWithNibName:@"WPGallery_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPGallery alloc]initWithNibName:@"WPGallery_ipad" bundle:nil]]animated:YES];
            }


            [self.sideMenuViewController hideMenuViewController];
            break;
        case 2:
           // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.google.com"]];
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPVirtualtour alloc] initWithNibName:@"WPVirtualtour_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPVirtualtour alloc]initWithNibName:@"WPVirtualtour" bundle:nil]]animated:YES];
            }
            
            
            [self.sideMenuViewController hideMenuViewController];
            break;

        case 3:
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPfloorplan alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
            break;
       // case 4:
            
         /*   if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPareaplan alloc] initWithNibName:@"WPareaplan_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPareaplan alloc]initWithNibName:@"WPareaplan" bundle:nil]]animated:YES];
                
            }
            
            
            [self.sideMenuViewController hideMenuViewController];*/
            break;

            
            
            
            
            
            
            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPareaplan alloc] init]]animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;
        case 4:
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPdoral alloc] initWithNibName:@"WPdoral_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPdoral alloc]initWithNibName:@"WPdoral_ipad" bundle:nil]]animated:YES];
            }
            
            
            [self.sideMenuViewController hideMenuViewController];
            break;
            
            
            
            
            
            
            
            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPdoral alloc] init]]animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;

        case 5:
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPfirestone alloc] initWithNibName:@"WPfirestone_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPfirestone alloc]initWithNibName:@"WPfirestone_ipad" bundle:nil]]animated:YES];
            }
            
            
            [self.sideMenuViewController hideMenuViewController];
            break;
            
            
            
            
            
            
            
            
            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPfirestone alloc] init]]animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;
        case 6:
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPmuirfield alloc] initWithNibName:@"WPmuirfield_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPmuirfield alloc]initWithNibName:@"WPmuirfield_ipad" bundle:nil]]animated:YES];
            }
            
            
            [self.sideMenuViewController hideMenuViewController];
            break;

            
            
            
            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPmuirfield alloc] init]]animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;
        case 7:
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPsawgrass alloc] initWithNibName:@"WPsawgrass_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPsawgrass alloc]initWithNibName:@"WPsawgrass_ipad" bundle:nil]]animated:YES];
            }
            
            
            [self.sideMenuViewController hideMenuViewController];
            break;

            
            
//            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPsawgrass alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;

        case 8:
            
           
            
            
            
            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPinteriorthemes alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
            break;

        case 9:
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPcontempo alloc] initWithNibName:@"WPcontempo_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPcontempo alloc]initWithNibName:@"WPcontempo_ipad" bundle:nil]]animated:YES];
            }
            
            
            [self.sideMenuViewController hideMenuViewController];
            break;

            
            
            
            
            
            
            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPcontempo alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;

        case 10:
            
       if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPcontrast alloc] initWithNibName:@"WPcontrast_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPcontrast alloc]initWithNibName:@"WPcontrast_ipad" bundle:nil]]animated:YES];
            }
            
            
            [self.sideMenuViewController hideMenuViewController];            break;

            
            
            
            
            
//            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPcontrast alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;
//
        case 11:
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPtimeless alloc] initWithNibName:@"WPtimeless_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPtimeless alloc]initWithNibName:@"WPtimeless_ipad" bundle:nil]]animated:YES];
            }
            
            
            [self.sideMenuViewController hideMenuViewController];
            break;

            
            
            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPtimeless alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;

        case 12:
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPtradition alloc] initWithNibName:@"WPtradition_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPtradition alloc]initWithNibName:@"WPtradition_ipad" bundle:nil]]animated:YES];
            }
            
            
            [self.sideMenuViewController hideMenuViewController];
            break;

            
            
            
            
            
            
            
//            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPtradition alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;

        case 13:
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPdownloads alloc] initWithNibName:@"WPdownloads_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPdownloads alloc]initWithNibName:@"WPdownloads_ipad" bundle:nil]]animated:YES];
            }
            
            
            [self.sideMenuViewController hideMenuViewController];
            break;

            
            
            
            
            
            
            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPdownloads alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;
//
       
        default:
            break;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   //self.tableView.backgroundColor=[UIColor blackColor];
    
    
    /*

     NSString *str=@"cell";
     
     newscell *cell=[self.tblvie dequeueReusableCellWithIdentifier:str];
     
     
     NSArray *objects;
     if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
     {
     objects = [[NSBundle mainBundle] loadNibNamed:@"CustomCell-iPad" owner:self options:nil];
     }
     else {
     objects = [[NSBundle mainBundle] loadNibNamed:@"CustomCell-iPhone" owner:self options:nil];
     }
     
     
    
    
    
    
    
    if (cell==nil)
    {
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
        {
            
            NSArray *arr1=[[NSBundle mainBundle]loadNibNamed:@"newscell" owner:nil options:nil ];
            for(UIView *vie in arr1)
            {
                if([vie isKindOfClass:[UITableViewCell class]])
                {
                    cell=(newscell*)vie;
                }
            }
        }

    
    
    
    */
    
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

    
    
  /*  NSString *str=@"cell";
    
    wpcell *cell=[self.tableView dequeueReusableCellWithIdentifier:str];

    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:16];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    */
    titles = @[ @"Overview", @"Gallery", @"Virtual Tour", @"Floor Plan",@"      Doral",@"      Fire Stone",@"      Muirfield",@"      Sawgrass",@"Interior Themes",@"      Contempo",@"      Contrast",@"      Timeless",@"      Tradition",@"Downloads",];
    cell.lbla.text = titles[indexPath.row];
    
    
    
    
    /*
     UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3,2, 20, 25)];
     imv.image=[UIImage imageNamed:@"user.jpg"];
     [cell.contentView addSubview:imv];
     
     */
    if(indexPath.row==0)
        
    {
       // cell.imageView=CGRectMake(0, 0, 10, 10)
     //  UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 30, 35)];
         cell.imgv.image = [UIImage imageNamed:@"reside_overview_icon.png"];
         //[cell.contentView addSubview:imv];

        
    }
    
    
    if(indexPath.row==1)
        
    {
        //UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(0,0, 40, 45)];
         cell.imgv.image = [UIImage imageNamed:@"reside_gallery_icon.png"];
       // [cell.contentView addSubview:imv];
        
        
      /*  cell.imageView.frame =CGRectMake(0,0, 30, 35)];
        UIImage* theImage = [UIImage imageNamed:@"reside_gallery_icon.png"];
        cell.imageView.image=theImage;*/
        
        
    }
    if(indexPath.row==2)
        
    {
        
 cell.imgv.image  = [UIImage imageNamed:@"reside_video_icon.gif"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==3)
        
    {
        
         cell.imgv.image = [UIImage imageNamed:@"reside_floorplan_icon.png"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==4)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    
    if(indexPath.row==5)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==6)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==7)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    
    if(indexPath.row==8)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"reside_interior_icon.png"];
       // cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==9)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==10)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==11)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==12)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==13)
        
    {
        
         cell.imgv.image= [UIImage imageNamed:@"reside_download_icon.png"];
        //cell.imageView.image=theImage;
        
        
    }


        
    return cell;
}


#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 14;
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
