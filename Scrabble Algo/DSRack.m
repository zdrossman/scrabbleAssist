//
//  DSRack.m
//  Scrabble Algo
//
//  Created by Zachary Drossman on 6/12/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import "DSRack.h"
#import "DSBagOfLetters.h"

#define hand 7

@implementation DSRack

#pragma mark - Getters
-(NSMutableArray *)currentLettersInRack
{
    if (!_currentLettersInRack)
    {
        _currentLettersInRack = [[NSMutableArray alloc] initWithCapacity:7];
    }
    
    return _currentLettersInRack;
}



#define ARC4RANDOM_MAX 0x100000000

- (void)fillRackFromBag:(DSBagOfLetters *)bagOfLetters
{
    NSInteger counter = [self.currentLettersInRack count];
    
    while (counter < hand)
    {
        NSInteger random = ((float)arc4random() / ARC4RANDOM_MAX) * 100;
        
        if (![self.currentLettersInRack containsObject:[bagOfLetters.remainingLetters objectAtIndex:random]])
        {
            [self.currentLettersInRack addObject:[bagOfLetters.remainingLetters objectAtIndex:random]];
            counter++;
        }
    }
    
}



@end
