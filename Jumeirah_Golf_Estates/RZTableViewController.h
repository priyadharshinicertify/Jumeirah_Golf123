//
//  RZTableViewController.h
//  RZCellSizeManagerDemo
//
//  Created by Alex Rouse on 12/20/13.
//  Copyright (c) 2013 Raizlabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RZTableViewController : UIViewController
{
     NSMutableData *receivedData;
}
@property(strong,nonatomic)NSMutableArray *itemshowdetailsAr;
@property(strong,nonatomic)IBOutlet UIImageView *img;
-(IBAction)home:(id)sender;


@property(nonatomic,strong)IBOutlet UIView *sample;


@end
