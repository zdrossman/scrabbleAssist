//
//  DSBagOfLetters.h
//  Scrabble Algo
//
//  Created by Zachary Drossman on 6/12/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSBagOfLetters : NSObject

@property (strong, nonatomic) NSMutableArray *remainingLetters;

+ (DSBagOfLetters *)sharedInstance;

-(void)removeFromBagOfLetters:(NSArray *)lettersRemovedByPlayer;

@end
