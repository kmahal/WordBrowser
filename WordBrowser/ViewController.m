//
//  ViewController.m
//  WordBrowser
//
//  Created by Kabir Mahal on 10/2/13.
//  Copyright (c) 2013 Kabir Mahal. All rights reserved.
//

#import "ViewController.h"
#import "Word.h"
#import "SecondViewController.h"

@interface ViewController ()
{
    NSMutableDictionary *dict;
    int rowTapped;
}


@end


@implementation ViewController

@synthesize myTableView;

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    
    if (self){
        dict = [[NSMutableDictionary alloc] init];
       
    }
    
    return self;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    myTableView.delegate = self;
    myTableView.dataSource = self;

    Word *pizza = [[Word alloc] initWithName:@"pizza" andDefinition:@"sauce and cheese on bread"];
    Word *sausage = [[Word alloc] initWithName:@"sausage" andDefinition:@"meat and fat in casing"];
    Word *bread = [[Word alloc] initWithName:@"bread" andDefinition:@"grain and yeast that rises"];
    Word *cheese = [[Word alloc] initWithName:@"cheese" andDefinition:@"milk and some fermented shit"];
    Word *water = [[Word alloc] initWithName:@"water" andDefinition:@"h20"];

    Word *car = [[Word alloc] initWithName:@"car" andDefinition:@"metal on wheels"];
    Word *tire = [[Word alloc] initWithName:@"tire" andDefinition:@"circular object that things use to move quickly"];
    Word *danger = [[Word alloc] initWithName:@"danger" andDefinition:@"danga danga!"];
    Word *loyalty = [[Word alloc] initWithName:@"loyalty" andDefinition:@"a rewards program at Safeway"];
    Word *love = [[Word alloc] initWithName:@"love" andDefinition:@"chemical reaction in your brain that makes you do dumb shit"];

    pizza.Synonyms = @[@"flatbread", @"italian food"];
    sausage.Synonyms = @[@"meat pole", @"seasoned bar meat"];
    bread.Synonyms = @[@"raised grain", @"food"];
    cheese.Synonyms = @[@"molded milk", @"curds"];
    water.Synonyms = @[@"agua", @"fresco"];
    
    car.Synonyms = @[@"automobile", @"gardi"];
    tire.Synonyms = @[@"wheel", @"round thing"];
    danger.Synonyms = @[@"clear", @"present"];
    loyalty.Synonyms = @[@"love", @"relation"];
    love.Synonyms = @[@"pyaar", @"ishq"];
    
    
    [dict setObject:pizza forKey:pizza.Name];
    [dict setObject:sausage forKey:sausage.Name];
    [dict setObject:bread forKey:bread.Name];
    [dict setObject:cheese forKey:cheese.Name];
    [dict setObject:water forKey:water.Name];
    
    [dict setObject:car forKey:car.Name];
    [dict setObject:tire forKey:tire.Name];
    [dict setObject:danger forKey:danger.Name];
    [dict setObject:loyalty forKey:loyalty.Name];
    [dict setObject:love forKey:love.Name];
    
    
    NSLog(@"%@", dict);

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dict count];
}


-(UITableViewCell *)tableView:(UITableView *)tblvw cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [myTableView dequeueReusableCellWithIdentifier:@"abc"];
    
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"abc"];
    }
    
    cell.textLabel.text = [[dict allKeys] objectAtIndex:indexPath.row];
    
    
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    rowTapped = indexPath.row;
    [self performSegueWithIdentifier:@"ToSecond" sender:self];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    SecondViewController *secondVC = segue.destinationViewController;
    
    secondVC.wordToUse = [dict objectForKey:[[dict allKeys] objectAtIndex:rowTapped]];
    
    
}






@end
