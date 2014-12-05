//
//  trancation.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 16/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "singleton.h"
@interface trancation : GAITrackedViewController<UITableViewDataSource,UITableViewDelegate>
{
    singleton *manage;

    
}
@property(nonatomic,strong)IBOutlet UIView *sample;
@property (strong, nonatomic) IBOutlet UIButton *info;
@property (strong, nonatomic) IBOutlet UITableView *tblvie;
- (IBAction)back:(id)sender;

@end
