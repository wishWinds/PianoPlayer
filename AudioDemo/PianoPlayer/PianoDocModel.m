//
//  PianoDocModel.m
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import "PianoDocModel.h"

@implementation PianoDocModel

- (id)initWithJsonStr:(NSString *)str {
    self = [super init];
    if (self) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[str dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
        self.name = json[@"name"];
        self.bpm = [json[@"bpm"] integerValue];
        self.jiepai = json[@"jiepai"];
        self.changming = json[@"changming"];


        __block NSMutableArray *musicTracks = [NSMutableArray array];
        [json[@"tracks"] enumerateObjectsUsingBlock:^(NSArray *_Nonnull trackJson, NSUInteger idx, BOOL *_Nonnull stop) {
            NSMutableArray *trackMusicNotes = [NSMutableArray array];
            PianoTrack *track = [[PianoTrack alloc] init];
            [musicTracks addObject:track];

            [trackJson enumerateObjectsUsingBlock:^(NSString *_Nonnull noteStr, NSUInteger idx, BOOL *_Nonnull stop) {
                NSRange range = [noteStr rangeOfString:@"("];
                NSString *noteName = [noteStr substringToIndex:range.location];
                noteName = [noteName stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[noteName substringWithRange:NSMakeRange(0, 1)] capitalizedString]];
                NSMutableString *mulStr = [NSMutableString stringWithString:noteName];
                NSInteger upCount = [mulStr replaceOccurrencesOfString:@"+" withString:@"" options:0 range:NSMakeRange(0, mulStr.length)];
                NSInteger downCount = [mulStr replaceOccurrencesOfString:@"-" withString:@"" options:0 range:NSMakeRange(0, mulStr.length)];
                NSInteger distance = upCount - downCount;
                noteName = [mulStr stringByAppendingString:[self indexStringForChangming:self.changming distance:distance]];
                
                NSString *durationStr = [noteStr substringFromIndex:range.location + 1];
                durationStr = [durationStr substringToIndex:durationStr.length - 1];
                NSTimeInterval duration = [durationStr floatValue] * [self interval];

                PianoNote *note = [[PianoNote alloc] initWithName:noteName duration:duration];
                [trackMusicNotes addObject:note];
            }];
            
            track.musicNotes = [NSArray arrayWithArray:trackMusicNotes];

        }];
        self.musicTracks = [NSArray arrayWithArray:musicTracks];
    }

    return self;
}

- (NSTimeInterval)interval {
    return 60.0 / self.bpm;
}

- (NSString *)indexStringForChangming:(NSString *)changming distance:(NSInteger)distance {
    return [@([self indexForChangming:changming distance:distance]) stringValue];
}

- (NSInteger)indexForChangming:(NSString *)changming distance:(NSInteger)distance {
    return 4 + distance;
}

@end
