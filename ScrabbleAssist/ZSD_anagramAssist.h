//
//  ZSD_anagramAssist.h
//  ScrabbleAssist
//
//  Created by Zachary Drossman on 6/11/14.
//  Copyright (c) 2014 Zach Drossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZSD_anagramAssist : NSObject

@property (strong, nonatomic) NSArray *bagOfLetters;
@property (strong, nonatomic) NSArray *lettersOnTheBoardAndTheirPlacement;
@property (strong, nonatomic) NSMutableArray *allPossibleWordsArray;

- (NSMutableArray *)solveAnagram;


@end
