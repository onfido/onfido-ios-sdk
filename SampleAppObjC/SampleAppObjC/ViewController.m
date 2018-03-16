//
//  ViewController.m
//  SampleAppObjC
//
//  Created by Anurag Ajwani on 22/11/2017.
//  Copyright © 2017 onfido. All rights reserved.
//

#import "ViewController.h"
#import <Onfido/Onfido-Swift.h>
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>

@interface ViewController () {
    NSString *token;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self->token = @"YOUR_TOKEN_HERE";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)verifyUser:(id)sender {
    
    [self createApplicant:^(NSString *applicantId) {
      
        if (applicantId) {
            
            ONFlowConfigBuilder *configBuilder = [ONFlowConfig builder];
            [configBuilder withToken:self->token];
            [configBuilder withApplicantId:applicantId];
            [configBuilder withDocumentStep];
            [configBuilder withFaceStepOfVariant:ONFaceStepVariantPhoto];
            
            NSError *configError = NULL;
            ONFlowConfig *config = [configBuilder buildAndReturnError:&configError];
            
            if (configError == NULL) {
             
                ONFlow *flow = [[ONFlow alloc] initWithFlowConfiguration:config];
                [flow withResponseHandler:^(ONFlowResponse * _Nonnull response) {
                    
                    [self dismissViewControllerAnimated:YES completion:^{
                        
                        if (response.error) {
                            
                            if (response.error.code == ONFlowErrorCameraPermission) {
                                NSLog(@"Camera permission denied");
                            } else {
                                NSLog(@"Run error %@", [[response.error userInfo] valueForKey:@"message"]);
                            }
                            
                        } else if (response.userCanceled) {
                            NSLog(@"user canceled flow");
                        } else if (response.results) {
                            
                            for (ONFlowResult *result in response.results) {
                                
                                if (result.type == ONFlowResultTypeDocument) {
                                    ONDocumentResult *docResult = (ONDocumentResult *)(result.result);
                                    NSLog(@"%@", docResult.description);
                                } else if (result.type == ONFlowResultTypeFace) {
                                    ONFaceResult *faceResult = (ONFaceResult *)(result.result);
                                    NSLog(@"%@", faceResult.description);
                                }
                            }
                        }
                    }];
                }];
                
                NSError *runError = NULL;
                UIViewController *flowVC = [flow runAndReturnError:&runError];
                
                if (runError == NULL) {
                    [self presentViewController:flowVC animated:YES completion:nil];
                } else {
                    NSLog(@"Run error %@", [[runError userInfo] valueForKey:@"message"]);
                }
            } else {
                NSLog(@"Config error %@", [[configError userInfo] valueForKey:@"message"]);
            }
        }
    }];
}

/**
 Creates applicant, return NULL if unable to create
 */
- (void)createApplicant: (void(^)(NSString *))onResponse {
    
    MBProgressHUD *progressDisplay = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    progressDisplay.label.text = @"Creating applicant";
    
    NSDictionary *parameters = @{@"first_name":@"Frank", @"last_name":@"Abagnale"};
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSString *tokenHeaderValue = [NSString stringWithFormat:@"Token token=%@", self->token];
    [manager.requestSerializer setValue:tokenHeaderValue forHTTPHeaderField:@"Authorization"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager POST:@"https://api.onfido.com/v2/applicants"
        parameters:parameters
        progress:nil
        success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [progressDisplay removeFromSuperview];
            onResponse([responseObject valueForKey:@"id"]);
        }
        failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [progressDisplay removeFromSuperview];
            NSLog(@"failed to create applicant");
            onResponse(NULL);
        }];
}

- (void)showError: (NSError *) error {
    
    NSString *errorString = [[error userInfo] valueForKey:@"message"];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:errorString preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
