//
//  ThirdViewController.m
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import "ThirdViewController.h"
#import "Word.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

@synthesize nameField, definitionField, thirdVCDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIBarButtonItem * cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(closeView)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
    UIBarButtonItem * saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveWord)];
    self.navigationItem.rightBarButtonItem = saveButton;
    
}



-(void)closeView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)saveWord{
    
    Word *passInWord = [[Word alloc] init];
    
    passInWord.Name = [NSString stringWithFormat:@"%@", nameField.text];
    passInWord.Definition = [NSString stringWithFormat:@"%@", definitionField.text];
    
    
    [self.thirdVCDelegate thirdVCDelegate:self withWord:passInWord];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
