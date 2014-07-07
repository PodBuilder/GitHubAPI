//
// NSValueTransformer+GHPredefinedTransformers.h
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <Foundation/Foundation.h>

/// The name for a value transformer that converts GitHub API date strings into dates and back.
/// \remarks For backwards compatibility reasons, the forward transformation
/// accepts an NSString (which will be parsed) or an NSDate (which will be passed
/// through unmodified).
extern NSString * const GHDateValueTransformerName;
