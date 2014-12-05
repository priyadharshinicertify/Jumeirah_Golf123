//
//  lettercell.h
//  Jumeirah
//
//  Created by Veeramani on 18/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface lettercell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *des;
@property(strong,nonatomic)IBOutlet UITextView *txt;
@end
