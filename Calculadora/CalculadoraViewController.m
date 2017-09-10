//
//  CalculadoraViewController.m
//  Calculadora
//
//  Created by Eduardo Herrera on 17-08-12.
//  Copyright (c) 2012 Eduardo Herrera. All rights reserved.
//

#import "CalculadoraViewController.h"
#import "ModeloCerebroCalculadora.h"

@interface CalculadoraViewController()

@property (nonatomic) BOOL bComenzando;
@property (nonatomic,strong) ModeloCerebroCalculadora *cerebro;
@end

@implementation CalculadoraViewController

@synthesize display = _display;
@synthesize bComenzando = _bComenzando;
@synthesize cerebro = _cerebro;

- (ModeloCerebroCalculadora *)cerebro
{
    if (_cerebro == nil) _cerebro = [[ModeloCerebroCalculadora alloc] init];
    return _cerebro;
}
 
- (IBAction)numeroPresionado:(UIButton *)sender
{
    NSString *digito = sender.currentTitle;
if (self.bComenzando) {
    self.display.text = [self.display.text stringByAppendingString:digito];
} else
{
    self.display.text = digito;
    self.bComenzando = YES;
}
}
- (IBAction)enter {
    double numero = self.display.text.doubleValue;
    if (self.bComenzando) [self.cerebro entregaNumero:numero];
    double resultado = [self.cerebro calcular];
    NSString *pantalla = [NSString stringWithFormat:@"%g", resultado];
    self.display.text = pantalla;
    self.bComenzando = NO;
}
- (IBAction)borrar {
    [self.cerebro borrar];
    self.display.text = @"0";
}

- (IBAction)operador:(UIButton *)sender
    {
    double numero = self.display.text.doubleValue;
    if (self.bComenzando) [self.cerebro entregaNumero:numero];
    [self.cerebro madarOperacion:sender.currentTitle];
        self.bComenzando= NO;
}


@end
