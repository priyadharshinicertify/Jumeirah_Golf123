//
//  web_letter.m
//  Jumeirah
//
//  Created by Veeramani on 18/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "web_letter.h"
#import <MessageUI/MessageUI.h>
#import <QuartzCore/QuartzCore.h>
#import "BackgroundLayer.h"
@interface web_letter ()

@end

@implementation web_letter
@synthesize web,spinner,ii,titleing;
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
    //manage=[singleton share];
    
//    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//    spinner.center=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    spinner.color=[UIColor blackColor];
    [self.view addSubview:spinner];
    // self.view.center=spinner;
    
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            
            //back to the main thread for the UI call
            dispatch_async(dispatch_get_main_queue(), ^{
                [spinner startAnimating];
            });
            
            
            
            manage=[singleton share];
            NSString *ImageURL= manage.letter_url;
            // NSData *urldata = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
            NSURL *targetURL = [NSURL URLWithString:ImageURL];
          //  NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
            
            titleing.text=manage.newsletter_tit;
            
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
                
                
                [spinner stopAnimating];
            });
        });
 
        
    
   /* NSString *ImageURL= manage.letter_url;
        
        
   //  NSData *urldata = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
    NSURL *targetURL = [NSURL URLWithString:ImageURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        dispatch_async(dispatch_get_main_queue(), ^{
           // [AsynchronousFreeloader loadImageFromLink:manage.letter_url forImageView:ii withPlaceholder:nil andContentMode:UIViewContentModeScaleAspectFill];
            self.web .scalesPageToFit = YES;
            self.web .autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
            self.web .delegate= self;
            NSError *error;
            
    
             *  GET the data from a url link
    
          //  NSData *data = [NSData dataWithContentsOfURL:targetURL
                                               //  options:NSDataReadingUncached
                                                  // error:&error];
            
           if (error) { // validation
                NSLog(@"data error: %@", error);
                
            }
            
    
             *  Load the request fro mthe binaray data
    
        dispatch_async(dispatch_get_main_queue(), ^{
                
                [web loadData:data
                     MIMEType:@"application/pdf"
             textEncodingName:@"utf-8"
                      baseURL:[NSURL URLWithString:@"http://example.com/"]];
                
                
                */
                
                      
                // [web loadRequest:request];
                
                //  });
        
    // });
    
    // [self.view addSubview:web];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Webletter Screen";
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
    
    
    NSString *url = manage.letter_url;
    NSArray *parts = [url componentsSeparatedByString:@"/"];
    NSString *filename = [parts lastObject];;
    
    
    
     // NSData *pdfData = [NSData dataWithContentsOfURL[NSURL URLWithString:@"URL Of Pdf"]];
    [mc addAttachmentData:[NSData dataWithContentsOfURL:[NSURL URLWithString:manage.letter_url]] mimeType:@"application/pdf" fileName:filename];
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
    
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


- (void)webViewDidStartLoad:(UIWebView *)webView
{
   // [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.spinner startAnimating];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
  //  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
     [self.spinner stopAnimating];
    [self.spinner hidesWhenStopped];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.spinner stopAnimating];

    
}
@end
