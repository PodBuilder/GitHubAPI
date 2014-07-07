//
// GHAccessToken.m
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <GitHubAPI/GHAccessToken.h>

@implementation GHAccessToken

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [[super JSONKeyPathsByPropertyKey] mtl_dictionaryByAddingEntriesFromDictionary:
            @{ @"token": @"access_token" }];
}

+ (NSValueTransformer *)tokenJSONTransformer {
    // We want to prevent the token from being serialized out, so the
    // reverse transformer will simply yield nil, instead of the token itself.
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(NSString *token) {
        return token;
    } reverseBlock:^id(NSString *token) {
        return nil;
    }];
}

@end
