//
//  Recipe.m
//  LunchBox
//
//  Created by Sujit Bhandari on 12/10/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import "Recipe.h"

@implementation Recipe
-(instancetype)initWithDictionary:(NSDictionary *)dic
{
   
    self.recipeName = [dic objectForKey:@"Name"];
    self.recipeIngredients = [dic objectForKey:@"Ingredients"];
    self.recipeDirection = [dic objectForKey:@"Direction"];
    
    return self;
}

@end
