//
//  MainWT.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 30/07/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
@interface MainWT : GAITrackedViewController<UITableViewDataSource, UITableViewDelegate,RESideMenuDelegate>
-(IBAction)dist:(id)sender;
@end
