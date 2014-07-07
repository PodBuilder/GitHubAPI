//
//  GHContentTreeEntry.h
//  OctoKit
//
//  Created by Josh Abernathy on 9/30/13.
//  Copyright (c) 2013 GitHub. All rights reserved.
//

//#import <OctoKit/OctoKit.h>
#import <GitHubAPI/GHTreeEntry.h>

/// A tree entry which has URL-addressable content.
@interface GHContentTreeEntry : GHTreeEntry

/// The URL for the content of the entry.
@property (nonatomic, readonly, strong) NSURL *URL;

@end
