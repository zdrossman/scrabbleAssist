//
//  DSAnagram.m
//  Scrabble Algo
//
//  Created by Daniel Sun on 6/12/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import "DSAnagram.h"
#import "DSAnagramFromWord.h"

@implementation DSAnagram


-(void)sortedScoreList: (NSArray *)allAnagrams
{
    NSMutableArray *unsortedArray = [[NSMutableArray alloc ] init];
    for (NSString *word in allAnagrams)
    {
        [unsortedArray addObject:[self createScoredWord:word]];
    }
    
    NSSortDescriptor *sortedByScore = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
    NSArray *sortedArray = [unsortedArray sortedArrayUsingDescriptors:@[sortedByScore]];
    
    for (DSAnagramFromWord *object in sortedArray)
    {
        NSString *added = [NSString stringWithFormat:@"Word: %@   Score:%@",object.name, object.score];
        [self.sortedWords addObject:added];
        
    }
}

-(DSAnagramFromWord *) createScoredWord: (NSString *)anagram
{
    NSDictionary *letterScoreDictionary = @{@"A":@1,@"B":@3,@"C":@3,@"D":@2,@"E":@1,@"F":@4,@"G":@2,@"H"
                                            :@4,@"I":@1,@"J":@8,@"K":@5,@"L":@1, @"M":@3, @"N":@1, @"O":@1,
                                            @"P":@3, @"Q":@10, @"R":@1, @"S":@1, @"T":@1, @"U":@1, @"V":@4,
                                            @"W":@4, @"X":@8, @"Y":@4, @"Z":@10};
    NSInteger sum = 0;
    DSAnagramFromWord *wordToBeScored = [[DSAnagramFromWord alloc] initWithName:anagram];
    for (NSInteger i= 0; i < [anagram length]; i++)
    {
        NSString* character = [NSString stringWithFormat:@"%C",[anagram characterAtIndex:i]];
        NSNumber *score = [letterScoreDictionary objectForKey:[character uppercaseString]];
        sum += [score integerValue];
        wordToBeScored.score = @(sum);
        
    }
    return wordToBeScored;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _allWords = [[NSMutableArray alloc] init];
        _sortedWords = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)anagramFinder: (NSString *)word
{
    NSMutableArray *lettersArray = [[NSMutableArray alloc] init]; //array of word broken up into characters
    for (NSInteger i = 0; i < [word length];i++) //adding characters into lettersArray
    {
        NSString *character = [NSString stringWithFormat:@"%C",[word characterAtIndex:i]];
        [lettersArray addObject:character];
    }

    NSMutableArray *leftArray = [[NSMutableArray alloc] initWithArray:lettersArray];
    NSMutableArray *rightArray = [[NSMutableArray alloc] init];
    
    [self allPermutationRecursion:leftArray andNewArray:rightArray];


}


-(void)allPermutationRecursion: (NSArray *)originalLeftArray andNewArray:(NSArray *)originalRightArray
{
    
    NSMutableArray *leftArray = [NSMutableArray arrayWithArray:originalLeftArray];
    NSMutableArray *rightArray = [NSMutableArray arrayWithArray:originalRightArray];
    
    if (!([leftArray count] == 0))
    {
        [self addWordToAllWordsArray:[leftArray componentsJoinedByString:(@"")]];
        for (NSString *character in originalLeftArray)
        {
        
            [rightArray addObject:character];
            [leftArray removeObject:character];
            
            NSString *permutation = [NSString stringWithFormat:@"%@",[rightArray componentsJoinedByString:@""]];
            [self addWordToAllWordsArray:permutation];
            
            [self allPermutationRecursion:leftArray andNewArray:rightArray] ;
            leftArray = [originalLeftArray mutableCopy];
            rightArray = [originalRightArray mutableCopy];
        }
    }
}



-(BOOL)isDictionaryWord:(NSString*) word {
    UITextChecker *checker = [[UITextChecker alloc] init];
    NSLocale *currentLocale = [NSLocale currentLocale];
    NSString *currentLanguage = [currentLocale objectForKey:NSLocaleLanguageCode];
    NSRange searchRange = NSMakeRange(0, [word length]);
    NSRange misspelledRange = [checker rangeOfMisspelledWordInString:[word lowercaseString] range: searchRange startingAt:0 wrap:NO language: currentLanguage ];
    return misspelledRange.location == NSNotFound;
}


-(void)addWordToAllWordsArray:(NSString *)potentialWordToAdd
{
    if ([self isDictionaryWord:potentialWordToAdd])
    {
        if ((![self.allWords containsObject:potentialWordToAdd]) && ([potentialWordToAdd length]>1))
        {
            [self.allWords addObject:potentialWordToAdd];
        }
    }
}





@end
