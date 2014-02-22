//
//  CargosTVC.m
//  CatalogOn
//
//  Created by eduardo fulgencio on 19/02/14.
//  Copyright (c) 2014 Eduardo Fulgencio Comendeiro. All rights reserved.
//

#import "CargosTVC.h"
#import "AppDelegate.h"
#import "Cargo.h"
#import "CargoVC.h"

@interface CargosTVC ()

@end

@implementation CargosTVC

//(*) Añadir el método que refresca la tabla


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
        
        // LLama al método obtenerCargo declarado en AppDelegate para rellenar el NSFetchedResultsController
        self.datosFRC = [appDelegate obtenerCargos];
        self.datosFRC.delegate = self;
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Cargos";
    
    // Declaro el botón de añadir un nuevo cliente
    UIBarButtonItem *addButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self action:@selector(insertar:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
}

#pragma mark - Refresca la lista

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
    [self.tableView reloadData];
}


#pragma mark - Método Insertar CARGO

- (void)insertar:(id *)sender
{
    CargoVC *insertar = [[CargoVC alloc] init];
    [self.navigationController pushViewController:insertar animated:YES];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.datosFRC.sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    Cargo *cargo = [self.datosFRC objectAtIndexPath:indexPath];
    
    cell.textLabel.Text = cargo.codigo;
    cell.detailTextLabel.Text = cargo.descripcion;
    
    return cell;

}


// (*) añadir el contenido en el metodo didSelectRowAtIndexPath
// (*) para que muestre la vista CargoVC, en ClienteTVC está también el me´todo

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CargoVC *editar = [[CargoVC alloc] init];
    editar.editedObject = [self.datosFRC objectAtIndexPath:indexPath];
    [self.navigationController pushViewController:editar animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
