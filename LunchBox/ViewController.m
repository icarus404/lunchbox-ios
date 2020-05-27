//
//  ViewController.m
//  LunchBox
//
//  Created by Sujit Bhandari on 14/9/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import "ViewController.h"
#import "LeftViewController.h"
#import "RightViewController.h"
#import "Recipe.h"
#import "TableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Lunch Box";
    
    self.arritems = [[NSMutableArray alloc]init];
    NSString *filePathBundle = [[NSBundle mainBundle]pathForResource:@"RecipeData" ofType:@"plist"];
    
    NSDictionary *root = [NSDictionary dictionaryWithContentsOfFile:filePathBundle];
 
    NSArray *recipe = [root objectForKey:@"Recipe"];
    for(NSDictionary *dic in recipe)
    {
        Recipe *r = [[Recipe alloc]initWithDictionary:dic];
        [self.arritems addObject:r];
        
    }
    
    
    
  

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return _arritems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   
    Recipe *recipeDetail = [self.arritems objectAtIndex:indexPath.row];
    cell.lblName.text = recipeDetail.recipeName;
    return cell;
    
}
 


- (IBAction)Notes:(UIBarButtonItem *)sender {
    LeftViewController *left = [self.storyboard instantiateViewControllerWithIdentifier:@"left"];
    [self.navigationController pushViewController:left animated:YES];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSLog(@"%ld",(long)indexPath.row);
   RightViewController *detail =[self.storyboard instantiateViewControllerWithIdentifier:@"RightViewController"];
    
   // passing data
    detail.Data = self.arritems[indexPath.row];
    [self.navigationController pushViewController:detail animated:true];
    
    
}



@end


