//
//  PianoTrack.h
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PianoNote.h"

NS_ASSUME_NONNULL_BEGIN

@protocol PianoTrackDelegate <NSObject>
- (void)pianoMusicTrackDidPlayNote:(NSString *)noteName;
- (void)pianoMusicTrackDidEndPlayNote:(NSString *)noteName;
@end

@interface PianoTrack : NSObject
@property(nonatomic, strong) NSArray<PianoNote *> *musicNotes;
@property(nonatomic, weak) id<PianoTrackDelegate> delegate;

- (void)play;
- (void)pause;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
