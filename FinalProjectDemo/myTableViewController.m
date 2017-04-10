//
//  myTableViewController.m
//  FinalProjectDemo
//
//  Created by Madhu Mahat on 4/8/17.
//  Copyright © 2017 Madhu Mahat. All rights reserved.
//

#import "myTableViewController.h"

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
    
    //JSON Parsing implementation
    NSDictionary *myDict = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *mrData = [myDict objectForKey:@"MRData"];
    //fetching array inside
    NSArray *races = [[mrData objectForKey:@"RaceTable"] objectForKey:@"Races"];
    
    for(NSDictionary *tempValue in races){
        NSError *error;
        if(!error)
        {
            //NSString *s = [[tempValue [@"Circuit"] objectForKey:@"Location"] objectForKey:@"locality"];
        [myArray addObject:[[tempValue [@"Circuit"] objectForKey:@"Location"] objectForKey:@"locality"]];
        
        }
        
        
        
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
    cell.textLabel.text =@"Hello";
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
