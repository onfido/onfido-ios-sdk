//
//  SEGContext.h
//  Analytics
//
//  Created by Tony Xiao on 9/19/16.
//  Copyright © 2016 Segment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OnfidoSEGIntegration.h"

typedef NS_ENUM(NSInteger, OnfidoSEGEventType) {
    // Should not happen, but default state
    OnfidoSEGEventTypeUndefined,
    // Core Tracking Methods
    OnfidoSEGEventTypeIdentify,
    OnfidoSEGEventTypeTrack,
    OnfidoSEGEventTypeScreen,
    OnfidoSEGEventTypeGroup,
    OnfidoSEGEventTypeAlias,

    // General utility
    OnfidoSEGEventTypeReset,
    OnfidoSEGEventTypeFlush,

    // Remote Notification
    OnfidoSEGEventTypeReceivedRemoteNotification,
    OnfidoSEGEventTypeFailedToRegisterForRemoteNotifications,
    OnfidoSEGEventTypeRegisteredForRemoteNotifications,
    OnfidoSEGEventTypeHandleActionWithForRemoteNotification,

    // Application Lifecycle
    OnfidoSEGEventTypeApplicationLifecycle,
    //    DidFinishLaunching,
    //    SEGEventTypeApplicationDidEnterBackground,
    //    SEGEventTypeApplicationWillEnterForeground,
    //    SEGEventTypeApplicationWillTerminate,
    //    SEGEventTypeApplicationWillResignActive,
    //    SEGEventTypeApplicationDidBecomeActive,

    // Misc.
    OnfidoSEGEventTypeContinueUserActivity,
    OnfidoSEGEventTypeOpenURL,

};

@class OnfidoSEGAnalytics;
@protocol OnfidoSEGMutableContext;


@interface OnfidoSEGContext : NSObject <NSCopying>

// Loopback reference to the top level SEGAnalytics object.
// Not sure if it's a good idea to keep this around in the context.
// since we don't really want people to use it due to the circular
// reference and logic (Thus prefixing with underscore). But
// Right now it is required for integrations to work so I guess we'll leave it in.
@property (nonatomic, readonly, nonnull) OnfidoSEGAnalytics *_analytics;
@property (nonatomic, readonly) OnfidoSEGEventType eventType;

@property (nonatomic, readonly, nullable) NSString *userId;
@property (nonatomic, readonly, nullable) NSString *anonymousId;
@property (nonatomic, readonly, nullable) NSError *error;
@property (nonatomic, readonly, nullable) OnfidoSEGPayload *payload;
@property (nonatomic, readonly) BOOL debug;

- (instancetype _Nonnull)initWithAnalytics:(OnfidoSEGAnalytics *_Nonnull)analytics;

- (OnfidoSEGContext *_Nonnull)modify:(void (^_Nonnull)(id<OnfidoSEGMutableContext> _Nonnull ctx))modify;

@end

@protocol OnfidoSEGMutableContext <NSObject>

@property (nonatomic) OnfidoSEGEventType eventType;
@property (nonatomic, nullable) NSString *userId;
@property (nonatomic, nullable) NSString *anonymousId;
@property (nonatomic, nullable) OnfidoSEGPayload *payload;
@property (nonatomic, nullable) NSError *error;
@property (nonatomic) BOOL debug;

@end
