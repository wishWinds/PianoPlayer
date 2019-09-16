//
//  UITouch+PianoPlayer.h
//  AudioDemo
//
//  Created by 舒鹏 on 10/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PianoNote.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITouch (PianoPlayer)
@property(nonatomic, strong) NSNumber *preTouchNoteIndex;
@property(nonatomic, strong) PianoNote *preNote;
@end

NS_ASSUME_NONNULL_END
