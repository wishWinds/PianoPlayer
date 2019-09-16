//
//  PianoTrack.m
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import "PianoTrack.h"

@interface PianoTrack ()
@property(nonatomic, assign) NSInteger playIndex;
@property(nonatomic, strong) NSTimer *timer;
@end

@implementation PianoTrack

- (void)play {
    [self next];
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

- (void)next {
    // post pre note play end msg
    if (self.playIndex != 0) {
        PianoNote *preNote = self.musicNotes[self.playIndex - 1];
//        [preNote stop];
        if ([self.delegate respondsToSelector:@selector(pianoMusicTrackDidEndPlayNote:)]) {
            [self.delegate pianoMusicTrackDidEndPlayNote:preNote.name];
        }
    }

    // play current note
    PianoNote *note = self.musicNotes[self.playIndex];
    [note play];
    if ([self.delegate respondsToSelector:@selector(pianoMusicTrackDidPlayNote:)]) {
        [self.delegate pianoMusicTrackDidPlayNote:note.name];
    }

    // create current note play end timer
    self.playIndex++;
    if (self.playIndex > self.musicNotes.count - 1) {
        self.playIndex = 0;
    } else {
        self.timer = [NSTimer timerWithTimeInterval:note.duration target:self selector:@selector(next) userInfo:nil repeats:false];
        [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}
@end
