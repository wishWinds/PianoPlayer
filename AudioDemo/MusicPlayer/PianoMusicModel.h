//
//  PianoMusicModel.h
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PianoMusicTrack.h"

NS_ASSUME_NONNULL_BEGIN

@interface PianoMusicModel : NSObject
@property(nonatomic, strong) NSString *name;
@property(nonatomic, assign) NSInteger bpm;
@property(nonatomic, strong) NSString *jiepai;
@property(nonatomic, strong) NSString *changming;
@property(nonatomic, strong) NSArray<PianoMusicTrack *> *musicTracks;


- (id)initWithJsonStr:(NSString *)str;

- (NSTimeInterval)interval;
@end

NS_ASSUME_NONNULL_END
