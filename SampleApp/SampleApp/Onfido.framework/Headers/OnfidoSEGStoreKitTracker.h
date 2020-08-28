#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>
#import "OnfidoSEGAnalytics.h"

NS_ASSUME_NONNULL_BEGIN


@interface OnfidoSEGStoreKitTracker : NSObject <SKPaymentTransactionObserver, SKProductsRequestDelegate>

+ (instancetype)trackTransactionsForAnalytics:(OnfidoSEGAnalytics *)analytics;

@end

NS_ASSUME_NONNULL_END
