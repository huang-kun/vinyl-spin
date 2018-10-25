//
//  UIView+CoreAnimationHandler.h
//  vinyl-spin
//
//  Created by huangkun on 2018/10/25.
//  Copyright © 2018 huangkun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CoreAnimationHandler)

- (void)ca_pauseAnimations;
- (void)ca_resumeAnimations;

- (void)ca_rotate360DegreesWithDuration:(CGFloat)duration;

@end

NS_ASSUME_NONNULL_END
