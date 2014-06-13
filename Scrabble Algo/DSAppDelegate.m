//
//  DSAppDelegate.m
//  Scrabble Algo
//
//  Created by Daniel Sun on 6/11/14.
//  Copyright (c) 2014 Daniel Sun. All rights reserved.
//

#import "DSAppDelegate.h"
#import "DSScrabbleGame.h"

@implementation DSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    DSScrabbleGame *scrabbleGame = [[DSScrabbleGame alloc] init];
    [scrabbleGame startNewGame];
    return YES;
    
}






//-(NSMutableArray *)allPermutationRecursion: (NSArray *)originalLeftArray andNewArray:(NSArray *)originalRightArray withAllWords:(NSMutableArray *)allWords
//{
//    
//    NSMutableArray *leftArray = [NSMutableArray arrayWithArray:originalLeftArray];
//    NSMutableArray *rightArray = [NSMutableArray arrayWithArray:originalRightArray];
////    NSLog(@"%@%@",leftArray, rightArray);
//    NSInteger counter = 0;
//    if (!([leftArray count] == 0))
//    {
//        
//        while (counter <[leftArray count])
//        {
//            NSLog(@"LAC: %d",[leftArray count]);
//            //NSLog(@"The Left Array is: %@  |   The Right Array is %@", [leftArray componentsJoinedByString:@""], [rightArray componentsJoinedByString:@""]);
//             NSLog(@"counter:%d", counter);
//             NSLog(@"(%@) | (%@)", [leftArray componentsJoinedByString:@""], [rightArray componentsJoinedByString:@""]);
//            [rightArray addObject:leftArray[counter]];
//            [leftArray removeObject:leftArray[counter]];
//            [self allPermutationRecursion:leftArray andNewArray:rightArray withAllWords:allWords] ;
//            leftArray = originalLeftArray;
//            rightArray = originalRightArray;
//            counter ++;
//            NSLog(@"counter:%d", counter);
//        }
//    }
//    else
//    {
//        NSLog(@"LAC: %d",[leftArray count]);
//
//        NSString *permutation = [NSString stringWithFormat:@"%@",[originalRightArray componentsJoinedByString:@""]];
//        NSLog(@"(%@)",permutation);
//
//        [allWords addObject:permutation];
//        
//    }
//    return allWords;
//}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
