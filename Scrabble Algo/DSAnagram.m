//
//  DSAnagram.m
//  Scrabble Algo
//
//  Created by Daniel Sun on 6/12/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import "DSAnagram.h"

@implementation DSAnagram

- (instancetype)init
{
    self = [super init];
    if (self) {
        _allWords = [[NSMutableArray alloc] init];
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
        if ((![self.allWords containsObject:potentialWordToAdd]))
        {
            [self.allWords addObject:potentialWordToAdd];
        }
    }
}





@end
