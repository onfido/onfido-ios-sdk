#import <UIKit/UIKit.h>


@interface UIViewController (OnfidoSEGScreen)

+ (void)onfido_seg_swizzleViewDidAppear;
+ (UIViewController *)onfido_seg_topViewController;

@end
