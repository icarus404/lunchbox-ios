//
//  ViewController.h
//  LunchBox
//
//  Created by Sujit Bhandari on 14/9/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property(strong, nonatomic) NSMutableArray *arritems;


- (IBAction)Notes:(UIBarButtonItem *)sender;

@end

