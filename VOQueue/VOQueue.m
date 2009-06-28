//
//  VOCue.m
//  ntlniph
//
//  Created by 上田 澄博 on 09/06/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VOQueue.h"
#import "GTMNSString+URLArguments.h"

#define TEXT2VOICE_API @"http://api.satoru.net/text2voice/?text=%@"

@implementation VOQueue

@synthesize queue;
@synthesize speechSynth;

#pragma mark -
#pragma mark Initialize
- (id)init {
	if(self = [super init]) {
		NSMutableArray *c = [[[NSMutableArray alloc] initWithArray:nil] autorelease];
		[self setQueue:c];
		
		Class klass = NSClassFromString(@"VSSpeechSynthesizer");
		speechSynth = [[klass alloc] init];
	}
	return self;
}

+(VOQueue*)sharedInstance {
	static id obj;
	@synchronized(self) {
		if(!obj) {
			obj = [[VOQueue alloc] init];
		}
	}
	return obj;
}

#pragma mark -
#pragma mark Add/Remove Methods

- (void)addQueue:(NSString*)string {
	[self addQueue:string startImmediately:YES];
}

- (void)addQueue:(NSString*)string startImmediately:(BOOL)startImmediately {
	
	[[self queue] addObject:string];
	
	if(startImmediately) {
		[self fire];
	}
	
	return;
}

- (void)clearQueue {
	[[self queue] removeAllObjects];
}

#pragma mark -
#pragma mark Controll Methods

- (void)fire {
	[self performSelector:@selector(loop) withObject:nil afterDelay:0.0f];
}

- (void)loop {
	if([[self queue] count] && ![speechSynth isSpeaking]) {
		NSString *text = (NSString*)[[self queue] objectAtIndex:0];
		LOG(@"VO: %@",text);
		[speechSynth startSpeakingString:text];
		[[self queue] removeObjectAtIndex:0];
		
	}
	if([[self queue] count]) {
		[self performSelector:@selector(loop) withObject:nil afterDelay:0.5f];
	}
	return;
}

@end
