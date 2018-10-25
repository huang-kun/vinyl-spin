//
//  RecordView.m
//  vinyl-spin
//
//  Created by huangkun on 2018/10/25.
//  Copyright © 2018 huangkun. All rights reserved.
//

#import "RecordView.h"

@interface RecordView ()
@property (nonatomic, strong) UIImageView *circularImageView;
@property (nonatomic, strong) UIView *circularShadowView;
@property (nonatomic, strong) UIView *circularFilterView;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, assign) CGFloat imageWidth;
@end

@implementation RecordView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    CGSize screenSize = UIScreen.mainScreen.bounds.size;
    CGFloat minScreenLength = MIN(screenSize.width, screenSize.height);
    _imageWidth = MAX(minScreenLength * 0.6, 260);
    
    [self setupViewHierarchy];
    [self setupLayoutConstraints];
}

- (void)setupViewHierarchy {
    // Create shadow
    _circularShadowView = [UIView new];
    _circularShadowView.layer.cornerRadius = _imageWidth / 2;
    _circularShadowView.layer.shadowOpacity = 0.6;
    _circularShadowView.layer.shadowRadius = 10;
    _circularShadowView.layer.shadowOffset = CGSizeMake(0, 0);
    _circularShadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    [self addSubview:_circularShadowView];
    
    // Create circular background image
    _circularImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"demo"]];
    _circularImageView.contentMode = UIViewContentModeScaleAspectFill;
    _circularImageView.backgroundColor = UIColor.whiteColor;
    _circularImageView.layer.cornerRadius = _imageWidth / 2;
    _circularImageView.layer.masksToBounds = YES;
    [_circularShadowView addSubview:_circularImageView];
    
    // Create a light dark filter
    _circularFilterView = [UIView new];
    _circularFilterView.backgroundColor = [UIColor colorWithWhite:0.4 alpha:0.4];
    _circularFilterView.layer.cornerRadius = _imageWidth / 2;
    _circularFilterView.layer.masksToBounds = YES;
    [_circularShadowView addSubview:_circularFilterView];
    
    // Create a play button
    _playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_playButton setImage:[UIImage imageNamed:@"play_icon"] forState:UIControlStateNormal];
    [_playButton setImage:[UIImage imageNamed:@"pause_icon"] forState:UIControlStateSelected];
    [_playButton addTarget:self action:@selector(playOrPause:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_playButton];
}

- (void)setupLayoutConstraints {
    _circularShadowView.translatesAutoresizingMaskIntoConstraints = NO;
    _circularImageView.translatesAutoresizingMaskIntoConstraints = NO;
    _circularFilterView.translatesAutoresizingMaskIntoConstraints = NO;
    _playButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:
     @[
       [_circularShadowView.widthAnchor constraintEqualToConstant:_imageWidth],
       [_circularShadowView.heightAnchor constraintEqualToConstant:_imageWidth],
       [_circularShadowView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
       [_circularShadowView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
       
       [_circularImageView.topAnchor constraintEqualToAnchor:_circularShadowView.topAnchor],
       [_circularImageView.leftAnchor constraintEqualToAnchor:_circularShadowView.leftAnchor],
       [_circularImageView.rightAnchor constraintEqualToAnchor:_circularShadowView.rightAnchor],
       [_circularImageView.bottomAnchor constraintEqualToAnchor:_circularShadowView.bottomAnchor],
       
       [_circularFilterView.topAnchor constraintEqualToAnchor:_circularShadowView.topAnchor],
       [_circularFilterView.leftAnchor constraintEqualToAnchor:_circularShadowView.leftAnchor],
       [_circularFilterView.rightAnchor constraintEqualToAnchor:_circularShadowView.rightAnchor],
       [_circularFilterView.bottomAnchor constraintEqualToAnchor:_circularShadowView.bottomAnchor],
       
       [_playButton.topAnchor constraintEqualToAnchor:_circularShadowView.topAnchor],
       [_playButton.leftAnchor constraintEqualToAnchor:_circularShadowView.leftAnchor],
       [_playButton.rightAnchor constraintEqualToAnchor:_circularShadowView.rightAnchor],
       [_playButton.bottomAnchor constraintEqualToAnchor:_circularShadowView.bottomAnchor],
       ]];
}

- (void)playOrPause:(UIButton *)sender {
    sender.selected = !sender.isSelected;
    
    BOOL isPlaying = sender.isSelected;
    if (isPlaying) {
        
    } else {
        
    }
}

@end
