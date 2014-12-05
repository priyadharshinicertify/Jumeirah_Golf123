//
//  webEservices.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 24/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "webEservices.h"
#import "BackgroundLayer.h"
@interface webEservices ()
{
   UIActivityIndicatorView *spinner;  
}
-(IBAction)back:(id)sender;
@end

@implementation webEservices
@synthesize web;
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
    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinner.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    spinner.color=[UIColor blackColor];
    [self.view addSubview:spinner];
    // self.view.center=spinner;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        //back to the main thread for the UI call
        dispatch_async(dispatch_get_main_queue(), ^{
            [spinner startAnimating];
        });
        
        

    manage=[singleton share];
    NSString *ImageURL= manage.services_url;
    // NSData *urldata = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
    NSURL *targetURL = [NSURL URLWithString:ImageURL];
   // NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        
        
        
        //[web loadRequest:requestObj];
        self.web .scalesPageToFit = YES;
        self.web .autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        self.web .delegate= self;
        NSError *error;
        
        /**
         *  GET the data from a url link
         */
        NSData *data = [NSData dataWithContentsOfURL:targetURL
                                             options:NSDataReadingUncached
                                               error:&error];
        
        if (error) { // validation
            NSLog(@"data error: %@", error);
            
        }
        
              /**
         *  Load the request fro mthe binaray data
         */
          dispatch_async(dispatch_get_main_queue(), ^{
        
        [web loadData:data
                 MIMEType:@"application/pdf"
         textEncodingName:@"utf-8"
                  baseURL:[NSURL URLWithString:@"http://example.com/"]];
        
     
        
        
        
        
        
        
        
   // [web loadRequest:request];
      
            [spinner stopAnimating];
        });
    });

  //  web.scrollView.bounces = NO;
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
       spinner.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    self.screenName = @"WebEservices Screen";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)back:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
       
}
-(void)viewDidLayoutSubviews
{
       spinner.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
}
-(IBAction)mailing:(id)sender
{
    NSString *emailTitle = @"Attached document";
    NSString *messageBody = @"Hey, check this out!";
    // NSArray *toRecipents = [NSArray arrayWithObject:@"support@appcoda.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    // [mc setToRecipients:toRecipents];
    
    
    NSString *url = manage.services_url;
    NSArray *parts = [url componentsSeparatedByString:@"/"];
    NSString *filename = [parts lastObject];;
    
    
    
    
    // Determine the file name and extension
    //   NSArray *filepart = [file componentsSeparatedByString:@"."];
    // NSString *filename = [filepart objectAtIndex:0];
    // NSString *extension = [filepart objectAtIndex:1];
    
    // Get the resource path and read the file using NSData
    //  NSString *filePath = [[NSBundle mainBundle] pathForResource:filename ];
    // NSData *fileData = [NSData dataWithContentsOfFile:filePath];
    
    // Determine the MIME type
    /*  NSString *mimeType;
     if ([extension isEqualToString:@"jpg"]) {
     mimeType = @"image/jpeg";
     } else if ([extension isEqualToString:@"png"]) {
     mimeType = @"image/png";
     } else if ([extension isEqualToString:@"doc"]) {
     mimeType = @"application/msword";
     } else if ([extension isEqualToString:@"ppt"]) {
     mimeType = @"application/vnd.ms-powerpoint";
     } else if ([extension isEqualToString:@"html"]) {
     mimeType = @"text/html";
     } else if ([extension isEqualToString:@"pdf"]) {
     mimeType = @"application/pdf";
     }
     */
    // Add attachment
    //[mc addAttachmentData:fileData mimeType:mimeType fileName:filename];
    // NSData *pdfData = [NSData dataWithContentsOfURL[NSURL URLWithString:@"URL Of Pdf"]];
    [mc addAttachmentData:[NSData dataWithContentsOfURL:[NSURL URLWithString:manage.services_url]] mimeType:@"application/pdf" fileName:filename];
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [spinner startAnimating];
    
    
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [spinner stopAnimating];
    
    
    [web setHidden:FALSE];
}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}


@end
