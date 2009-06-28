//
//  VOStatusFormatter.m
//  ntlniph
//
//  Created by 上田 澄博 on 09/06/28.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "VOMessageFormatter.h"
#import "GTMRegex.h"

@implementation NTLNMessage (VOMessageFormatter)

- (NSString*)voFormat {
	GTMRegex *regex = [GTMRegex regexWithPattern:@"(https?://[-_.!~*'()a-zA-Z0-9;/?:@&=+$,%#]+)"];
	GTMRegex *regex2 = [GTMRegex regexWithPattern:@"(@[A-Za-z0-9¥-¥_¥.]+) "];
	NSMutableString *replaced = [NSMutableString stringWithString:
								 [regex2 stringByReplacingMatchesInString:
								  [regex stringByReplacingMatchesInString:[self text]
														  withReplacement:@""]
														  withReplacement:@"\\1。" ]];
	/*
	[replaced replaceOccurrencesOfString:@" "
							  withString:@"。"
								 options:NSLiteralSearch
								   range:NSMakeRange(0,[replaced length])];
	 */


	return [NSString stringWithFormat:@"%@。%@。", replaced, [self screenName]];
}

@end
