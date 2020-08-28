#import <Foundation/Foundation.h>
#import "OnfidoSEGSerializableValue.h"

NS_ASSUME_NONNULL_BEGIN


@interface OnfidoSEGPayload : NSObject

@property (nonatomic, readonly) ONFIDO_JSON_DICT context;
@property (nonatomic, readonly) ONFIDO_JSON_DICT integrations;

- (instancetype)initWithContext:(ONFIDO_JSON_DICT)context integrations:(ONFIDO_JSON_DICT)integrations;

@end


@interface OnfidoSEGApplicationLifecyclePayload : OnfidoSEGPayload

@property (nonatomic, strong) NSString *notificationName;

// ApplicationDidFinishLaunching only
@property (nonatomic, strong, nullable) NSDictionary *launchOptions;

@end


@interface OnfidoSEGContinueUserActivityPayload : OnfidoSEGPayload

@property (nonatomic, strong) NSUserActivity *activity;

@end


@interface OnfidoSEGOpenURLPayload : OnfidoSEGPayload

@property (nonatomic, strong) NSURL *url;
@property (nonatomic, strong) NSDictionary *options;

@end

NS_ASSUME_NONNULL_END


@interface OnfidoSEGRemoteNotificationPayload : OnfidoSEGPayload

// SEGEventTypeHandleActionWithForRemoteNotification
@property (nonatomic, strong, nullable) NSString *actionIdentifier;

// SEGEventTypeHandleActionWithForRemoteNotification
// SEGEventTypeReceivedRemoteNotification
@property (nonatomic, strong, nullable) NSDictionary *userInfo;

// SEGEventTypeFailedToRegisterForRemoteNotifications
@property (nonatomic, strong, nullable) NSError *error;

// SEGEventTypeRegisteredForRemoteNotifications
@property (nonatomic, strong, nullable) NSData *deviceToken;

@end
