//
// GHObject+Private.h
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <GitHubAPI/GHObject.h>

@interface GHObject ()

/// The URL of the API endpoint from which the receiver came. This should only be
/// set at the time of initialization, and is responsible for filling in the
/// \c server property.
@property (nonatomic, strong) NSURL *baseURL;

@end
