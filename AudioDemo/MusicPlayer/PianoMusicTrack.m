//
//  PianoMusicTrack.m
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import "PianoMusicTrack.h"

@interface PianoMusicTrack ()
@property(nonatomic, assign) NSInteger playIndex;
@property(nonatomic, strong) NSTimer *timer;
@end

@implementation PianoMusicTrack

- (void)play {
    [self timerFired:nil];
}

- (void)pause {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)stop {
    [self.timer invalidate];
    self.timer = nil;
    
    self.playIndex = 0;
}

- (void)timerFired:(NSTimer *)timer {
    PianoMusicNote *note = self.musicNotes[self.playIndex];
    [note play];
    
    self.playIndex++;
    if (self.playIndex > self.musicNotes.count - 1) {
        self.playIndex = 0;
    } else {
        self.timer = [NSTimer timerWithTimeInterval:note.duration target:self selector:@selector(timerFired:) userInfo:nil repeats:false];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }

}
@end
