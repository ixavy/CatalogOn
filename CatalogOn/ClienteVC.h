//
//  ClienteVC.h
//  CatalogOn
//
//  Created by eduardo fulgencio on 19/02/14.
//  Copyright (c) 2014 Eduardo Fulgencio Comendeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClienteVC : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *lbCodigo;
@property (nonatomic, strong) UILabel *lbDescripcion;

@property (nonatomic, strong) UITextField *tfCodigo;
@property (nonatomic, strong) UITextField *tfDescripcion;

@property (nonatomic, retain) NSManagedObject *editedObject;

@end
