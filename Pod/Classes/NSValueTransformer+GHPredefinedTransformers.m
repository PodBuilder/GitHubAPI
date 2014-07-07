//
// NSValueTransformer+GHPredefinedTransformers.m
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import "NSValueTransformer+GHPredefinedTransformers.h"
#import <GitHubAPI/NSDateFormatter+GHISO8601.h>
#import <Mantle/MTLValueTransformer.h>

NSString * const GHDateValueTransformerName = @"GHDateValueTransformerName";

@interface NSValueTransformer (GHPredefinedTransformers)
@end

#pragma mark -

@implementation NSValueTransformer (GHPredefinedTransformers)

+ (void)load {
    @autoreleasepool {
        MTLValueTransformer *dateValueTransformer =
        [MTLValueTransformer reversibleTransformerWithForwardBlock:^id(id dateOrDateString) {
            // Some old model versions would serialize NSDates directly, so handle that, too.
            if ([dateOrDateString isKindOfClass:[NSDate class]]) return dateOrDateString;
            else if ([dateOrDateString isKindOfClass:[NSString class]]) return [NSDateFormatter dateFromISO8601String:dateOrDateString];
            else return nil;
        } reverseBlock:^id(id date) {
            if (![date isKindOfClass:[NSDate class]]) return nil;
            return [NSDateFormatter ISO8601StringFromDate:date];
        }];
        
        [NSValueTransformer setValueTransformer:dateValueTransformer forName:GHDateValueTransformerName];
    }
}

@end
