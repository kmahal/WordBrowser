//
//  SecondViewController.h
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Word.h"
#import "ThirdVCDelegate.h"

typedef void (^reloadTableBLock) (Word*, NSString*);

@interface SecondViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ThirdVCDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *definitionLabel;
@property (weak, nonatomic) IBOutlet UILabel *synonymLabel;
@property (weak, nonatomic) IBOutlet UITableView *mySecondTableView;

@property (strong, nonatomic) reloadTableBLock reloadFirstTableBlock;

@property (strong, nonatomic) Word *wordToUse;

@property (strong, nonatomic) id <ThirdVCDelegate> delegate;

-(void)openNew;

@end
