//
//  FTdownloads.m
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import "FTdownloads.h"
#import "imagecell.h"
#import "RESideMenu.h"
@interface FTdownloads ()

@end

@implementation FTdownloads

//@synthesize collectionViewPack,itemshowdetailsAr;
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
       // NSString *str=manage.image_gallery;
    
    NSString *post =[[NSString alloc] initWithFormat:@" district_id=jge-ftr&&feature_id=jge-dl"];
    NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSLog(@"postData.....%@", post);
    NSString *URL = [NSString stringWithFormat:@"http://mobileapp.jumeirahgolfestates.org/jumeirah/property_showcase3.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:120.0];
    [request setHTTPMethod:@"POST"];
    
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (con) {
        NSLog(@"data sent ");
    } else
    {
        NSLog(@"Not sent");
    }
    [con start];
    
    
    
    
    
    self.title = @"Downloads";
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"arrowBack.png"] style:UIBarButtonItemStylePlain target:self action:@selector(presentLeftMenuViewController:)];
    
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (receivedData == NULL) {
        receivedData = [[NSMutableData alloc] init];
    }
    [receivedData setLength:0];}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [error userInfo][NSURLErrorFailingURLStringErrorKey]);
    UIAlertView *customAlert = [[UIAlertView alloc]initWithTitle:@"No NetWork" message:@"Interet Connection is Lost" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [customAlert show];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    
    
    NSError *e = nil;
    
    NSDictionary *jsonArray1 = [NSJSONSerialization JSONObjectWithData:receivedData options: NSJSONReadingMutableContainers error: &e];
    NSLog(@"%@",jsonArray1);
    
    if (jsonArray1) {
        NSString *ss;
        NSArray *headlines=jsonArray1[@"downloads"];
        
        for (int i=0;i<[headlines count]; i++)
        {
            ss=headlines[i][@"downloads_url"];
            
            //  [self.itemshowdetailsAr addObject:ss];
            // NSLog(@"%@",itemshowdetailsAr);
            
        }
        
        // NSString *fullURL = @"https://mobile.twitter.com/JumGolfEst";
      //  NSURL *url = [NSURL URLWithString:ss];
        NSURL *targetURL = [NSURL URLWithString:ss];
       // NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
        
        
        
        //[web loadRequest:requestObj];
        self.viewWeb.scalesPageToFit = YES;
        self.viewWeb.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
       self.viewWeb.delegate= self;
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
            
            [self.viewWeb loadData:data
                 MIMEType:@"application/pdf"
         textEncodingName:@"utf-8"
                  baseURL:[NSURL URLWithString:@"http://example.com/"]];
            
            
      });
            
            
            
            
            
            
            // [web loadRequest:request];
            
          
        self.viewWeb .scalesPageToFit = YES;
        self.viewWeb .autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
        self.viewWeb .delegate= self;
        
    }    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Result" message:@"no network"  delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    
    
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    
    // [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.spinner startAnimating];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // [ self.viewWeb setscalesPageToFit:YES];
    //  [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.spinner stopAnimating];
    [self.spinner hidesWhenStopped];
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.spinner stopAnimating];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
