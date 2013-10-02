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
#import "ThirdViewController.h"

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
    Word *flatbread = [[Word alloc] initWithName:@"flatbread" andDefinition:@"kinda like pizza"];
    Word *breadAndSauce = [[Word alloc] initWithName:@"bread and sauce" andDefinition:@"kinda like pizza"];
    
    Word *sausage = [[Word alloc] initWithName:@"sausage" andDefinition:@"meat and fat in casing"];
    Word *meatStick = [[Word alloc] initWithName:@"Meat Stick" andDefinition:@"kinda like sausage"];
    Word *seasonedShreds = [[Word alloc] initWithName:@"seasonedShreds" andDefinition:@"kinda like sausage"];
    
    Word *bread = [[Word alloc] initWithName:@"bread" andDefinition:@"grain and yeast that rises"];
    Word *raisedGrain = [[Word alloc] initWithName:@"raised grains" andDefinition:@"kinda like bread"];
    Word *loaf = [[Word alloc] initWithName:@"loaf" andDefinition:@"kinda like bread"];

    Word *cheese = [[Word alloc] initWithName:@"cheese" andDefinition:@"milk and some fermented shit"];
    Word *curd = [[Word alloc] initWithName:@"curd" andDefinition:@"kinda like cheese"];
    Word *fermentedMilk = [[Word alloc] initWithName:@"fermented milk" andDefinition:@"kinda like cheese"];

    Word *water = [[Word alloc] initWithName:@"water" andDefinition:@"h20"];
    Word *h20 = [[Word alloc] initWithName:@"h20" andDefinition:@"it's water"];
    Word *agua = [[Word alloc] initWithName:@"agua" andDefinition:@"it's water in spanish"];


    pizza.Synonyms = @[flatbread, breadAndSauce];
    sausage.Synonyms = @[meatStick, seasonedShreds];
    bread.Synonyms = @[raisedGrain, loaf];
    cheese.Synonyms = @[curd, fermentedMilk];
    water.Synonyms = @[h20, agua];
    
    flatbread.Synonyms = @[pizza, breadAndSauce];
    meatStick.Synonyms = @[sausage, seasonedShreds];
    raisedGrain.Synonyms = @[bread, loaf];
    curd.Synonyms = @[cheese, fermentedMilk];
    h20.Synonyms = @[water, agua];
    breadAndSauce.Synonyms = @[flatbread, pizza];
    seasonedShreds.Synonyms = @[meatStick, sausage];
    loaf.Synonyms = @[raisedGrain, bread];
    fermentedMilk.Synonyms = @[curd, cheese];
    agua.Synonyms = @[h20, water];
    
    
    [dict setObject:pizza forKey:pizza.Name];
    [dict setObject:sausage forKey:sausage.Name];
    [dict setObject:bread forKey:bread.Name];
    [dict setObject:cheese forKey:cheese.Name];
    [dict setObject:water forKey:water.Name];
    
    
    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(openNew)];
    self.navigationItem.rightBarButtonItem = addButton;
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
    
    if ([segue.identifier isEqualToString:@"ToSecond"]){
        
        SecondViewController *secondVC = segue.destinationViewController;
        secondVC.wordToUse = [dict objectForKey:[[dict allKeys] objectAtIndex:rowTapped]];
        secondVC.delegate = self;
        
       /* secondVC.reloadFirstTableBlock = ^(Word *word, NSString *value){
          
            [dict setObject:word forKey:value];
            [myTableView reloadData];
            
        }; */
        
        
        
    }else if ([segue.identifier isEqualToString:@"ToNew"]){
        UINavigationController *navvc = segue.destinationViewController;
        ThirdViewController *thirdVC = [navvc viewControllers][0];
        thirdVC.thirdVCDelegate = self;
    }
    
}

-(void)openNew{
    [self performSegueWithIdentifier:@"ToNew" sender:self];
}


-(void)thirdVCDelegate:(id)view withWord:(Word *)word {
    [dict setObject:word forKey:word.Name];
    [myTableView reloadData];
}




@end
