//
//  web_letter.h
//  Jumeirah
//
//  Created by Veeramani on 18/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "newsletter.h"
#import <MessageUI/MessageUI.h>
@interface web_letter : GAITrackedViewController<MFMailComposeViewControllerDelegate,UIWebViewDelegate>
{
      singleton *manage;
}
@property(strong,nonatomic)IBOutlet UIWebView *web;
-(IBAction)back:(id)sender;
-(IBAction)mailing:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;

@property(nonatomic,strong)IBOutlet UIImageView *ii;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *spinner;
@property(strong,nonatomic)IBOutlet UILabel *titleing;

@end
