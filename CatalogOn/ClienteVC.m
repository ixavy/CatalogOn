//
//  ClienteVC.m
//  CatalogOn
//
//  Created by eduardo fulgencio on 19/02/14.
//  Copyright (c) 2014 Eduardo Fulgencio Comendeiro. All rights reserved.
//

#import "ClienteVC.h"
#import "AppDelegate.h"

@interface ClienteVC ()
@property (nonatomic) CGRect cgrLabel;
@property (nonatomic) CGRect cgrInput;
@property (nonatomic) int incremento;
@property (nonatomic, strong) UIBarButtonItem *barButtonAdd;
@end

@implementation ClienteVC

@synthesize cgrLabel, cgrInput;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  
    self.incremento = 35;
    self.cgrLabel = CGRectMake(60.0f, 100.0f, 120.0, 31.0f);
    self.cgrInput = CGRectMake(180.0f, 100.0f, 300.0, 31.0f);
    
    self.lbCodigo = [[UILabel alloc] initWithFrame:self.cgrLabel];
    self.lbCodigo.text = @"Código:";
    self.lbCodigo.font = [UIFont boldSystemFontOfSize:16.0f];
    self.lbCodigo.textColor = [UIColor orangeColor];
    [self.view addSubview:self.lbCodigo];
    
    self.tfCodigo = [[UITextField alloc] initWithFrame:self.cgrInput];
    self.tfCodigo.placeholder = @"Introducir el código";
    self.tfCodigo.font = [UIFont systemFontOfSize:16.0f];
    self.tfCodigo.borderStyle = UITextBorderStyleRoundedRect;
    self.tfCodigo.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tfCodigo.delegate = self;
    [self.view addSubview:self.tfCodigo];
    
    cgrLabel.origin.y += self.incremento;
    cgrInput.origin.y += self.incremento;
    
    self.lbDescripcion = [[UILabel alloc] initWithFrame:self.cgrLabel];
    self.lbDescripcion.text = @"Descripción:"; // puedo añadir la imágenes de como quedarán los pins
    self.lbDescripcion.font = [UIFont boldSystemFontOfSize:16.0f];
    self.lbDescripcion.textColor = [UIColor orangeColor];
    self.lbDescripcion.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.lbDescripcion];
    
    self.tfDescripcion = [[UITextField alloc] initWithFrame:cgrInput];
    self.tfDescripcion.font = [UIFont systemFontOfSize:18.0f];
    self.tfDescripcion.placeholder = @"Introduce breve descripción";
    self.tfDescripcion.borderStyle = UITextBorderStyleRoundedRect;
    self.tfDescripcion.textColor = [UIColor blueColor];
    self.tfDescripcion.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.tfDescripcion.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:self.tfDescripcion];

    
    self.barButtonAdd = [[UIBarButtonItem alloc] initWithTitle:@"Grabar" style:UIBarButtonItemStyleBordered
                                                        target:self action:@selector(grabar)];
    
    self.navigationItem.rightBarButtonItem = self.barButtonAdd;
}


#pragma mark - Vies Did Appear

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    if(self.editedObject != nil)
    {
        self.tfCodigo.text = [self.editedObject valueForKey:@"codigo"];
        self.tfDescripcion.text = [self.editedObject valueForKey:@"descripcion"];
        
    } else {
        [self.tfCodigo becomeFirstResponder];
    }
}

#pragma mark - Grabar

- (void) grabar
{
    AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    NSError *savingError = nil;
    
    if (self.validar){
        if(self.editedObject == nil){
              self.editedObject = [NSEntityDescription insertNewObjectForEntityForName:@"Cliente" inManagedObjectContext:managedObjectContext];
        }
 
            [self.editedObject setValue:self.tfCodigo.text forKey:@"codigo"];
            [self.editedObject setValue:self.tfDescripcion.text forKey:@"descripcion"];
            
            if ([managedObjectContext save:&savingError]){
                [self.navigationController popViewControllerAnimated:YES];
            } else {
                NSLog(@"Error al grabar managed object context.");
            }

    }
}


#pragma mark - Método Validar, código y descripción son campos obligatorios

- (Boolean) validar
{
    Boolean resultado = TRUE;
    
    // Eliminamos los espacion vacios
    self.tfCodigo.text = [self.tfCodigo.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    self.tfDescripcion.text = [self.tfDescripcion.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([self.tfCodigo.text isEqualToString:@""]) {
        resultado = FALSE;
    }else if([self.tfDescripcion.text isEqualToString:@""]) {
        resultado = FALSE;
    }
    
    return resultado;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
