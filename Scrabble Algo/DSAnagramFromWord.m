//
//  DSAnagramFromWord.m
//  Scrabble Algo
//
//  Created by Daniel Sun on 6/13/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import "DSAnagramFromWord.h"

@implementation DSAnagramFromWord
-(instancetype)initWithName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        _score = @0;
        _name = name;
    }
    return self;
}

@end
