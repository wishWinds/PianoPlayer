//
//  PianoPlayer.h
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PianoDocModel.h"


@protocol PianoPlayerDelegate <PianoTrackDelegate>
@end


NS_ASSUME_NONNULL_BEGIN

@interface PianoPlayer : NSObject
@property(nonatomic, strong, readonly) PianoDocModel *musicModel;

@property(nonatomic, weak) id<PianoPlayerDelegate> delegate;

- (id)initWithJsonStr:(NSString *)jsonStr;

- (void)play;

- (void)pause;

- (void)stop;
@end

NS_ASSUME_NONNULL_END
