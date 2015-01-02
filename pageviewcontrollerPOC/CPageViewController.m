//
//  CPageViewController.m
//  pageviewcontrollerPOC
//
//  Created by Amit Jain on 02/01/15.
//  Copyright (c) 2015 ajonnet. All rights reserved.
//

#import "CPageViewController.h"
#import "ViewController.h"

@interface CPageViewController () <UIPageViewControllerDataSource,UIPageViewControllerDelegate>
{
    NSArray *vcArr;
}

@end

@implementation CPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0; i<3; i++) {
        ViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
        [arr addObject:vc];
    }
    vcArr = arr;
    
    self.dataSource = self;
    self.delegate = self;
    
    [self setViewControllers:@[vcArr[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

-(void)viewDidAppear:(BOOL)animated
{
    for (int i= 0;i < vcArr.count ; i++) {
        ViewController *vc = vcArr[i];
        vc.idx = i;
    }
}

#pragma mark - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(ViewController *)viewController
{
    NSInteger idx = [vcArr indexOfObject:viewController];
    
    //Next Idx
    idx--;
    if (idx < 0) {
        idx = vcArr.count - 1;
    }
    
    ViewController *nextVC = vcArr[idx];
    nextVC.idx = viewController.idx - 1;
    
    return nextVC;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(ViewController *)viewController
{
    NSInteger idx = [vcArr indexOfObject:viewController];
    
    //Next Idx
    idx++;
    if (idx > (vcArr.count -1)) {
        idx = 0;
    }
    
    ViewController *nextVC = vcArr[idx];
    nextVC.idx = viewController.idx + 1;
    
    return nextVC;
}

#pragma mark - UIPageViewControllerDelegate
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    NSLog(@"willTransistionto: %@",pendingViewControllers[0]);
    
    ViewController *vc = pendingViewControllers[0];
    
    
}


- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed
{
    NSLog(@"didFinishTransition: %@",pageViewController.viewControllers[0]);
}
@end
