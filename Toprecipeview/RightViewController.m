//
//  RightViewController.m
//  LunchBox
//
//  Created by Sujit Bhandari on 15/9/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import "RightViewController.h"

@interface RightViewController ()

@end

@implementation RightViewController
@synthesize txtIngredients;
@synthesize txtDirection;
@synthesize Data;

- (void)viewDidLoad {
    [super viewDidLoad];
   
      [self.txtIngredients setText :[self.Data valueForKey:@"recipeIngredients"]];
       [self.txtDirection setText:[self.Data valueForKey:@"recipeDirection"]];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
