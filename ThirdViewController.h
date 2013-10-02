//
//  ThirdViewController.h
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThirdVCDelegate.h"

@interface ThirdViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *definitionField;

@property (strong, nonatomic) id <ThirdVCDelegate> thirdVCDelegate;

-(void)saveWord;
-(void)closeView;

@end
