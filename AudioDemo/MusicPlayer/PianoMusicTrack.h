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

@interface PianoMusicTrack : NSObject
@property(nonatomic, strong) NSArray<PianoMusicNote *> *musicNotes;

- (void)play;
- (void)pause;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
