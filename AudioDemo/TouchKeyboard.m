//
//  TouchKeyboard.m
//  AudioDemo
//
//  Created by 舒鹏 on 10/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import "TouchKeyboard.h"
#import "PianoMusicNote.h"
#import "UITouch+PianoMusicPlayer.h"

@interface TouchKeyboard () <PianoMusicNoteDelegate>
@property(weak, nonatomic) IBOutlet UIStackView *noteStackView;
@property(nonatomic, strong) NSArray *noteNames;
@property(nonatomic, strong) NSMutableArray *notes;
@end

@implementation TouchKeyboard

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }

    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }

    return self;
}

- (void)setup {
    self.noteNames = @[@"C3", @"D3", @"E3", @"F3", @"G3", @"A3", @"B3", @"C4", @"D4", @"E4", @"F4", @"G4", @"A4", @"B4"];
    self.notes = [NSMutableArray array];
}

- (UIView *)viewForNoteName:(NSString *)noteName {
    NSInteger index = [self.noteNames indexOfObject:noteName];
    if (index == NSNotFound) {
        return nil;
    } else {
        return [self viewForIndex:index];
    }
}

- (UIView *)viewForIndex:(NSInteger)index {
    UIStackView *stack = [self.noteStackView.arrangedSubviews objectAtIndex:index];
    return [stack.arrangedSubviews objectAtIndex:0];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [touches enumerateObjectsUsingBlock:^(UITouch * _Nonnull obj, BOOL * _Nonnull stop) {
        NSInteger index = [self indexForTouch:obj];

        NSString *noteName = self.noteNames[index];
        PianoMusicNote *note = [[PianoMusicNote alloc] initWithName:noteName duration:0];
        note.delegate = self;
        [note play];
        [self.notes addObject:note];

        [self touchNoteName:noteName];

        obj.preTouchNoteIndex = @(index);
        obj.preNote = note;
    }];
}

- (NSInteger)indexForTouch:(UITouch *)touch {
    CGPoint point = [touch locationInView:self];

    CGFloat itemWidth = self.frame.size.width / self.noteNames.count;
    return (NSInteger) floor(point.x / itemWidth);
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [touches enumerateObjectsUsingBlock:^(UITouch * _Nonnull obj, BOOL * _Nonnull stop) {
        NSInteger index = [self indexForTouch:obj];

        if ([obj.preTouchNoteIndex integerValue] != index) {
//            [obj.preNote stop];
            [self untouchNoteName:obj.preNote.name];

            NSString *noteName = self.noteNames[index];
            PianoMusicNote *note = [[PianoMusicNote alloc] initWithName:noteName duration:0];
            note.delegate = self;
            [note play];
            [self.notes addObject:note];

            [self touchNoteName:noteName];

            obj.preTouchNoteIndex = @(index);
            obj.preNote = note;
        } else {

        }

    }];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [touches enumerateObjectsUsingBlock:^(UITouch * _Nonnull obj, BOOL * _Nonnull stop) {
//        [obj.preNote stop];
        [self untouchNoteName:obj.preNote.name];
        obj.preNote = nil;
        obj.preTouchNoteIndex = @(0);
    }];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesEnded:touches withEvent:event];
}

- (void)touchNoteName:(NSString *)noteName {
    UIView *view = [self viewForNoteName:noteName];
    view.backgroundColor = [UIColor lightGrayColor];
}

- (void)untouchNoteName:(NSString *)noteName {
    UIView *view = [self viewForNoteName:noteName];
    view.backgroundColor = [UIColor whiteColor];
}

- (void)pianoMusicNoteDidPlayEnd:(PianoMusicNote *)note {
//    [self untouchNoteName:note.name];
    [self.notes removeObject:note];
}

@end
