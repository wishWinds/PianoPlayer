//
//  ViewController.m
//  AudioDemo
//
//  Created by 舒鹏 on 9/9/2019.
//  Copyright © 2019 舒鹏. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "PianoMusicPlayer.h"

@interface ViewController () <AVAudioPlayerDelegate>
@property(nonatomic, strong) PianoMusicPlayer *player;
@end

@implementation ViewController {
}
- (void)viewDidLoad {
    [super viewDidLoad];

    NSURL *musicJsonStrFileURL = [[NSBundle mainBundle] URLForResource:@"小星星" withExtension:@"json"];
    NSString *musicJsonStr = [NSString stringWithContentsOfURL:musicJsonStrFileURL encoding:NSUTF8StringEncoding error:nil];
    self.player = [[PianoMusicPlayer alloc] initWithJsonStr:musicJsonStr];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (IBAction)play:(id)sender {
    [self.player play];
}

- (IBAction)stop:(id)sender {
    [self.player stop];
}


@end
