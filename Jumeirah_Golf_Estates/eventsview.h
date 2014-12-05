//
//  eventsview.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 01/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
@interface eventsview : UIViewController
{
    singleton *manage;
}
@property (strong, nonatomic) IBOutlet UIImageView *imgv;

@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *tit;
@property (strong, nonatomic) IBOutlet UITextView *txtvie;
@property (strong, nonatomic) IBOutlet UIButton *back;
- (IBAction)backpage:(id)sender;
@property(nonatomic,strong)IBOutlet UIView *sample;
@end
