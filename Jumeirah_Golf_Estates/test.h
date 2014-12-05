//
//  test.h
//  Jumeirah
//
//  Created by $ h i v a on 14/05/14.
//  Copyright (c) 2014 Certify. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface test : NSObject
{
    NSString *_name;
    NSString *_city;
    NSString *_state;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *state;

@end
