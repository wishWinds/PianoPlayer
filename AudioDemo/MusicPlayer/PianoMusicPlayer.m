//
//  PianoMusicPlayer.m
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import "PianoMusicPlayer.h"
@interface PianoMusicPlayer ()
@end

@implementation PianoMusicPlayer

- (id)initWithJsonStr:(NSString *)jsonStr {
    self = [super init];
    if (self) {
        PianoMusicModel *model = [[PianoMusicModel alloc] initWithJsonStr:jsonStr];
        _musicModel = model;
    }
    
    return self;
}

- (void)play {
    [self.musicModel.musicTracks enumerateObjectsUsingBlock:^(PianoMusicTrack * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj play];
    }];
}

- (void)pause {
    [self.musicModel.musicTracks enumerateObjectsUsingBlock:^(PianoMusicTrack * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj pause];
    }];
}

- (void)stop {
    [self.musicModel.musicTracks enumerateObjectsUsingBlock:^(PianoMusicTrack * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj stop];
    }];
}
@end
