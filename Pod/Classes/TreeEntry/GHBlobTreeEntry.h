//
//  GHBlobTreeEntry.h
//  OctoKit
//
//  Created by Josh Abernathy on 9/30/13.
//  Copyright (c) 2013 GitHub. All rights reserved.
//

#import <GitHubAPI/GHContentTreeEntry.h>

/// A blob tree entry.
@interface GHBlobTreeEntry : GHContentTreeEntry

/// The size of the blob in bytes.
@property (nonatomic, readonly, assign) NSUInteger size;

@end
