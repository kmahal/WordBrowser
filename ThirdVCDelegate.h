//
//  ThirdVCDelegate.h
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Word;

@protocol ThirdVCDelegate <NSObject>

-(void)thirdVCDelegate:(id)view withWord:(Word *)word;

@end
