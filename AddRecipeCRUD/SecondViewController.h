//
//  SecondViewController.h
//  LunchBox
//
//  Created by Sujit Bhandari on 22/9/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *txttitle;


@property (strong, nonatomic) IBOutlet UITextView *txtingredients;

@property (strong, nonatomic) IBOutlet UITextView *txtdirection;

@property(strong, nonatomic) AppDelegate *delegate;

- (IBAction)btnsave:(UIButton *)sender;


- (IBAction)btnback:(UIButton *)sender;


@property(strong)NSManagedObject *recipedb;


@end

NS_ASSUME_NONNULL_END
