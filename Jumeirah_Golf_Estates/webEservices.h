//
//  webEservices.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 24/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "Eservices.h"
#import <MessageUI/MessageUI.h>
@interface webEservices : GAITrackedViewController<MFMailComposeViewControllerDelegate,UIWebViewDelegate>
{
    singleton *manage;
}
@property(strong,nonatomic)IBOutlet UIWebView *web;
-(IBAction)mailing:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;
@end
