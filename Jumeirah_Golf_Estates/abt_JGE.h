//
//  abt_JGE.h
//  Jumeirah
//
//  Created by Veeramani on 30/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "BackgroundLayer.h"

@interface abt_JGE : GAITrackedViewController<MFMailComposeViewControllerDelegate>
@property(strong,nonatomic)IBOutlet UIButton *btn;
-(IBAction)home:(id)sender;
@property (nonatomic, retain) IBOutlet UILabel *l1;
@property (nonatomic, retain) IBOutlet UILabel *l2;
@property (nonatomic, retain) IBOutlet UILabel *l3;
@property (nonatomic, retain) IBOutlet UILabel *l4;
@property (nonatomic, retain) IBOutlet UILabel *l5;
@property (nonatomic, retain) IBOutlet UILabel *l6;
@property (nonatomic, retain) IBOutlet UIButton *b1;

@property (nonatomic, retain) IBOutlet UIView *sample;

-(IBAction)shareJGE:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *sendmail;
- (IBAction)sendmail:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *website;
- (IBAction)website:(id)sender;
@end
