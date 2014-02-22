//
//  ClientesTVC.m
//  CatalogOn
//
//  Created by eduardo fulgencio on 19/02/14.
//  Copyright (c) 2014 Eduardo Fulgencio Comendeiro. All rights reserved.
//

#import "ClientesTVC.h"
#import "AppDelegate.h"
#import "Cliente.h"
#import "ClienteVC.h"

@interface ClientesTVC ()

@end

@implementation ClientesTVC


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
        AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
        
        // LLama al método obtenerCliente declarado en AppDelegate para rellenar el NSFetchedResultsController
        self.datosFRC = [appDelegate obtenerClientes];
        self.datosFRC.delegate = self;
    }
    return self;
}

#pragma mark - viewDidLoad

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Clientes";
    
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


#pragma mark - Método Insertar CLIENTE

- (void)insertar:(id *)sender
{
    ClienteVC *insertar = [[ClienteVC alloc] init];
    [self.navigationController pushViewController:insertar animated:YES];
}


#pragma mark - Table view data source
#pragma mark - Secciones

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma  mark - Filas de la Tabla

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.datosFRC.sections objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


#pragma mark - Define el estilo de la celda

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    Cliente *cliente = [self.datosFRC objectAtIndexPath:indexPath];
    
    cell.textLabel.Text = cliente.codigo;
    cell.detailTextLabel.Text = cliente.descripcion;
    
    return cell;
}

#pragma mark - Editar CLIENTE

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ClienteVC *editar = [[ClienteVC alloc] init];
    editar.editedObject = [self.datosFRC objectAtIndexPath:indexPath];
    [self.navigationController pushViewController:editar animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
