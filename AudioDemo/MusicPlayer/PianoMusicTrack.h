//
//  PianoMusicTrack.h
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PianoMusicNote.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PianoMusicTrackDelegate <NSObject>
- (void)pianoMusicTrackDidPlayNote:(NSString *)noteName;
- (void)pianoMusicTrackDidEndPlayNote:(NSString *)noteName;
@end

@interface PianoMusicTrack : NSObject
@property(nonatomic, strong) NSArray<PianoMusicNote *> *musicNotes;
@property(nonatomic, weak) id<PianoMusicTrackDelegate> delegate;

- (void)play;
- (void)pause;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
