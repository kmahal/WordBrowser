//
//  ViewController.h
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThirdVCDelegate.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, ThirdVCDelegate>


@property (weak, nonatomic) IBOutlet UITableView *myTableView;

-(void)openNew;

@end
