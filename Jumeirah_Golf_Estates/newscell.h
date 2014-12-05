//
//  newscell.h
//  Jumeirah
//
//  Created by Veeramani on 16/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface newscell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *tit;
@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UITextView *des;
@property(strong,nonatomic)IBOutlet UIImageView *img;
@end
