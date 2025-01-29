//
//  ViewController.m
//  SampleAppObjC
//
//  Copyright © 2016-2025 Onfido. All rights reserved.
//

#import "ViewController.h"
#import <Onfido/Onfido-Swift.h>

@implementation ViewController

- (IBAction)verifyUser:(id)sender {
    
    // TODO Call your backend to get `sdkToken` https://documentation.onfido.com/sdk/ios/#sdk-authentication
    NSString * sdkToken = @"SDK_TOKEN";
    
    ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
    [configBuilder withSdkToken:sdkToken];
    [configBuilder withWelcomeStep];
    [configBuilder withDocumentStep];
    
    Builder *faceStepVariantBuilder = [ONFaceStepVariantConfig builder];
    [faceStepVariantBuilder withPhotoCaptureWithConfig: NULL];
    NSError *faceVariantStepConfigError = NULL;
    ONFaceStepVariantConfig *faceStepVariant = [faceStepVariantBuilder buildAndReturnError: &faceVariantStepConfigError];
    
    if (faceVariantStepConfigError != NULL) {
        [self showError:[[faceVariantStepConfigError userInfo] valueForKey:@"message"]];
        return;
    }
    
    [configBuilder withFaceStepOfVariant: faceStepVariant];
    NSError *configError = NULL;
    ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];
    if (configError != NULL) {
        [self showError:[[configError userInfo] valueForKey:@"message"]];
        return;
    }
    
    ONFlow *flow = [[ONFlow alloc] initWithFlowConfiguration:config];
    
    ViewController *__weak weakSelf = self;
    [flow withResponseHandler:^(ONFlowResponse * _Nonnull response) {
        ViewController *__strong self = weakSelf;
        
        if (response.error) {
            [self showError:[[response.error userInfo] valueForKey:@"message"]];
        } else if (response.userCanceled) {
            NSString *cancellationMessage = [self getCanceletationReason:response.userCanceled];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Canceled by user"
                                                                           message:cancellationMessage
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        } else if (response.results.count > 0) {
            // SDK flow has been completed successfully. You may want to create a check in your backend at this point.
            // Follow https://documentation.onfido.com/api/latest/#create-check to understand how to create a check
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Success" message:@"SDK flow has been completed successfully" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    
    
    /*
    Supported presentation styles are:
    For iPhones: UIModalPresentationFullScreen
    For iPads: UIModalPresentationFullScreen and UIModalPresentationFormSheet
    */
    
    UIModalPresentationStyle modalPresentationStyle = UIModalPresentationFullScreen;  // due to iOS 13 you must specify .fullScreen, as the default is now .pageSheet
    
    if(UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad) {
        modalPresentationStyle = UIModalPresentationFormSheet; // to present modally on iPads
    }
    
    NSError *runError = NULL;
    [flow runFrom:self presentationStyle:modalPresentationStyle animated:YES error:&runError completion:nil];
    
    if (runError != NULL) {
        [self showError:[[runError userInfo] valueForKey:@"message"]];
    }
}

- (void)showError: (NSString *) message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:[NSString stringWithFormat:@"Onfido SDK errored %@", message] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (NSString *) getCanceletationReason: (ONFlowCancellation *) flowCancellation {
    switch (flowCancellation.reason) {
        case CancellationReasonUserExit:
            return @"Reason: User exited flow";
        case CancellationReasonDeniedConsent:
            return @"Reason: User denied consent";
        case CancellationReasonRequiredNFCFlowNotCompleted:
            return @"Reason: NFC flow is not completed";
    }
}

@end
