#import <Foundation/Foundation.h>
#import "OnfidoSEGPayload.h"

NS_ASSUME_NONNULL_BEGIN


@interface OnfidoSEGGroupPayload : OnfidoSEGPayload

@property (nonatomic, readonly) NSString *groupId;

@property (nonatomic, readonly, nullable) ONFIDO_JSON_DICT traits;

- (instancetype)initWithGroupId:(NSString *)groupId
                         traits:(ONFIDO_JSON_DICT _Nullable)traits
                        context:(ONFIDO_JSON_DICT)context
                   integrations:(ONFIDO_JSON_DICT)integrations;

@end

NS_ASSUME_NONNULL_END
