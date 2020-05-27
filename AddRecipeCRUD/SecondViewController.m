//
//  SecondViewController.m
//  LunchBox
//
//  Created by Sujit Bhandari on 22/9/19.
//  Copyright © 2019 Sujit Bhandari. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
@synthesize recipedb;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.recipedb)
    {
        [self.txttitle setText :[self.recipedb valueForKey:@"title"]]; //when 2nd view controller runs txt title is replaced by title from coredb
        [self.txtingredients setText:[self.recipedb valueForKey:@"ingredients"]];
        [self.txtdirection setText:[self.recipedb valueForKey:@"direction"]];
    }
}

-(NSManagedObjectContext *)managedobjectcontext
{
    
    NSManagedObjectContext *context = nil;
    _delegate = (AppDelegate *) [[UIApplication sharedApplication]delegate]; //delegate is delegate of app delegate ->assigned to use property of delegate
    
    if([_delegate respondsToSelector:@selector(persistentContainer)]) {
        context = _delegate.persistentContainer.viewContext;    // these are properties from appdelegate cmd click on persistentContainer and viewContext and jump to definition to view
    }
    
    return context;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



    
    /* save ko ho hai
  
*/

- (IBAction)btnsave:(UIButton *)sender {
    
    NSManagedObjectContext *context = [self managedobjectcontext];
    
    if (self.recipedb) {
        //update existing data on device
        [self.recipedb setValue:self.txttitle.text forKey:@"title"];
        
        [self.recipedb setValue:self.txtingredients.text forKey:@"ingredients"];
        
        [self.recipedb setValue:self.txtdirection.text forKey:@"direction"];
        
        
    }
    else {
        //create new datafor device-> kind of like a creating new data set
        NSManagedObject *newdevice = [NSEntityDescription insertNewObjectForEntityForName:@"Yourrecipe" inManagedObjectContext:context]; //it will hold the data if if case doesn't work, Yourrecipe is my coredb entity
        
        [newdevice setValue:self.txttitle.text forKey:@"title"];
        
        [newdevice setValue:self.txtingredients.text forKey:@"ingredients"];
        
        [newdevice setValue:self.txtdirection.text forKey:@"direction"];
        
        
        
    }
    NSError *error = nil;
    if(![context save:&error])
    {
        NSLog(@"cannot save changes %@ %@", error,[error localizedDescription]); //localized description is a property of error, system provided
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)btnback:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
