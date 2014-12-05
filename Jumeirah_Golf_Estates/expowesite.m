//
//  expowesite.m
//  Jumeirah
//
//  Created by Veeramani on 08/07/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "expowesite.h"
#import "expo2020.h"
#import "BackgroundLayer.h"
@interface expowesite ()
@property (nonatomic) float rating;
@end

@implementation expowesite
@synthesize indicator,viewWeb;
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
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    
    self.indicator.frame = CGRectMake (300,300, 180,180);
    self.indicator.center=self.viewWeb.center;
    [self.indicator startAnimating];
    NSString *fullURL = @"http://expo2020dubai.ae/en/";
   // viewWeb.delegate = self;
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
  
    
    [viewWeb loadRequest:requestObj];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"expowesite Screen";
}
-(IBAction)home:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [indicator startAnimating];
    [indicator setHidden:FALSE];
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [indicator stopAnimating];
    [viewWeb setHidden:FALSE];
}
@end
