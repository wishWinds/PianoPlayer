//
//  PianoMusicNote.h
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PianoMusicNote;

NS_ASSUME_NONNULL_BEGIN

@protocol PianoMusicNoteDelegate <NSObject>
- (void)pianoMusicNoteDidPlayEnd:(PianoMusicNote *)note;
@end

@interface PianoMusicNote : NSObject
@property(nonatomic, strong, readonly) NSString *name;
@property(nonatomic, assign, readonly) NSTimeInterval duration;

@property(nonatomic, weak) id<PianoMusicNoteDelegate> delegate;

- (id)initWithName:(NSString *)name duration:(NSTimeInterval)duration;

- (void)play;

- (void)playWithDuration:(NSTimeInterval)duration;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
