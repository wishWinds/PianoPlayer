//
//  PianoNote.h
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PianoNote;

NS_ASSUME_NONNULL_BEGIN

@protocol PianoNoteDelegate <NSObject>
- (void)pianoMusicNoteDidPlayEnd:(PianoNote *)note;
@end

@interface PianoNote : NSObject
@property(nonatomic, strong, readonly) NSString *name;
@property(nonatomic, assign, readonly) NSTimeInterval duration;

@property(nonatomic, weak) id<PianoNoteDelegate> delegate;

- (id)initWithName:(NSString *)name duration:(NSTimeInterval)duration;

- (void)play;

- (void)playWithDuration:(NSTimeInterval)duration;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
