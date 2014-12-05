//
//  DEMOLeftMenuViewController.h
//  Jumeirah
//
//  Created by Veeramani on 11/07/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
#import "FSdownloads.h"
#import "FSthreebed.h"
#import "FSfourbed.h"
@interface DEMOLeftMenuViewController : GAITrackedViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray      *sectionTitleArray;
    NSMutableDictionary *sectionContentDict;
    NSMutableArray *array4;
    NSMutableArray *array5;

}
-(IBAction)dist:(id)sender;
@end
