//
// GHBranch.h
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <GitHubAPI/GHObject.h>

/// A GitHub repository branch.
@interface GHBranch : GHObject

/// The name of the branch.
@property (nonatomic, copy, readonly) NSString *name;

/// The SHA of the last commit on this branch.
@property (nonatomic, copy, readonly) NSString *lastCommitSHA;

/// The API URL to the last commit on this branch.
@property (nonatomic, copy, readonly) NSURL *lastCommitURL;

@end
