//
//  LeftViewController.h
//  LunchBox
//
//  Created by Sujit Bhandari on 14/9/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface LeftViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tblview;

@property(strong)NSMutableArray *yourrecipearray;

@property (strong,nonatomic) AppDelegate *delegate;


@end

NS_ASSUME_NONNULL_END
