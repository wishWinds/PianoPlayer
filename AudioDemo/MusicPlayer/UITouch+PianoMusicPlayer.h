//
//  UITouch+PianoMusicPlayer.h
//  AudioDemo
//
//  Created by 舒鹏 on 10/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PianoMusicNote.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITouch (PianoMusicPlayer)
@property(nonatomic, strong) NSNumber *preTouchNoteIndex;
@property(nonatomic, strong) PianoMusicNote *preNote;
@end

NS_ASSUME_NONNULL_END
