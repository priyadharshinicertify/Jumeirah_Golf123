//
//  MainWT.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 30/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "MainWT.h"
#import "WFoverview.h"
#import "WFareaplan.h"
#import "RESideMenu.h"
#import "wpcell.h"
#import "UIViewController+RESideMenu.h"
@interface MainWT ()
{
    NSArray *titles;
}
@property (strong, readwrite, nonatomic)IBOutlet UITableView *tableView;
@end

@implementation MainWT
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
    NSLog(@"helooo");
    [super viewDidLoad];
   // UIColor *barColour = [UIColor colorWithRed:(162/255.0) green:(97/255.0) blue:(149/255.0) alpha:1];
    [[UINavigationBar appearance] setBarTintColor: [UIColor colorWithRed:(50/255.0) green:(167/255.0) blue:(214/255.0) alpha:1]];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WFoverview alloc] initWithNibName:@"WFoverview_iphone" bundle:nil]]animated:YES];
    }
    else
    {
        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WFoverview alloc] initWithNibName:@"WFoverview_ipad" bundle:nil]]animated:YES];
        
        
    }
    [self.sideMenuViewController hideMenuViewController];
    
    tableView.backgroundColor = [UIColor clearColor];
    tableView.backgroundView = nil;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.bounces = NO;
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
                        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WFoverview alloc] initWithNibName:@"WFoverview_iphone" bundle:nil]]animated:YES];
                    }
                    else
                    {
                        [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[[WFoverview alloc] initWithNibName:@"WFoverview_ipad" bundle:nil]]animated:YES];
                        
                        
                    }
                    [self.sideMenuViewController hideMenuViewController];
                    
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
    
    titles = @[ @"Overview"];
    cell.lbla.text = titles[indexPath.row];
    
    if(indexPath.row==0)
        
    {
        
        cell.imgv.image= [UIImage imageNamed:@"reside_overview_icon.png"];
       // cell.imageView.image=theImage;
        
        
    }
  /*  if(indexPath.row==1)
        
    {
        
        UIImage* theImage = [UIImage imageNamed:@"reside_gallery_icon.png"];
        cell.imageView.image=theImage;
        
        
    }
   if(indexPath.row==2)
        
    {
        
        UIImage* theImage = [UIImage imageNamed:@"reside_video_icon.gif"];
        cell.imageView.image=theImage;
        
        
    }*/
    if(indexPath.row==1)
        
    {
        
         cell.imgv.image = [UIImage imageNamed:@"reside_floorplan_icon.png"];
        //cell.imageView.image=theImage;
        
        
    }
  /*  if(indexPath.row==9)
        
    {
        
        UIImage* theImage = [UIImage imageNamed:@"reside_interior_icon.png"];
        cell.imageView.image=theImage;
        
        
    }
    
    if(indexPath.row==14)
        
    {
        
        UIImage* theImage = [UIImage imageNamed:@"reside_download_icon.png"];
        cell.imageView.image=theImage;
        
        
    }*/
    
    

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
    return 1;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"MainWT Screen";
}

@end
