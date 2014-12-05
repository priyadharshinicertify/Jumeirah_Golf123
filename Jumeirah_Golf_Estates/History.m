//
//  History.m
//  Jumeirah
//
//  Created by Veeramani on 15/06/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import "History.h"

@implementation History
@synthesize notselectedimage,halfselectedimage,fullselectedimage,rating=_rating,editable,imageViews,midMargin,minImageSize,leftMargin,delegate;

@synthesize maxRating=_maxRating;
- (void)baseInit {
    notselectedimage = nil;
    halfselectedimage = nil;
    fullselectedimage = nil;
    _rating = 0;
    editable = NO;
    imageViews = [[NSMutableArray alloc] init];
    _maxRating = 5;
    midMargin = 5;
    leftMargin = 0;
    minImageSize = CGSizeMake(5, 5);
    delegate = nil;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self baseInit];
    }
    return self;
}

- (void)refresh {
    for(int i = 0; i < self.imageViews.count; ++i) {
        UIImageView *imageView = (self.imageViews)[i];
        if (self.rating >= i+1) {
            imageView.image = self.fullselectedimage;
        } else if (self.rating > i) {
            imageView.image = self.halfselectedimage;
        } else {
            imageView.image = self.notselectedimage;
        }
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.notselectedimage == nil) return;
    
    float desiredImageWidth = (self.frame.size.width - (self.leftMargin*2) - (self.midMargin*self.imageViews.count)) / self.imageViews.count;
    float imageWidth = MAX(self.minImageSize.width, desiredImageWidth);
    float imageHeight = MAX(self.minImageSize.height, self.frame.size.height);
    
    for (int i = 0; i < self.imageViews.count; ++i) {
        
        UIImageView *imageView = (self.imageViews)[i];
        CGRect imageFrame = CGRectMake(self.leftMargin + i*(self.midMargin+imageWidth), 0, imageWidth, imageHeight);
        imageView.frame = imageFrame;
        
    }
    
}

- (void)setMaxRating:(int)maxRating {
    _maxRating = maxRating;
    
    // Remove old image views
    for(int i = 0; i < self.imageViews.count; ++i) {
        UIImageView *imageView = (UIImageView *) (self.imageViews)[i];
        [imageView removeFromSuperview];
    }
    [self.imageViews removeAllObjects];
    
    // Add new image views
    for(int i = 0; i < maxRating; ++i) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.imageViews addObject:imageView];
        [self addSubview:imageView];
    }
    
    // Relayout and refresh
    [self setNeedsLayout];
    [self refresh];
}

- (void)setNotSelectedImage:(UIImage *)image {
    notselectedimage = image;
    [self refresh];
}

- (void)setHalfSelectedImage:(UIImage *)image {
    halfselectedimage = image;
    [self refresh];
}

- (void)setFullSelectedImage:(UIImage *)image {
    fullselectedimage = image;
    [self refresh];
}

- (void)setRating:(float)rating {
    _rating = rating;
    [self refresh];
}

- (void)handleTouchAtLocation:(CGPoint)touchLocation {
    if (!self.editable) return;
    
    long newRating = 0;
    for(long i = self.imageViews.count - 1; i >= 0; i--) {
        UIImageView *imageView = (self.imageViews)[i];
        if (touchLocation.x > imageView.frame.origin.x) {
            newRating = i+1;
            break;
        }
    }
    
    self.rating = newRating;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self handleTouchAtLocation:touchLocation];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    [self handleTouchAtLocation:touchLocation];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.delegate history:self ratingDidChange:self.rating];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
