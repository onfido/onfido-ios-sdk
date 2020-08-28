#import <Foundation/Foundation.h>
#import "OnfidoSEGPayload.h"

NS_ASSUME_NONNULL_BEGIN


@interface OnfidoSEGIdentifyPayload : OnfidoSEGPayload

@property (nonatomic, readonly, nullable) NSString *userId;

@property (nonatomic, readonly, nullable) NSString *anonymousId;

@property (nonatomic, readonly, nullable) ONFIDO_JSON_DICT traits;

- (instancetype)initWithUserId:(NSString *)userId
                   anonymousId:(NSString *_Nullable)anonymousId
                        traits:(ONFIDO_JSON_DICT _Nullable)traits
                       context:(ONFIDO_JSON_DICT)context
                  integrations:(ONFIDO_JSON_DICT)integrations;

@end

NS_ASSUME_NONNULL_END
