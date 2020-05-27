//
//  RightViewController.h
//  LunchBox
//
//  Created by Sujit Bhandari on 15/9/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <CoreData/CoreData.h>
#import "Recipe.h"
NS_ASSUME_NONNULL_BEGIN

@interface RightViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *txtIngredients;

@property (weak, nonatomic) IBOutlet UITextView *txtDirection;


@property(strong, nonatomic) NSDictionary *Data;



@end

NS_ASSUME_NONNULL_END
