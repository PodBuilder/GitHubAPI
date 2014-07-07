//
// NSDateFormatter+GHISO8601.h
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (GHISO8601)

+ (NSDate *)dateFromISO8601String:(NSString *)str;
+ (NSString *)ISO8601StringFromDate:(NSDate *)date;

@end
