//
//  ZSD_anagramAssist.m
//  ScrabbleAssist
//
//  Created by Zachary Drossman on 6/11/14.
//  Copyright (c) 2014 Zach Drossman. All rights reserved.
//

#import "ZSD_anagramAssist.h"

#define hand 7

@implementation ZSD_anagramAssist

//- (NSMutableDictionary *)remainingLetters
//{
//    if (!_remainingLetters)
//    {
//        _remainingLetters = [[NSMutableDictionary alloc] initWithCapacity:100];
//        
//        for (NSInteger i = 0; i < 100; i++)
//        {
//            [_remainingLetters setObject:@1 forKey:@(i)];
//        }
//    }
//    
//    return _remainingLetters;
//
//}

//- (NSNumber *)numOfRemainingLettersInBag
//{
//    return @([[self.remainingLetters allKeysForObject:@1] count]);
//}


#define ARC4RANDOM_MAX 0x100000000
- (CGFloat)randomFloatBetweenNumber:(CGFloat)minRange andNumber:(CGFloat)maxRange
{
    return ((float)arc4random() / ARC4RANDOM_MAX)
    * (maxRange - minRange)
    + minRange;
}



- (NSMutableArray *)solveAnagram;
{

    
    NSMutableArray *firstArray = [[NSMutableArray alloc] initWithArray:@[@"a",@"b",@"c"]];
    NSMutableArray *secondArray = [[NSMutableArray alloc] initWithCapacity:[firstArray count]];
    NSMutableArray *allWordsSoFar = [[NSMutableArray alloc] init];
    
    NSMutableArray *finalAnagram = [self computeAllPossibleCombinationsWithFirstArray:firstArray AndSecondArray:secondArray AndAllWordsSoFar:allWordsSoFar];
    
    return finalAnagram;

}

- (NSArray *)computeAllPossibleCombinationsWithFirstArray:(NSMutableArray *)firstArray AndSecondArray:(NSMutableArray *)secondArray AndAllWordsSoFar:(NSMutableArray *)allWordsSoFar
{
    
    NSMutableArray *l_firstArray = [[NSMutableArray alloc] initWithArray:firstArray];
    NSMutableArray *l_secondArray = [[NSMutableArray alloc] initWithArray:secondArray];
    
    if (!([l_firstArray count] < 1)) //not base case
    {
        for (NSInteger character = 0; character < [l_firstArray count]; character++)
        {
            [l_secondArray addObject:l_firstArray[character]];
            [l_firstArray removeObject:l_firstArray[character]];
        
            //NSString *combinationOfArrayStrings = [NSString stringWithFormat:@"%@%@",[l_firstArray componentsJoinedByString:@""],[l_secondArray componentsJoinedByString:@""]];
            
            //[allWordsSoFar addObject:combinationOfArrayStrings];
            
            [self computeAllPossibleCombinationsWithFirstArray:l_firstArray AndSecondArray:l_secondArray AndAllWordsSoFar:allWordsSoFar];
            
            l_firstArray = firstArray;
            l_secondArray = secondArray;
        }
        
    }
    else {
        NSString *combinedRightArray = [l_secondArray componentsJoinedByString:@""];
        [allWordsSoFar addObject:combinedRightArray];
    }
    
    return allWordsSoFar;
}

//
//            NSLog(@"First string:%@", [firstArray componentsJoinedByString:@""]);
//
//            if([self isDictionaryWord:[firstArray componentsJoinedByString:@""]])
//            {
//                [self.allPossibleWordsArray addObject:[firstArray componentsJoinedByString:@""]];
//
//                NSLog(@"Partial added string:%@", [firstArray componentsJoinedByString:@""]);
//
//            }

-(BOOL)isDictionaryWord:(NSString*) word {
    UITextChecker *checker = [[UITextChecker alloc] init];
    NSLocale *currentLocale = [NSLocale currentLocale];
    NSString *currentLanguage = [currentLocale objectForKey:NSLocaleLanguageCode];
    NSRange searchRange = NSMakeRange(0, [word length]);
    NSRange misspelledRange = [checker rangeOfMisspelledWordInString:[word lowercaseString] range: searchRange startingAt:0 wrap:NO language: currentLanguage ];
    return misspelledRange.location == NSNotFound;
}


@end
