//
//  abtjgeus.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "abtjgeus.h"

@interface abtjgeus ()

@end

@implementation abtjgeus
@synthesize scroll;
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
    
    
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];

    
    
    [super viewDidLoad];
    scroll.scrollEnabled=YES;
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
     {
    scroll.contentSize=CGSizeMake(296,1800);
     }
    else
    {
      //scroll.contentSize=CGSizeMake(scroll.frame.size.width,1200);
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        if(orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown){
            // self.view = self.potraitView;
            if(orientation ==UIInterfaceOrientationPortraitUpsideDown){
                NSLog(@"Changed Orientation To PortraitUpsideDown");
                //  [self portraitUpsideDownOrientation];
            }else{
                NSLog(@"Changed Orientation To Portrait");
                
                 scroll.contentSize=CGSizeMake(763,1200);
                
                
                             // [self portraitOrientation];
            }
        }else{
            // self.view = self.landscapeView;
            if(orientation ==UIInterfaceOrientationLandscapeLeft){
                NSLog(@"Changed Orientation To Landscape left");
                scroll.contentSize=CGSizeMake(1024,1200);
                
               // [self landscapeLeftOrientation];
            }else{
                NSLog(@"Changed Orientation To Landscape right");
                scroll.contentSize=CGSizeMake(1024,1200);
                
               // [self landscapeRightOrientation];
            }
            
        }

    }
    
    // Do any additional setup after loading the view from its nib.
    
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated
{
    scroll.scrollEnabled=YES;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        scroll.contentSize=CGSizeMake(296,1800);
    }
    else
    {
        //scroll.contentSize=CGSizeMake(scroll.frame.size.width,1200);
        UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
        if(orientation == UIInterfaceOrientationPortrait || orientation == UIInterfaceOrientationPortraitUpsideDown){
            // self.view = self.potraitView;
            if(orientation ==UIInterfaceOrientationPortraitUpsideDown){
                NSLog(@"Changed Orientation To PortraitUpsideDown");
                //  [self portraitUpsideDownOrientation];
            }else{
                NSLog(@"Changed Orientation To Portrait");
                
                scroll.contentSize=CGSizeMake(763,1200);
                
                
                // [self portraitOrientation];
            }
        }else{
            // self.view = self.landscapeView;
            if(orientation ==UIInterfaceOrientationLandscapeLeft){
                NSLog(@"Changed Orientation To Landscape left");
                scroll.contentSize=CGSizeMake(1024,1200);
                
                // [self landscapeLeftOrientation];
            }else{
                NSLog(@"Changed Orientation To Landscape right");
                scroll.contentSize=CGSizeMake(1024,1200);
                
                // [self landscapeRightOrientation];
            }
            
        }
        
    }

}
@end
