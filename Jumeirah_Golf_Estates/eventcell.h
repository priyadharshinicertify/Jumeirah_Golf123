//
//  eventcell.h
//  Jumeirah
//
//  Created by Veeramani on 17/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface eventcell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *tit;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *des;
@property(strong,nonatomic)IBOutlet UIImageView *img;
@property(strong,nonatomic)IBOutlet UIButton *btn;
@end
