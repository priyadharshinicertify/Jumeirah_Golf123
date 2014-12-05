//
//  JGEWebsite.m
//  Jumeirah
//
//  Created by Veeramani on 04/07/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "JGEWebsite.h"
#import "BackgroundLayer.h"
@interface JGEWebsite ()
{
    UIActivityIndicatorView *spinner;
}
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@end

@implementation JGEWebsite

@synthesize viewWeb,indicator;
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
    
    //self.indicator.frame = CGRectMake (300,300, 180,180);
    // self.indicator.center=self.viewWeb.center;
    indicator.center=self.viewWeb.center;
    indicator.color=[UIColor blackColor];
    [self.view addSubview:indicator];

    // self.view.center=spinner;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        //back to the main thread for the UI call
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner startAnimating];
        });
        

    NSString *fullURL = @"http://mobile.jumeirahgolfestates.org/" ;
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [viewWeb loadRequest:requestObj];
    dispatch_async(dispatch_get_main_queue(), ^{
        [spinner stopAnimating];
    });
});
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
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [spinner startAnimating];

    [indicator startAnimating];

    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [spinner stopAnimating];

    [indicator stopAnimating];
    [indicator hidesWhenStopped];

    [viewWeb setHidden:FALSE];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"JGEWebsite Screen";
}
@end
