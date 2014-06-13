//
//  DSAnagramFromWord.h
//  Scrabble Algo
//
//  Created by Daniel Sun on 6/13/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSAnagramFromWord : NSObject
@property (strong, nonatomic) NSNumber*score;
@property (strong, nonatomic) NSString*name;
-(instancetype)initWithName:(NSString *)name;

@end
