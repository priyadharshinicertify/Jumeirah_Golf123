//
//  facebook.m
//  Jumeirah
//
//  Created by Veeramani on 04/07/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "facebook.h"
#import "BackgroundLayer.h"

@interface facebook ()
{
    UIActivityIndicatorView *spinner;

}
//@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end

@implementation facebook
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

    indicator.center=self.viewWeb.center;
    indicator.color=[UIColor blackColor];
    [self.view addSubview:indicator];
    // self.view.center=spinner;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        //back to the main thread for the UI call
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner startAnimating];
        });
        
        
    NSString *fullURL = @"https://m.facebook.com/pages/Jumeirah-Golf-Estates/131022593605993";
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
//    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    spinner.center=self.viewWeb.center;
//    spinner.color=[UIColor blackColor];
//    [self.viewWeb addSubview:spinner];
   [indicator startAnimating];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Facebook Screen";
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [indicator stopAnimating];
    
    
    
       [viewWeb setHidden:FALSE];
}

@end
