//
//  DSScrabbleGame.m
//  Scrabble Algo
//
//  Created by Zachary Drossman on 6/13/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import "DSScrabbleGame.h"
#import "DSBagOfLetters.h"
#import "DSRack.h"
#import "DSAnagram.h"

@implementation DSScrabbleGame

-(void)startNewGame
{
    DSBagOfLetters *bagOfLetters = [DSBagOfLetters sharedInstance];
    
    DSRack *player1Rack = [[DSRack alloc] init];
    
    [player1Rack fillRackFromBag:bagOfLetters];
    
    NSLog(@"You have started a new game of Scrabble. We are mixing up the letters in the bag now. Here are your first seven letters: %@", player1Rack.currentLettersInRack);
    
    NSLog(@" ");
    
    NSLog(@"Want a hint? Okay...");
    
    NSLog(@" ");
    
    NSLog(@"Here's a list of words you can create with what you have in your rack:");
    
    DSAnagram *anagram = [[DSAnagram alloc] init];
    
    [anagram anagramFinder:[player1Rack.currentLettersInRack componentsJoinedByString:@""]];
    
    NSLog(@"%@", anagram.allWords);
          
        
    
    
    
}


@end
