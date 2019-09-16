//
//  UITouch+PianoPlayer.m
//  AudioDemo
//
//  Created by 舒鹏 on 10/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import "UITouch+PianoPlayer.h"
#import "PianoNote.h"
#import <objc/runtime.h>

@implementation UITouch (PianoPlayer)
- (NSNumber *)preTouchNoteIndex {
    return objc_getAssociatedObject(self, @selector(preTouchNoteIndex));
}

- (void)setPreTouchNoteIndex:(NSNumber *)preTouchNoteIndex {
    objc_setAssociatedObject(self, @selector(preTouchNoteIndex), preTouchNoteIndex, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (PianoNote *)preNote {
    return objc_getAssociatedObject(self, @selector(preNote));
}

- (void)setPreNote:(PianoNote *)preNote {
    objc_setAssociatedObject(self, @selector(preNote), preNote, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

@end
