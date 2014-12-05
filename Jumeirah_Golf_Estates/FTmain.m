//
//  FTmain.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "FTmain.h"
#import "FToverview.h"
#import "FTvirtualtour.h"
#import "FTareaplan.h"
#import "FTaugusta.h"
#import "FTcarnousite.h"
#import "FTinverness.h"
#import "FToakmont.h"
#import "FTpinehurst.h"
#import "FTturnberry.h"
#import "FTcontempo.h"
#import "FTcontrast.h"
#import "FTelegance.h"
#import "FTtimeless.h"
#import "FTtradition.h"
#import "FTtuscan.h"
#import "FTdownloads.h"
#import "wpcell.h"
@interface FTmain ()
{
    NSArray *titles;
}
@property (strong, readwrite, nonatomic)IBOutlet UITableView *tableView;

@end

@implementation FTmain

@synthesize tableView;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
  
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIColor *barColour = [UIColor colorWithRed:(255/255.0) green:(167/255.0) blue:(18/255.0) alpha:1];
    [[UINavigationBar appearance] setBarTintColor: barColour];
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FToverview alloc] initWithNibName:@"WPoverview_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FToverview alloc] initWithNibName:@"WPoverview_ipad" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];

    
    tableView.backgroundColor = [UIColor clearColor];
    tableView.backgroundView = nil;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.bounces = NO;
    
    
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
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/property_showcase2.php"]];
    
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
    
    
    [self.view addSubview:self.tableView];
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
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FToverview alloc] initWithNibName:@"FToverview_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FToverview alloc] initWithNibName:@"FToverview_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            
            break;

            
        case 1:
//            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
//            {
//                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTGallery alloc] initWithNibName:@"FTGallery_iphone" bundle:nil]]animated:YES];
//            }
//            else
//            {
//                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTGallery alloc]initWithNibName:@"FTGallery_ipad" bundle:nil]]animated:YES];
//            }
//            
//
            
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTGallery alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            

           // [self.sideMenuViewController hideMenuViewController];
            
            break;

            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FToverview alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;
        case 2:
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTvirtualtour alloc] initWithNibName:@"FTvirtualtour_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTvirtualtour alloc] initWithNibName:@"FTvirtualtour_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            

            //[self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTvirtualtour alloc] init]]
                                                        // animated:YES];
            //[self.sideMenuViewController hideMenuViewController];
            break;
        case 3:
            //            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPVirtualtour alloc] init]]
            //                                                         animated:YES];
            //            [self.sideMenuViewController hideMenuViewController];
            break;
           
     /*   case 3:
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTareaplan alloc] initWithNibName:@"FTareaplan_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTareaplan alloc] initWithNibName:@"FTareaplan_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            //            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WPfloorplan alloc] init]]
            //                                                         animated:YES];
            //            [self.sideMenuViewController hideMenuViewController];
            break;*/
        case 4:
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTaugusta alloc] initWithNibName:@"FTaugusta_iphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTaugusta alloc] initWithNibName:@"FTaugusta_ipad" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];

            
            
            // [self.sideMenuViewController hideMenuViewController];
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[ alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
            break;
            
       

            
            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTareaplan alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
           // break;
            
        case 5:
            
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTcarnousite alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            
            
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTaugusta alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
            break;
        case 6:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTinverness alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 7:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FToakmont alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            

           //pinehurst
        case 8:
           [ self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTpinehurst alloc] init]]
        animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            
            
        case 9:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTturnberry alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTpinehurst alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
       
            
        case 10:
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTturnberry alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;
            
            
            //contempo
        case 11:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTcontempo alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTI alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
            break;
            
        case 12:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTcontrast alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            
//        case 13:
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTcontrast alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
//            break;
        case 13:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTelegance alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 14:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTtimeless alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;

        case 15:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTtradition alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            
        case 16:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTtuscan alloc] init]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            

       case 17:
            
            
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTdownloads alloc] initWithNibName:@"FTdownloadsIphone" bundle:nil]]animated:YES];
            }
            else
            {
                [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTdownloads alloc] initWithNibName:@"FTdownloads" bundle:nil]]animated:YES];
                
                
            }
            [self.sideMenuViewController hideMenuViewController];
            
//
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[FTdownloads alloc] init]]
//                                                         animated:YES];
//            [self.sideMenuViewController hideMenuViewController];
            break;

        default:
            break;
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
    
    titles = @[ @"Overview",@"Gallery", @"Virtual Tour", @"Floor Plan",@"      Augusta",@"      Carnoustie",@"      Inverness",@"      Oakmont",@"      Pinehurst",@"      Turnberry",@"Interior Themes",@"      Contempo",@"      Contrast",@"      Elegance",@"      Timeless",@"      Tradition",@"      Tuscan",@"Downloads"];
    cell.lbla.text = titles[indexPath.row];
    
    if(indexPath.row==0)
        
    {
        
      cell.imgv.image = [UIImage imageNamed:@"reside_overview_icon.png"];
     //   cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==1)
        
    {
        cell.imgv.image = [UIImage imageNamed:@"reside_gallery_icon.png"];

//        UIImage* theImage = [UIImage imageNamed:@"reside_gallery_icon.png"];
//        cell.imageView.image=theImage;
//        
        
    }
    if(indexPath.row==2)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"reside_video_icon.gif"];
       // cell.imageView.image=theImage;
        
        
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
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==9)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==10)
        
    {
        
       cell.imgv.image= [UIImage imageNamed:@"reside_interior_icon.png"];
       // cell.imageView.image=theImage;
        
        
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
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==14)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==15)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==16)
        
    {
        
        cell.imgv.image = [UIImage imageNamed:@"Black.jpg"];
        //cell.imageView.image=theImage;
        
        
    }
    if(indexPath.row==17)
        
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
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 18;
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
