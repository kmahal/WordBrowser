//
//  SecondViewController.m
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()
{
    NSArray *synonymArray;
    int rowTapped;
}

@end

@implementation SecondViewController

@synthesize nameLabel, definitionLabel, synonymLabel, wordToUse, mySecondTableView, reloadFirstTableBlock;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    mySecondTableView.delegate = self;
    mySecondTableView.dataSource = self;

    nameLabel.text = wordToUse.Name;
    definitionLabel.text = wordToUse.Definition;
    //synonymLabel.text = [NSString stringWithFormat:@"%@, %@", [wordToUse.Synonyms objectAtIndex:0], [wordToUse.Synonyms objectAtIndex:1]];
    
    synonymLabel.hidden = YES;
    
    synonymArray = wordToUse.Synonyms;
    
    
    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(openNew)];
    self.navigationItem.rightBarButtonItem = addButton;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [synonymArray count];
}


-(UITableViewCell *)tableView:(UITableView *)tblvw cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [mySecondTableView dequeueReusableCellWithIdentifier:@"123"];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"123"];
    }
    
    cell.textLabel.text =  [synonymArray[indexPath.row] Name];
    
    return cell;
    
}


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Synonyms";
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    rowTapped = indexPath.row;
    
    SecondViewController *anotherVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HITHERE"];
    anotherVC.wordToUse = [synonymArray objectAtIndex:indexPath.row];
    anotherVC.delegate = self;
    
    [self.navigationController pushViewController:anotherVC animated:YES];
    
    
}

-(void)openNew{
    [self performSegueWithIdentifier:@"ToNewAgain" sender:self];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    UINavigationController *navvc = segue.destinationViewController;
    ThirdViewController *thirdVC = [navvc viewControllers][0];
        thirdVC.thirdVCDelegate = self;
    
    
}

-(void)thirdVCDelegate:(id)view withWord:(Word *)word{
    
    //reloadFirstTableBlock(word, word.Name);
    [self.delegate thirdVCDelegate:self withWord:word];
    
}

@end
