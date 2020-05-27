//
//  LeftViewController.m
//  LunchBox
//
//  Created by Sujit Bhandari on 14/9/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import "LeftViewController.h"
#import "SecondViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

-(NSManagedObjectContext *)managedobjectcontext
{
    
    NSManagedObjectContext *context = nil;
    _delegate = (AppDelegate *) [[UIApplication sharedApplication]delegate]; //delegate is delegate of app delegate ->assigned to use property of delegate
    
    if([_delegate respondsToSelector:@selector(persistentContainer)]) {
        context = _delegate.persistentContainer.viewContext;    // these are properties from appdelegate cmd click on persistentContainer and viewContext and jump to definition to view
    }
    
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //fetch the devices from persistent data store
    NSManagedObjectContext *managedobjectcontext = [self managedobjectcontext];
    
    NSFetchRequest *fetchrequest = [[NSFetchRequest alloc]initWithEntityName:@"Yourrecipe"];
    self.yourrecipearray = [[managedobjectcontext executeFetchRequest:fetchrequest error:nil]mutableCopy];
    
    [self.tblview reloadData];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Your Recipe";

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.yourrecipearray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cells =[tableView dequeueReusableCellWithIdentifier:@"cells" forIndexPath:indexPath];

    NSManagedObject *device = [self.yourrecipearray objectAtIndex:indexPath.row];
    
    [cells.textLabel setText:[NSString stringWithFormat:@"%@",[device valueForKey:@"title"]]];
    
    
    return cells;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return YES; //permisson to edit-> yes or no
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSManagedObjectContext *context = [self managedobjectcontext];
    
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        //delete object from data base
        [context deleteObject:[self.yourrecipearray objectAtIndex:indexPath.row]];
        
        NSError *error = nil;
        
        if(![context save:&error])
        {
            NSLog(@"can't delete this %@ %@", error, [error localizedDescription]);
            return;
        }
        
        //remove data from table view too
        [self.yourrecipearray removeObjectAtIndex:indexPath.row]; //remove data from row
        
        [self.tblview deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade]; // swipe action with fading animation
    
    
    
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"updaterecipe"])
    {
        NSManagedObject *selecteddevice = [self.yourrecipearray objectAtIndex:[[self.tblview indexPathForSelectedRow]row]];
        
        SecondViewController *destination = segue.destinationViewController;
        destination.recipedb = selecteddevice;
    }
    
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
