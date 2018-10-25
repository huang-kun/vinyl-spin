//
//  UIView+CoreAnimationHandler.m
//  vinyl-spin
//
//  Created by huangkun on 2018/10/25.
//  Copyright © 2018 huangkun. All rights reserved.
//

//  https://gist.github.com/passerbyloo/153962062353505b2b77
//  http://stackoverflow.com/questions/3211065/how-to-pause-and-resume-uiview-animation
//  https://stackoverflow.com/questions/28964346/swift-continuous-rotation-animation-not-so-continuous

#import "UIView+CoreAnimationHandler.h"

@implementation UIView (CoreAnimationHandler)

- (void)ca_pauseAnimations {
    CFTimeInterval paused_time = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 0.0;
    self.layer.timeOffset = paused_time;
}

- (void)ca_resumeAnimations {
    CFTimeInterval paused_time = [self.layer timeOffset];
    self.layer.speed = 1.0f;
    self.layer.timeOffset = 0.0f;
    self.layer.beginTime = 0.0f;
    CFTimeInterval time_since_pause = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil] - paused_time;
    self.layer.beginTime = time_since_pause;
}

- (void)ca_rotate360DegreesWithDuration:(CGFloat)duration {
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotateAnimation.fromValue = @0;
    rotateAnimation.toValue = @(M_PI * 2);
    rotateAnimation.removedOnCompletion = NO;
    rotateAnimation.duration = duration;
    rotateAnimation.repeatCount = FLT_MAX;
    [self.layer addAnimation:rotateAnimation forKey:NSStringFromSelector(_cmd)];
}

@end
