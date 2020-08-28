//
//  SEGFileStorage.h
//  Analytics
//
//  Copyright © 2016 Segment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OnfidoSEGStorage.h"


@interface OnfidoSEGFileStorage : NSObject <OnfidoSEGStorage>

@property (nonatomic, strong, nullable) id<OnfidoSEGCrypto> crypto;

- (instancetype _Nonnull)init;
- (instancetype _Nonnull)initWithFolder:(NSURL *_Nonnull)folderURL crypto:(id<OnfidoSEGCrypto> _Nullable)crypto;

- (NSURL *_Nonnull)urlForKey:(NSString *_Nonnull)key;

+ (NSURL *_Nullable)applicationSupportDirectoryURL;

@end
