#import <Foundation/Foundation.h>
#import "OnfidoSEGIntegrationFactory.h"
#import "OnfidoSEGHTTPClient.h"
#import "OnfidoSEGStorage.h"

NS_ASSUME_NONNULL_BEGIN


@interface OnfidoSEGSegmentIntegrationFactory : NSObject <OnfidoSEGIntegrationFactory>

@property (nonatomic, strong) OnfidoSEGHTTPClient *client;
@property (nonatomic, strong) id<OnfidoSEGStorage> storage;

- (instancetype)initWithHTTPClient:(OnfidoSEGHTTPClient *)client storage:(id<OnfidoSEGStorage>)storage;

@end

NS_ASSUME_NONNULL_END
