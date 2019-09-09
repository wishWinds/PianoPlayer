//
//  PianoMusicPlayer.h
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PianoMusicModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface PianoMusicPlayer : NSObject
@property(nonatomic, strong, readonly) PianoMusicModel *musicModel;


- (id)initWithJsonStr:(NSString *)jsonStr;

- (void)play;

- (void)pause;

- (void)stop;
@end

NS_ASSUME_NONNULL_END
