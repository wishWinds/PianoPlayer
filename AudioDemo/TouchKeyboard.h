//
//  TouchKeyboard.h
//  AudioDemo
//
//  Created by 舒鹏 on 10/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TouchKeyboard : UIView
- (void)touchNoteName:(NSString *)noteName;
- (void)untouchNoteName:(NSString *)noteName;
@end

NS_ASSUME_NONNULL_END
