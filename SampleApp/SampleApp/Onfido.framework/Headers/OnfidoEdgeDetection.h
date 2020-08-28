//
//  OnfidoEdgeDetection.h
//  Onfido
//
//  Created by Anurag Ajwani on 07/01/2020.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "OnfidoEdgeDetectionResults.h"

@interface OnfidoEdgeDetection: NSObject

- (OnfidoEdgeDetectionResults *) detect: (UIImage *) image;
- (void) setBoundingBox: (CGRect) rect;

@end

