//
//  MemoryWarner.m
//  PoseGallery
//
//  Created by Alex Curylo on 2016-05-25.
//  Copyright © 2016 Trollwerks Inc. All rights reserved.
//

#import "MemoryWarner.h"

@implementation MemoryWarner

- (void)performMemoryWarningEvery:(NSTimeInterval)seconds
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:seconds target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop mainRunLoop];
    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)timerFireMethod:(NSTimer *) __unused theTimer
{
    [[UIApplication sharedApplication] _performMemoryWarning];
}

@end
