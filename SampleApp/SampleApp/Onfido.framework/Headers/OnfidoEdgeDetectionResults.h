//
//  OnfidoEdgeDetectionResults.h
//  Onfido
//
//  Created by Anurag Ajwani on 08/01/2020.
//

@interface OnfidoEdgeDetectionResults : NSObject

@property (nonatomic, assign, readonly) BOOL topEdgeDetected;
@property (nonatomic, assign, readonly) BOOL bottomEdgeDetected;
@property (nonatomic, assign, readonly) BOOL leftEdgeDetected;
@property (nonatomic, assign, readonly) BOOL rightEdgeDetected;

- (instancetype) initWithTopEdgeDetected: (BOOL) topEdge
                           andBottomEdge: (BOOL) bottomEdge
                             andLeftEdge: (BOOL) leftEdge
                            andRightEdge: (BOOL) rightEdge;

- (int) numberOfEdgesDetected;

@end
