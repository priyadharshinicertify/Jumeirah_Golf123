//
//  abt_JGE.m
//  Jumeirah
//
//  Created by Veeramani on 30/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "abt_JGE.h"
#import <QuartzCore/QuartzCore.h>

#import "JGEWebsite.h"


@interface abt_JGE ()

@end

@implementation abt_JGE
@synthesize btn,b1,l1,l2,l3,l4,l5,l6;
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
    
    
    
    [UIFont fontWithName:@"Roboto-Regular" size:5.0];
    l1.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    l1.font=[UIFont systemFontOfSize:10.0];
    b1.titleLabel.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    b1.titleLabel.font=[UIFont systemFontOfSize:10.0];
    l2.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    l2.font=[UIFont systemFontOfSize:10.0];
    l3.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    l3.font=[UIFont systemFontOfSize:10.0];
    l4.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    l4.font=[UIFont systemFontOfSize:10.0];
    l5.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    l5.font=[UIFont systemFontOfSize:10.0];
    l6.font=[UIFont fontWithName:@"Roboto-Regular" size:5.0];
    l6.font=[UIFont systemFontOfSize:12.0];
    
    
    
    CAGradientLayer *btnGradient = [BackgroundLayer blackWhiteGradient];
    btnGradient.frame = self.btn.bounds;
    btnGradient.cornerRadius=5;
    btnGradient.borderWidth=1.0;
    btnGradient.borderColor=([UIColor whiteColor]).CGColor;
    [self.btn.layer insertSublayer:btnGradient atIndex:0];
   
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"AboutJGE Screen";
}

-(IBAction)shareJGE:(id)sender
{
    // Email Subject
    NSString *emailTitle = @"Check out JGE Mobile Application";
    // Email Content
    NSString *messageBody = @" https://itunes.apple.com/us/app/jumeirah-golf-estates/id900133146?mt=8";
    // To address
    //  NSArray *toRecipents = [NSArray arrayWithObject:@"support@appcoda.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    //  [mc setToRecipients:toRecipents];
    
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)home:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];}
- (IBAction)sendmail:(id)sender {
    
    
    NSString *emailTitle = @" JGE Mobile App";
    // Email Content
 //   NSString *messageBody = @"Check out JGE Mobile Application in https://itunes.apple.com/us/app/jumeirah-golf-estates/id900133146?mt=8";
    // To address
     NSArray *toRecipents = @[@"admin@jumeirahgolfestates.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
   // [mc setMessageBody:messageBody isHTML:NO];
    
     [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];

    
}
-(IBAction)website:(id)sender
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_iphone" bundle:nil];
        [self.navigationController pushViewController:vdo animated:NO];
    }
    else
    {
        JGEWebsite *vdo = [[JGEWebsite alloc] initWithNibName:@"JGEWebsite_ipad" bundle:nil];
        [self.navigationController pushViewController:vdo animated:NO];
    }

    
    
    
    
    
 
}
@end
