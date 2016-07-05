//
//  NUIPreprocessor.m
//  NUIDemo
//
//  Created by imihaly on 04/07/16.
//  Copyright © 2016 Tom Benner. All rights reserved.
//

#import "NUIPreprocessor.h"

@implementation NUIPreprocessor

+ (NSString *)preprocessFileAtPath:(NSString *)path {
	NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	return [self processString:content
						  path:path
				  dependencies:nil
				   importStack:@[path]];
}

+ (NSArray<NSString *> *)dependenciesOfFileAtPath:(NSString *)path {
	NSMutableArray *dependencies = [NSMutableArray arrayWithObject:path];
	NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	[self processString:content
				   path:path
		   dependencies:dependencies
			importStack:@[path]];
	return dependencies;
}

+ (NSString *)processString:(NSString *)string path:(NSString *)path dependencies:(NSMutableArray *)dependencies importStack:(NSArray *)importStack {
	NSError *error = NULL;
	NSUInteger pos = 0;
	NSUInteger length = string.length;
	NSMutableString *result = NSMutableString.string;
	
	NSRegularExpression *importRegex = [NSRegularExpression regularExpressionWithPattern:@"@import\\s+\'(.*)\'"
																				 options:NSRegularExpressionCaseInsensitive
																				   error:&error];
	
	NSRegularExpression *blockCommentRegex = [NSRegularExpression regularExpressionWithPattern:@"/\\*.*\\*/"
																				 options:NSRegularExpressionCaseInsensitive
																				   error:&error];
	
	NSRegularExpression *lineCommentRegex = [NSRegularExpression regularExpressionWithPattern:@"//.*\\n"
																					  options:NSRegularExpressionCaseInsensitive
																						error:&error];
	
	while(YES) {
		NSTextCheckingResult* blockCommentMatch = [blockCommentRegex firstMatchInString:string options:0 range:NSMakeRange(pos, length - pos)];
		NSTextCheckingResult* lineCommentMatch = [lineCommentRegex firstMatchInString:string options:0 range:NSMakeRange(pos, length - pos)];
		NSTextCheckingResult* importMatch = [importRegex firstMatchInString:string options:0 range:NSMakeRange(pos, length - pos)];
		
		NSTextCheckingResult* match = nil;
		if(blockCommentMatch) {
			match = match == nil || match.range.location > blockCommentMatch.range.location ? blockCommentMatch : match;
		}
		if(lineCommentMatch) {
			match = match == nil || match.range.location > lineCommentMatch.range.location ? lineCommentMatch : match;
		}
		if(importMatch) {
			match = match == nil || match.range.location > importMatch.range.location ? importMatch : match;
		}
		
		if(!match) break;
		if(match == importMatch) {
			[result appendString:[string substringWithRange:NSMakeRange(pos, match.range.location - pos)]];
			pos = match.range.location + match.range.length;
			
			NSString *importedFileName = [string substringWithRange:(NSRange)[match rangeAtIndex:1]];
			NSString* importedPath = [self pathForIncludedFile:importedFileName inSourceFile:path];
			if(!importedPath) {
				NSLog(@"Preprocessing error: file not found: `%@`, imported from: `%@`, skipping", importedFileName, path);
				continue;
			}
			
			if([importStack containsObject:importedPath]) {
				NSLog(@"Preprocessing error: circular include: `%@`, imported from: `%@`, skipping", importedFileName, importStack);
				continue;
			}
			
			if(dependencies && ![dependencies containsObject:importedPath]) {
				[dependencies addObject:importedPath];
			}
			NSString *content = [NSString stringWithContentsOfFile:importedPath encoding:NSUTF8StringEncoding error:nil];
			if(!content) {
				NSLog(@"Preprocessing error: could not read: `%@`, imported from: `%@`, skipping", importedFileName, path);
				continue;
			}
			
			[result appendString:[self processString:content path:importedPath dependencies:dependencies importStack:[importStack arrayByAddingObject:importedPath]]];
		} else {
			// drop comments
			[result appendString:[string substringWithRange:NSMakeRange(pos, match.range.location - pos)]];
			pos = match.range.location + match.range.length;
		}
	};
	
	[result appendString:[string substringWithRange:NSMakeRange(pos, string.length - pos)]];
	return result;
}

+ (NSString *)pathForIncludedFile:(NSString *)includedFile inSourceFile:(NSString *)sourceFilePath {
	NSString *dir = [sourceFilePath stringByDeletingLastPathComponent];
	NSString *proposedPath = [dir stringByAppendingPathComponent:includedFile];
	if([NSFileManager.defaultManager fileExistsAtPath:proposedPath]) return proposedPath;
	return [[NSBundle mainBundle] pathForResource:includedFile ofType:nil];
}

@end
