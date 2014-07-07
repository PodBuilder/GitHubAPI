//
// NSURL+GHQuery.h
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <Foundation/Foundation.h>

@interface NSURL (GHQuery)

/// Parses the URL's query string into a set of key-value pairs.
/// \returns A (possibly empty) dictionary of the URL's query arguments.
/// Keys without a value in the query string will have a value of \c NSNull
/// in the dictionary.
/// \remarks If there are multiple keys with the same name, it is unspecified
/// which value will be used.
- (NSDictionary *)queryArguments;

@end
