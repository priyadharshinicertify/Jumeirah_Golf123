//
//  Career.h
//  Jumeirah
//
//  Created by Veeramani on 15/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Career;
@protocol careerViewDelegate
-(void)career:(Career *)career ratingDidChange:(float)rating;


@end
@interface Career : UIView
@property(strong,nonatomic)UIImage *notselectedimage;
@property(strong,nonatomic)UIImage *halfselectedimage;
@property(strong,nonatomic)UIImage *fullselectedimage;
@property (assign, nonatomic) float rating;
@property (assign) BOOL editable;
@property (strong) NSMutableArray * imageViews;
@property (assign, nonatomic) int maxRating;
@property (assign) int midMargin;
@property (assign) int leftMargin;
@property (assign) CGSize minImageSize;
@property (assign) id <careerViewDelegate> delegate;
@end
