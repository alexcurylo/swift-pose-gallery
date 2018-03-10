//
//  MemoryWarner.h
//  PoseGallery
//
//  Created by Alex Curylo on 2016-05-25.
//  Copyright © 2016 Trollwerks Inc. All rights reserved.
//

@import UIKit;

@interface UIApplication (MemoryWarner)

- (void)_performMemoryWarning;

@end

@interface MemoryWarner : NSObject

- (void)performMemoryWarningEvery:(NSTimeInterval)seconds;

@end
