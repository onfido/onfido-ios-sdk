//
//  ViewController.m
//  SampleAppObjC
//
//  Created by Anurag Ajwani on 22/11/2017.
//  Copyright © 2017 onfido. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    SampleAppOnfidoWrapper *onfidoWrapper; // Remember to keep a strong reference to the your OnfidoWrapper, otherwise the Wrapper as the OnfidoFlow inside will get deallocated and the flow won't work
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)verifyUser:(id)sender {
    
    onfidoWrapper = [[SampleAppOnfidoWrapper alloc] init];
    onfidoWrapper.delegate = self;
    [onfidoWrapper getViewController: ^void (UIViewController *vc) {
        
        if (vc != NULL) {
            [self presentViewController:vc animated:YES completion:NULL];
        }
    }];
}

// MARK: - SampleAppOnfidoWrapperDelegate protocol conformance

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)error {
    NSLog(@"Onfido Flow encoutnered an error, consider showing a popup");
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)successForApplicantWithId:(NSString * _Nonnull)applicantId {
    NSLog(@"Completed flow, consider sending the applicant id to your backend to create a check");
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
