//
//  customerfeedback.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 19/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customerfeedback : GAITrackedViewController<UITextFieldDelegate,UITextViewDelegate>
{
     CGFloat animatedDistance;
}
@property (strong, nonatomic) IBOutlet UITextView *txtview;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *mobno;
@property (strong, nonatomic) IBOutlet UILabel *placeholderlabel;

@property(strong,nonatomic)IBOutlet UIButton *sub;


-(IBAction)submit:(id)sender;
-(IBAction)home:(id)sender;
-(IBAction)finish:(id)sender;
@end
