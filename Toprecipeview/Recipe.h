//
//  Recipe.h
//  LunchBox
//
//  Created by Sujit Bhandari on 12/10/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Recipe : NSObject

@property(strong, nonatomic)NSString *recipeName;
@property(strong,nonatomic)NSString *recipeDetail;
@property(strong, nonatomic)NSString *recipeIngredients;
@property(strong, nonatomic)NSString *recipeDirection;

-(instancetype) initWithDictionary:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
