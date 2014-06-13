//
//  DSAnagram.h
//  Scrabble Algo
//
//  Created by Daniel Sun on 6/12/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DSAnagram : NSObject
@property (strong, nonatomic) NSArray * bagOfLetters;
@property (strong, nonatomic) NSMutableArray *allWords;

-(void)anagramFinder: (NSString *)word;

@end
