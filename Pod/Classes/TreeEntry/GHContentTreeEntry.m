//
//  GHContentTreeEntry.m
//  OctoKit
//
//  Created by Josh Abernathy on 9/30/13.
//  Copyright (c) 2013 GitHub. All rights reserved.
//

#import "GHContentTreeEntry.h"

@implementation GHContentTreeEntry

#pragma mark MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
	return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
		@"URL": @"url",
	}];
}

+ (NSValueTransformer *)URLJSONTransformer {
	return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

@end
