//
//  DSRack.h
//  Scrabble Algo
//
//  Created by Zachary Drossman on 6/12/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DSBagOfLetters;


@interface DSRack : NSObject

@property (strong, nonatomic) NSMutableArray *currentLettersInRack;

- (void)fillRackFromBag:(DSBagOfLetters *)bagOfLetters;

@end
