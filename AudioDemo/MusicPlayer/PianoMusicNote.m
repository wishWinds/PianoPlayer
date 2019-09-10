//
//  PianoMusicNote.m
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import "PianoMusicNote.h"
#import <AVFoundation/AVFoundation.h>


@interface PianoMusicNote () <AVAudioPlayerDelegate>
@property(nonatomic, strong) AVAudioPlayer *player;
@property(nonatomic, strong) NSTimer *timer;
@end

@implementation PianoMusicNote
- (id)initWithName:(NSString *)name duration:(NSTimeInterval)duration {
    self = [super init];
    if (self) {
        _name = name;
        _duration = duration;

        [self initPlayer];
    }

    return self;
}

- (void)initPlayer {

    //    初始化播放器
    NSError *err;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self noteFileURLWithName:self.name] error:&err];

    //    设置播放器声音
    player.volume = 1;

    //    设置代理
    player.delegate = self;

    //    设置播放速率
    player.rate = 1.0;

    //    设置播放次数 负数代表无限循环
    player.numberOfLoops = 0;

    //    准备播放
    [player prepareToPlay];

    self.player = player;
}

- (void)play {
    NSLog(@"play: %@, %f", self.name, self.duration);
    
    [self.player play];
}

- (void)playWithDuration:(NSTimeInterval)duration {
    NSLog(@"play: %@, %f", self.name, duration);

    [self.player play];

    if (duration > 0) {
        self.timer = [NSTimer timerWithTimeInterval:duration target:self selector:@selector(timerFired:) userInfo:nil repeats:false];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)stop {
    [self.player stop];

    if ([self.delegate respondsToSelector:@selector(pianoMusicNoteDidPlayEnd:)]) {
        [self.delegate pianoMusicNoteDidPlayEnd:self];
    }
}

- (void)timerFired:(NSTimer *)timer {
    [self stop];
}

- (NSURL *)noteFileURLWithName:(NSString *)name {
    return [[NSBundle mainBundle] URLForResource:name withExtension:@"mp3"];
}

#pragma mark --AVAudioPlayerDelegate

/* audioPlayerDidFinishPlaying:successfully: is called when a sound has finished playing. This method is NOT called if the player is stopped due to an interruption. */
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    if ([self.delegate respondsToSelector:@selector(pianoMusicNoteDidPlayEnd:)]) {
        [self.delegate pianoMusicNoteDidPlayEnd:self];
    }
}

/* if an error occurs while decoding it will be reported to the delegate. */
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *__nullable)error {
    if ([self.delegate respondsToSelector:@selector(pianoMusicNoteDidPlayEnd:)]) {
        [self.delegate pianoMusicNoteDidPlayEnd:self];
    }
}
@end
