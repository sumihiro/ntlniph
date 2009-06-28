//
//  VOCue.h
//  ntlniph
//
//  Created by 上田 澄博 on 09/06/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface VOQueue : NSObject {
	NSMutableArray *queue;
	
	id speechSynth;
}

@property (retain) NSMutableArray *queue;

@property (readwrite,assign) id speechSynth;


+(VOQueue*)sharedInstance;

- (void)addQueue:(NSString*)string;
- (void)addQueue:(NSString*)string startImmediately:(BOOL)startImmediately;
- (void)clearQueue;

@end
