//
//  ViewController.m
//  Jumeirah
//
//  Created by $ h i v a on 03/05/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "ViewController.h"
#import "LoginViewController.h"
#import "BackgroundLayer.h"


#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
{
    NSArray *viewArray;
    UIView *subview;
}
@end

@implementation ViewController
@synthesize theScrollview,view1,view2,thepagecontrol,view3,view4,lft,rft;
@synthesize login_Button,guest_Button,sign_up,legand,legand1,legand2,legand3,legand4;

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    [lft setEnabled:NO];
     [self fontstyle];
  }

#pragma mark - fontstyle for labels and buttons

-(void)fontstyle
{
    
    self.theScrollview.delegate=self;
    theScrollview.tag=1;
    [thepagecontrol setTag:12];
    thepagecontrol.numberOfPages=4;
   viewArray=@[view1,view2,view3,view4];
    for (int i=0; i<viewArray.count; i++) {
        CGRect frame;
        frame.origin.x=self.theScrollview.frame.size.width*i;
        frame.origin.y=0;
        frame.size=self.theScrollview.frame.size;
         subview=[[UIView alloc] initWithFrame:frame];
        [subview addSubview:viewArray[i]];
        [self.theScrollview addSubview:subview];
        
        
    }
    
    self.theScrollview.contentSize=CGSizeMake(self.theScrollview.frame.size.width*viewArray.count, self.theScrollview.frame.size.height);
}
# pragma  scrollview for sliding

-(void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth=self.theScrollview.frame.size.width;
    
    int page=floor((self.theScrollview.contentOffset.x-pageWidth/2)/pageWidth)+1;
    self.thepagecontrol.currentPage=page;
   // NSLog(@"%d",page);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    self.screenName=@"main Screen";
    
    self.navigationController.navigationBarHidden = YES;
 
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.login_Button.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    
    [self.login_Button.layer insertSublayer:btnGradient atIndex:0];
    
    login_Button.layer.cornerRadius=6.0f;
    
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.guest_Button.bounds;
    btnGradient1.cornerRadius=5;
    btnGradient1.borderWidth=1.0;
    btnGradient1.borderColor=([UIColor whiteColor]).CGColor;
    [self.guest_Button.layer insertSublayer:btnGradient1 atIndex:0];
      guest_Button.layer.cornerRadius=6.0f;
   
    
    [super viewWillAppear:animated];
    
}
- (void) viewWillDisappear:(BOOL)animated
{
   
    [super viewWillDisappear:animated];
}

# pragma login action

-(IBAction)LoginBtn:(id)sender
{
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
 }
# pragma guest login action


-(IBAction)GuestLoginBtn:(id)sender
{
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

- (IBAction)signup:(id)sender {
    
    [[[UIAlertView alloc]initWithTitle:nil message:@"Coming Soon!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show ];

   }
-(IBAction)btnleft:(id)sender
{
    UIScrollView *scrMain = (UIScrollView*) [self.view viewWithTag:1];
    // same way, access pagecontroll access
    UIPageControl *pgCtr = (UIPageControl*) [self.view viewWithTag:12];
    // get the current offset ( which page is being displayed )
    CGFloat contentOffset = scrMain.contentOffset.x;
    // calculate next page to display
    int nextPage = (int)(contentOffset/scrMain.frame.size.width) - 1 ;
    // if page is not 10, display it
    if( nextPage!=10 )  {
        [scrMain scrollRectToVisible:CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=nextPage;
        if (nextPage==0) {
          
            [lft setEnabled:NO];
            [rft setEnabled:YES];
            
            
        }
        if (nextPage==1) {
           
            [rft setEnabled:YES];
            [lft setEnabled:YES];
        }
        if (nextPage==2) {
            [rft setEnabled:YES];
            [lft setEnabled:YES];
            lft.hidden=NO;
            
        }
        if(nextPage==3)
        {
            //[rft setEnabled:YES];
            [rft setEnabled:YES];
            [lft setEnabled:NO];
           
        }
        
        
        // else start sliding form 1 :)
    } else {
        [scrMain scrollRectToVisible:CGRectMake(0, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=0;
    }
    

    
}
-(IBAction)btnright:(id)sender
{
    UIScrollView *scrMain = (UIScrollView*) [self.view viewWithTag:1];
    // same way, access pagecontroll access
    UIPageControl *pgCtr = (UIPageControl*) [self.view viewWithTag:12];
    // get the current offset ( which page is being displayed )
    CGFloat contentOffset = scrMain.contentOffset.x;
    // calculate next page to display
    int nextPage = (int)(contentOffset/scrMain.frame.size.width) + 1 ;
    
    NSLog(@"page==%d",nextPage);
    
    // if page is not 10, display it
    if( nextPage!=4 )  {
        // [rft setEnabled:YES];
        [scrMain scrollRectToVisible:CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height) animated:YES];
        pgCtr.currentPage=nextPage;
    }
    if (nextPage==0) {
        
        [rft setEnabled:YES];
        [lft setEnabled:NO];
        
    }
    if (nextPage==1) {
        
        [rft setEnabled:YES];
        [lft setEnabled:YES];
    }
    if (nextPage==2) {
        [rft setEnabled:YES];
        [lft setEnabled:YES];
        
    }
    if(nextPage==3)
    {
        //[rft setEnabled:YES];
        [rft setEnabled:NO];
               [lft setEnabled:YES];
    }
      
}
    
    
    
    
 


@end
