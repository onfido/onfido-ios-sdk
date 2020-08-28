//
//  SEGMiddleware.h
//  Analytics
//
//  Created by Tony Xiao on 9/19/16.
//  Copyright © 2016 Segment. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OnfidoSEGContext.h"

typedef void (^OnfidoSEGMiddlewareNext)(OnfidoSEGContext *_Nullable newContext);

@protocol OnfidoSEGMiddleware
@required

// NOTE: If you want to hold onto references of context AFTER passing it through to the next
// middleware, you should explicitly create a copy via `[context copy]` to guarantee
// that it does not get changed from underneath you because contexts can be implemented
// as mutable objects under the hood for performance optimization.
// The behavior of keeping reference to a context AFTER passing it to the next middleware
// is strictly undefined.

// Middleware should **always** call `next`. If the intention is to explicitly filter out
// events from downstream, call `next` with `nil` as the param.
// It's ok to save next callback until a more convenient time, but it should always always be done.
// We'll probably actually add tests to sure it is so.
// TODO: Should we add error as second param to next?
- (void)context:(OnfidoSEGContext *_Nonnull)context next:(OnfidoSEGMiddlewareNext _Nonnull)next;

@end

typedef void (^OnfidoSEGMiddlewareBlock)(OnfidoSEGContext *_Nonnull context, OnfidoSEGMiddlewareNext _Nonnull next);


@interface OnfidoSEGBlockMiddleware : NSObject <OnfidoSEGMiddleware>

@property (nonnull, nonatomic, readonly) OnfidoSEGMiddlewareBlock block;

- (instancetype _Nonnull)initWithBlock:(OnfidoSEGMiddlewareBlock _Nonnull)block;

@end


typedef void (^OnfidoRunMiddlewaresCallback)(BOOL earlyExit, NSArray<id<OnfidoSEGMiddleware>> *_Nonnull remainingMiddlewares);

// XXX TODO: Add some tests for SEGMiddlewareRunner
@interface OnfidoSEGMiddlewareRunner : NSObject

// While it is certainly technically possible to change middlewares dynamically on the fly. we're explicitly NOT
// gonna support that for now to keep things simple. If there is a real need later we'll see then.
@property (nonnull, nonatomic, readonly) NSArray<id<OnfidoSEGMiddleware>> *middlewares;

- (void)run:(OnfidoSEGContext *_Nonnull)context callback:(OnfidoRunMiddlewaresCallback _Nullable)callback;

- (instancetype _Nonnull)initWithMiddlewares:(NSArray<id<OnfidoSEGMiddleware>> *_Nonnull)middlewares;

@end
