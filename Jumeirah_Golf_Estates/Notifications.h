//
//  Notifications.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 13/08/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
#import <CoreLocation/CoreLocation.h>
@interface Notifications : GAITrackedViewController<UITableViewDelegate,UITableViewDataSource>
{
    singleton *manage;
     CGPoint _prePoint;
    
}



@property (strong, nonatomic) IBOutlet UITableView *tblvie;

@property(nonatomic,strong)IBOutlet UIView *sample;

-(IBAction)back:(id)sender;


@property(nonatomic,strong)IBOutlet UIButton *edit;
@property(nonatomic,strong)IBOutlet UIButton *done;

- (IBAction)editaction:(id)sender;


- (IBAction)doneaction:(id)sender;

@end
