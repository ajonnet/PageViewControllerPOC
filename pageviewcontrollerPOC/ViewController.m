//
//  ViewController.m
//  pageviewcontrollerPOC
//
//  Created by Amit Jain on 02/01/15.
//  Copyright (c) 2015 ajonnet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"viewDidLoad %@ [%d]",self,_idx);
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"ViewWillAppear %@ [%d]",self,_idx);
    
    self.lbl.text = [NSString stringWithFormat:@"%d",(int)_idx];
}

-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"ViewDidAppear %@ [%d]",self,_idx);
}

-(void)setIdx:(int)idx
{
    NSLog(@"setIdx called %@ [%d] %@",self,idx,self.lbl?@"lbl":nil);
    _idx = idx;
    
    self.lbl.text = [NSString stringWithFormat:@"%d",(int)idx];
}

@end
