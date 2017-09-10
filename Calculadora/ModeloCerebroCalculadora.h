//
//  ModeloCerebroCalculadora.h
//  Calculadora
//
//  Created by Eduardo Herrera on 18-08-12.
//  Copyright (c) 2012 Eduardo Herrera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModeloCerebroCalculadora : NSObject

-(void) entregaNumero:(double)numero;
-(void) madarOperacion:(NSString *)operador;
-(double) calcular;
-(void) borrar;

@end
