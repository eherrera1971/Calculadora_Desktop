//
//  ModeloCerebroCalculadora.m
//  Calculadora
//
//  Created by Eduardo Herrera on 18-08-12.
//  Copyright (c) 2012 Eduardo Herrera. All rights reserved.
//

#import "ModeloCerebroCalculadora.h"

@interface ModeloCerebroCalculadora()
@property (nonatomic,strong) NSMutableArray *stackDeNumeros;
@end

@implementation ModeloCerebroCalculadora

@synthesize stackDeNumeros =_stackDeNumeros;

- (NSMutableArray *)stackDeNumeros
{
    if (_stackDeNumeros==nil) _stackDeNumeros = [[NSMutableArray alloc] init]; //crear un puntero
    return _stackDeNumeros;
}
- (double) traerNumero
{
    NSNumber *numeroTemporal = self.stackDeNumeros.lastObject;
    if (numeroTemporal !=nil) [self.stackDeNumeros removeLastObject];
    return numeroTemporal.doubleValue;
}
- (NSString *) traerSigno
{
    NSString *signo = self.stackDeNumeros.lastObject;
    if (signo !=nil) [self.stackDeNumeros removeLastObject];
    return signo;
}
-(void) entregaNumero:(double)numero
{
    NSNumber *numeroTemporal = [NSNumber numberWithDouble:numero];
    [self.stackDeNumeros addObject:numeroTemporal];
}
-(void) madarOperacion:(NSString *)operador
{
    [self.stackDeNumeros addObject:operador];
}
-(double) calcular
{
    double resultado = 0;
    double a = [self traerNumero];
    NSString *signo = [self traerSigno];
    double b = [self traerNumero];
    if ([signo isEqualToString:@"+"])
    {
        resultado = a + b;
    }
    [self entregaNumero:resultado];
    return resultado;
}

-(void) borrar
{
    [self.stackDeNumeros removeAllObjects];
}

@end
