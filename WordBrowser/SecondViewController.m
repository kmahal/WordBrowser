//
//  SecondViewController.m
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    NSArray *synonymArray;
    int rowTapped;
}

@end

@implementation SecondViewController

@synthesize nameLabel, definitionLabel, synonymLabel, wordToUse, mySecondTableView;


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
    
    [self.navigationController pushViewController:anotherVC animated:YES];
    
    
}



@end
