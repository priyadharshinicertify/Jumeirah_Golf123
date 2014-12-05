//
//  changepassword.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 14/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
@interface changepassword : GAITrackedViewController
{
    singleton *manage;

}
@property (strong, nonatomic) IBOutlet UITextField *current_pass;
@property (strong, nonatomic) IBOutlet UITextField *passnew;

@property (strong, nonatomic) IBOutlet UITextField *retype_pass;
@property (strong, nonatomic) IBOutlet UIButton *sub;
- (IBAction)sub_action:(id)sender;

@property(nonatomic,strong)IBOutlet UIView *sample;


-(IBAction)back:(id)sender;
@end
