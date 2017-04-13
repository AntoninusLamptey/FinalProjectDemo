//
//  myTableViewController.m
//  FinalProjectDemo
//
//  Created by Madhu Mahat on 4/8/17.
//  Copyright © 2017 Madhu Mahat. All rights reserved.
//

#import "myTableViewController.h"
#import <dispatch/dispatch.h>


@interface myTableViewController (){
    NSMutableArray *myArray;
    NSDictionary *myDict;
}


@end

@implementation myTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myArray = [[NSMutableArray alloc]init];
    //Getting the URL access
    NSURL *myUrl = [NSURL URLWithString:@"http://ergast.com/api/f1/current.json"];
    //Assign the data from the URL
    NSData *myData = [NSData dataWithContentsOfURL:myUrl];
    
    
    //Parsing JSON and adding data to relevant array
    myDict = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *races = [[[myDict objectForKey:@"MRData"] objectForKey:@"RaceTable"] objectForKey:@"Races"];
    for(NSDictionary *tempValue in races){
        NSError *error;
        if(!error)
        {
            //NSString *s = [[tempValue [@"Circuit"] objectForKey:@"Location"] objectForKey:@"locality"];
        [myArray addObject:[[tempValue [@"Circuit"] objectForKey:@"Location"] objectForKey:@"locality"]];
        
        }
        [self.tableView reloadData];
        
        
    }
    

    //self..text = [myArray componentsJoinedByString:@"\n"];
    NSLog(@"%@", [myArray componentsJoinedByString:@"\n"]);
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return myArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(cell== nil){
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
   //cell.textLabel.text = [myArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [myArray objectAtIndex:indexPath.row];
    return cell;
}




@end
