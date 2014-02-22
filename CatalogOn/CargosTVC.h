//
//  CargosTVC.h
//  CatalogOn
//
//  Created by eduardo fulgencio on 19/02/14.
//  Copyright (c) 2014 Eduardo Fulgencio Comendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CargosTVC : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *datosFRC;

@end
