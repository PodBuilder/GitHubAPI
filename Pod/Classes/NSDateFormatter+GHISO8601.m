//
// NSDateFormatter+GHISO8601.m
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import "NSDateFormatter+GHISO8601.h"
#import <ISO8601DateFormatter/ISO8601DateFormatter.h>

@implementation NSDateFormatter (GHISO8601)

+ (NSDate *)dateFromISO8601String:(NSString *)str {
    NSParameterAssert(str != nil);
    
    // ISO8601DateFormatter isn't thread-safe, because all instances share some
    // unsynchronized global state, so we want to always access it from the same
    // GCD queue and avoid any race conditions.
    static ISO8601DateFormatter *dateParsingFormatter;
    static dispatch_queue_t dateParsingQueue;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateParsingFormatter = [[ISO8601DateFormatter alloc] init];
        dateParsingQueue = dispatch_queue_create("com.wjksun.GitHubAPI.NSDateFormatter", DISPATCH_QUEUE_SERIAL);
    });
    
    __block NSDate *date;
    dispatch_sync(dateParsingQueue, ^{
        date = [dateParsingFormatter dateFromString:str];
    });
    
    return date;
}

+ (NSString *)ISO8601StringFromDate:(NSDate *)date {
    NSParameterAssert(date != nil);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    return [formatter stringFromDate:date];
}

@end
