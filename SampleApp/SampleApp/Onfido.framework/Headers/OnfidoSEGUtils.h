//
//  SEGUtils.h
//
//

#import <Foundation/Foundation.h>
#import "OnfidoSEGAnalyticsUtils.h"


@interface OnfidoSEGUtils : NSObject

+ (NSData *_Nullable)dataFromPlist:(nonnull id)plist;
+ (id _Nullable)plistFromData:(NSData *_Nonnull)data;

@end
