//
// NSURL+GHQuery.h
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import "NSURL+GHQuery.h"
#import <Mantle/Mantle.h>

@implementation NSURL (GHQuery)

- (NSDictionary *)queryArguments {
    NSCharacterSet *separatorSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];
    NSArray *queryComponents = [self.query componentsSeparatedByCharactersInSet:separatorSet];
    
    NSMutableDictionary *queryArguments = [[NSMutableDictionary alloc] initWithCapacity:queryComponents.count];
    for (NSString *component in queryComponents) {
        if (component.length == 0) continue;
        
        NSArray *parts = [component componentsSeparatedByString:@"="];
        NSString *key = [parts.mtl_firstObject stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        id value = [NSNull null];
        if (parts.count > 1) {
            value = [parts.lastObject stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        }
        
        queryArguments[key] = value;
    }
    
    return queryArguments;
}

@end
