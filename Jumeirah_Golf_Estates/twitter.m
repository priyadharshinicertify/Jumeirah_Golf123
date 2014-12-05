//
//  twitter.m
//  Jumeirah
//
//  Created by Veeramani on 07/07/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "twitter.h"
#import "BackgroundLayer.h"
@interface twitter ()

    {
        UIActivityIndicatorView *spinner;
        
    }


@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@end

@implementation twitter
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
    
    CAGradientLayer *btnGradient1 = [BackgroundLayer blackWhiteGradient];
    btnGradient1.frame = self.sample.bounds;
    // btnGradient.cornerRadius=5;
    //btnGradient.borderWidth=1.0;
    // btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.sample.layer insertSublayer:btnGradient1 atIndex:0];
    [self.indicator startAnimating];
    
    
    //spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    indicator.center=self.viewWeb.center;
    indicator.color=[UIColor blackColor];
    [self.view addSubview:indicator];
    // self.view.center=spinner;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        //back to the main thread for the UI call
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner startAnimating];
        });
        

    NSString *fullURL = @"https://mobile.twitter.com/@jgegolf";
        
        //https://mobile.twitter.com/@jgegolf
      //  http://mobileapp.jumeirahgolfestates.org//jumeirah//ju_virtual_tour//wp//html5//outdoor//WP_Outdoor.html
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [viewWeb loadRequest:requestObj];
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner stopAnimating];
        });
    });
    
     [self.indicator stopAnimating];
    [super viewDidLoad];
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Twitter Screen";
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [indicator startAnimating];
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [indicator stopAnimating];
    
    
    [viewWeb setHidden:FALSE];
}
@end
