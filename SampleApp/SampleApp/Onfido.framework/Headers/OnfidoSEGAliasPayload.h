#import <Foundation/Foundation.h>
#import "OnfidoSEGPayload.h"

NS_ASSUME_NONNULL_BEGIN


@interface OnfidoSEGAliasPayload : OnfidoSEGPayload

@property (nonatomic, readonly) NSString *theNewId;

- (instancetype)initWithNewId:(NSString *)newId
                      context:(ONFIDO_JSON_DICT)context
                 integrations:(ONFIDO_JSON_DICT)integrations;

@end

NS_ASSUME_NONNULL_END
