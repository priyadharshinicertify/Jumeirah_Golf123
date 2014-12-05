//
//  vacancycell.h
//  Jumeirah
//
//  Created by Veeramani on 17/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface vacancycell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *tit;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property(nonatomic,strong)IBOutlet UITextView *txt;
@end
