#import <Foundation/Foundation.h>
#import "OnfidoSEGIntegration.h"
#import "OnfidoSEGAnalytics.h"

NS_ASSUME_NONNULL_BEGIN

@class OnfidoSEGAnalytics;

@protocol OnfidoSEGIntegrationFactory

/**
 * Attempts to create an adapter with the given settings. Returns the adapter if one was created, or null
 * if this factory isn't capable of creating such an adapter.
 */
- (id<OnfidoSEGIntegration>)createWithSettings:(NSDictionary *)settings forAnalytics:(OnfidoSEGAnalytics *)analytics;

/** The key for which this factory can create an Integration. */
- (NSString *)key;

@end

NS_ASSUME_NONNULL_END
