//
//  Word.m
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import "Word.h"

@implementation Word

@synthesize Name, Definition, Synonyms;


-(id)initWithName:(NSString *)name andDefinition:(NSString *)definition {
    
    self = [super init];
    
    if (self){
        Name = name;
        Definition = definition;
    }
    
    return self;
}



@end
