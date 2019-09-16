//
//  ViewController.m
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PianoPlayer.h"
#import "TouchKeyboard.h"

@interface ViewController () <AVAudioPlayerDelegate, PianoPlayerDelegate>
@property(nonatomic, strong) PianoPlayer *player;
@property (weak, nonatomic) IBOutlet UIView *keyboardWrapperView;

@property(nonatomic, strong) TouchKeyboard *keyboardView;
@end

@implementation ViewController {
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.keyboardView = [[[NSBundle mainBundle] loadNibNamed:@"TouchKeyboard" owner:nil options:nil] firstObject];
    [self.keyboardWrapperView addSubview:self.keyboardView];
    self.keyboardView.frame = self.keyboardWrapperView.bounds;
    self.keyboardView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    NSURL *musicJsonStrFileURL = [[NSBundle mainBundle] URLForResource:@"小星星" withExtension:@"json"];
    NSString *musicJsonStr = [NSString stringWithContentsOfURL:musicJsonStrFileURL encoding:NSUTF8StringEncoding error:nil];
    self.player = [[PianoPlayer alloc] initWithJsonStr:musicJsonStr];
    self.player.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (IBAction)playXiaoXingXing:(id)sender {

    [self.player stop];
    [self.player play];
}

- (void)pianoMusicTrackDidPlayNote:(NSString *)noteName {
    [self.keyboardView touchNoteName:noteName];
}

- (void)pianoMusicTrackDidEndPlayNote:(NSString *)noteName {
    [self.keyboardView untouchNoteName:noteName];
}


@end
