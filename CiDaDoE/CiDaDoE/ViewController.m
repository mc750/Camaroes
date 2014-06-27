//
//  ViewController.m
//  CiDaDoE
//
//  Created by Luiz Fernando on 5/13/14.
//  Copyright (c) 2014 lf. All rights reserved.
//

#import "ViewController.h"

#define finalXVerPedidos 22
#define finalXCadastrarPedidoIcon 174
#define finalXCadastrarPedidoButton 155

@interface ViewController ()

@property (strong, nonatomic) UIImageView *darkCity;
@property (strong, nonatomic) UIImageView *brightCity;

@property (weak, nonatomic) IBOutlet UIButton *verPedidosIcon;
@property (weak, nonatomic) IBOutlet UIButton *verPedidosButton;

@property (weak, nonatomic) IBOutlet UIButton *cadastrarPedidoIcon;
@property (weak, nonatomic) IBOutlet UIButton *cadastrarPedidoButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.darkCity = [[UIImageView alloc] initWithFrame:CGRectMake(-300, 24, 320, 480)];
    self.darkCity.image = [UIImage imageNamed:@"darkCity"];
    
    
    self.brightCity = [[UIImageView alloc] initWithFrame:CGRectMake(400, 24, 320, 480)];
    self.brightCity.image = [UIImage imageNamed:@"brightCity"];
    
    [self.view addSubview:self.darkCity];
    [self.view addSubview:self.brightCity];
}

-(void) viewDidAppear:(BOOL)animated {
    


    [UIView animateWithDuration:0.7f
                              delay:0.3f
             usingSpringWithDamping:1000
              initialSpringVelocity:20
                            options:0
                         animations:^{
                               self.darkCity.frame = CGRectMake(0, self.darkCity.frame.origin.y, self.darkCity.frame.size.width, self.darkCity.frame.size.height);
                               self.brightCity.frame = CGRectMake(0, self.brightCity.frame.origin.y, self.brightCity.frame.size.width, self.brightCity.frame.size.height);
                       }
                       completion:^(BOOL finished) {
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
