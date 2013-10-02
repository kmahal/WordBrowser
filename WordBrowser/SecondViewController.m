//
//  SecondViewController.m
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize nameLabel, definitionLabel, synonymLabel, wordToUse;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    nameLabel.text = wordToUse.Name;
    definitionLabel.text = wordToUse.Definition;
    synonymLabel.text = [NSString stringWithFormat:@"%@, %@", [wordToUse.Synonyms objectAtIndex:0], [wordToUse.Synonyms objectAtIndex:1]];

}




@end
