#import <Foundation/Foundation.h>
#import "OnfidoSEGSerializableValue.h"

NS_ASSUME_NONNULL_BEGIN

NSString *OnfidoGenerateUUIDString(void);

// Date Utils
NSString *OnfidoIso8601FormattedString(NSDate *date);

void OnfidoTrimQueue(NSMutableArray *array, int size);

// Async Utils
dispatch_queue_t onfido_seg_dispatch_queue_create_specific(const char *label,
                                                    dispatch_queue_attr_t _Nullable attr);
BOOL onfido_seg_dispatch_is_on_specific_queue(dispatch_queue_t queue);
void onfido_seg_dispatch_specific(dispatch_queue_t queue, dispatch_block_t block,
                           BOOL waitForCompletion);
void onfido_seg_dispatch_specific_async(dispatch_queue_t queue,
                                 dispatch_block_t block);
void onfido_seg_dispatch_specific_sync(dispatch_queue_t queue, dispatch_block_t block);

// Logging

void OnfidoSEGSetShowDebugLogs(BOOL showDebugLogs);
void OnfidoSEGLog(NSString *format, ...);

// JSON Utils

ONFIDO_JSON_DICT OnfidoSEGCoerceDictionary(NSDictionary *_Nullable dict);

NSString *OnfidoSEGEventNameForScreenTitle(NSString *title);

NS_ASSUME_NONNULL_END
