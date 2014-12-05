//
//  settings.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 21/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import "BackgroundLayer.h"

@interface settings : GAITrackedViewController
{
       singleton *manage;
    NSString *strr;
}
@property (weak, nonatomic) IBOutlet UISwitch *general_switch;
@property (strong, nonatomic) IBOutlet UISwitch *bill_switch;
@property(nonatomic,strong)IBOutlet UIView *sample;


- (IBAction)billpayment:(id)sender;
- (IBAction)general_notifi:(id)sender;
- (IBAction)sent:(id)sender;
-(IBAction)home:(id)sender;
@end
