//
//  Word.h
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Word : NSObject

@property (strong, nonatomic) NSString *Name;
@property (strong, nonatomic) NSString *Definition;
@property (strong, nonatomic) NSArray *Synonyms;

-(id)initWithName:(NSString *)name andDefinition:(NSString *)definition;

@end
