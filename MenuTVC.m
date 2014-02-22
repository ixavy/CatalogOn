//
//  MenuTVC.m
//  CatalogOn
//
//  Created by eduardo fulgencio on 18/02/14.
//  Copyright (c) 2014 Eduardo Fulgencio Comendeiro. All rights reserved.
//

#import "MenuTVC.h"
#import "ClientesTVC.h"
#import "CargosTVC.h"

@interface MenuTVC ()
@property(strong, atomic) NSString *contenido;
@end

@implementation MenuTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Menú";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Menú";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *result = nil;
    
    static NSString *identificadorCelda = @"celdaDato";
    
    result = [tableView dequeueReusableCellWithIdentifier:identificadorCelda];
    
    if (result == nil){
        result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificadorCelda];
    }
    
    result.accessoryType = UITableViewCellAccessoryNone;
    
    if(indexPath.section == 0){
        if(indexPath.row == 0) {
            self.contenido = @"CLIENTES";
        }else if(indexPath.row == 1){
            self.contenido = @"CARGOS";
        }
    }
        
    result.textLabel.text = self.contenido;
    
    return result;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0){
        if(indexPath.row == 0){
            ClientesTVC *clientes = [[ClientesTVC alloc] initWithStyle:UITableViewStylePlain];
            [self.navigationController pushViewController:clientes animated:YES];
        }else if(indexPath.row == 1){
            
            CargosTVC *cargos = [[CargosTVC alloc] initWithStyle:UITableViewStylePlain];
            [self.navigationController pushViewController:cargos animated:YES];
        }
    }
}

@end
