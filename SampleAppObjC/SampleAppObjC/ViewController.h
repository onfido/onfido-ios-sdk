//
//  ViewController.h
//  SampleAppObjC
//
//  Created by Anurag Ajwani on 22/11/2017.
//  Copyright © 2017 onfido. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleAppObjC-Swift.h" // Import the automatically generated header file (to bridge Swift code)

@interface ViewController : UIViewController <SampleAppOnfidoWrapperDelegate> // Conform to the custom wrapper delegate protocol here


@end

