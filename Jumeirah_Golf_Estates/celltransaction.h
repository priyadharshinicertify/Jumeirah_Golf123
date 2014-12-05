//
//  celltransaction.h
//  Jumeirah_Golf_Estates
//
//  Created by Veeramani on 27/09/14.
//  Copyright (c) 2014 JumeirahGolfEstates. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface celltransaction : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *tdate;
@property (strong, nonatomic) IBOutlet UILabel *tamount;
@property (strong, nonatomic) IBOutlet UILabel *tinvoice;
@property (strong, nonatomic) IBOutlet UIButton *tview;

@property (strong, nonatomic) IBOutlet UILabel *tmonth;


@property (strong, nonatomic) IBOutlet UILabel *greenlbl;

@property (strong, nonatomic) IBOutlet UILabel *bluelbl;
@end
