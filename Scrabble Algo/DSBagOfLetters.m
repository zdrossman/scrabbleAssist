//
//  DSBagOfLetters.m
//  Scrabble Algo
//
//  Created by Zachary Drossman on 6/12/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import "DSBagOfLetters.h"

@implementation DSBagOfLetters

+ (DSBagOfLetters *)sharedInstance
{
    static DSBagOfLetters *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[DSBagOfLetters alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}


- (void)restartGame
{
    self.remainingLetters = nil;
}

-(NSMutableArray *)remainingLetters
{
    if (!_remainingLetters)
    {
        
        _remainingLetters = [[NSMutableArray alloc] initWithCapacity:100];
        
        NSArray *alphabet = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z",@" "];
        
        NSArray *frequencies = @[@9,@2,@2,@4,@12,@2,@3,@2,@9,@1,@1,@4,@2,@6,@8,@2,@1,@6,@4,@6,@4,@2,@2,@1,@2,@1,@2];
        
        for (NSInteger counter = 0; counter <= 26; counter++)
        {
            NSInteger numberOfLetter = 0;
            
            while (numberOfLetter < [frequencies[counter] integerValue])
            {
                [_remainingLetters addObject:alphabet[counter]];
                numberOfLetter++;
            }
            
        }
    }
    
    return _remainingLetters;
}

-(void)removeFromBagOfLetters
{
    //Must remove letters that have been taken out by rack.
}
@end
