//
//  DSAnagram.h
//  Scrabble Algo
//
//  Created by Daniel Sun on 6/12/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSAnagramFromWord.h"

@interface DSAnagram : NSObject
@property (strong, nonatomic) NSArray * bagOfLetters;
@property (strong, nonatomic) NSMutableArray *allWords;
@property (strong, nonatomic) NSMutableArray *sortedWords;

-(void)anagramFinder: (NSString *)word;
-(DSAnagramFromWord *) createScoredWord: (NSString *)anagram;
-(void)sortedScoreList: (NSArray *)allAnagrams;
-(void)allPermutationRecursion: (NSArray *)originalLeftArray andNewArray:(NSArray *)originalRightArray;

@end
