//
//  ViewController.m
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import "ViewController.h"
#import "CBSecretVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)btnGoClick:(id)sender {
    CBSecretVC *vc = [[CBSecretVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
