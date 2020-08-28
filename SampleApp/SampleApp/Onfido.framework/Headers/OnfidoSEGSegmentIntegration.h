#import <Foundation/Foundation.h>
#import "OnfidoSEGIntegration.h"
#import "OnfidoSEGHTTPClient.h"
#import "OnfidoSEGStorage.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString *const OnfidoSEGSegmentDidSendRequestNotification;
extern NSString *const OnfidoSEGSegmentRequestDidSucceedNotification;
extern NSString *const OnfidoSEGSegmentRequestDidFailNotification;


@interface OnfidoSEGSegmentIntegration : NSObject <OnfidoSEGIntegration>

- (id)initWithAnalytics:(OnfidoSEGAnalytics *)analytics httpClient:(OnfidoSEGHTTPClient *)httpClient storage:(id<OnfidoSEGStorage>)storage;

@end

NS_ASSUME_NONNULL_END
