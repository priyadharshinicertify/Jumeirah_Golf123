//
//  forgetpass.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 15/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface forgetpass : GAITrackedViewController
@property (strong, nonatomic) IBOutlet UITextField *cus_id;
@property (strong, nonatomic) IBOutlet UIButton *sub;
@property(strong,nonatomic)IBOutlet UIButton *Btnn;
- (IBAction)sub_action:(id)sender;


@property(nonatomic,strong)IBOutlet UIView *sample;

-(IBAction)back:(id)sender;



-(IBAction)home:(id)sender;
@end
