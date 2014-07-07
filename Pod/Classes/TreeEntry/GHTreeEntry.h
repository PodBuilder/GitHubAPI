//
//  GHTreeEntry.h
//  OctoKit
//
//  Created by Josh Abernathy on 9/5/13.
//  Copyright (c) 2013 GitHub. All rights reserved.
//

#import <GitHubAPI/GHObject.h>

/// The types of tree entries.
typedef NS_ENUM(NSUInteger, GHTreeEntryType) {
    /// A blob of data.
    GHTreeEntryTypeBlob,
    /// A tree of entries.
    GHTreeEntryTypeTree,
    /// A commit.
    GHTreeEntryTypeCommit,
};

/// The file mode of the entry.
typedef NS_ENUM(NSUInteger, GHTreeEntryMode) {
    /// File (blob) mode.
    GHTreeEntryModeFile,
    /// Executable (blob) mode.
    GHTreeEntryModeExecutable,
    /// Subdirectory (tree) mode.
    GHTreeEntryModeSubdirectory,
    /// Submodule (commit) mode.
    GHTreeEntryModeSubmodule,
    /// Blob which specifies the path of a symlink.
    GHTreeEntryModeSymlink,
};

/// A class cluster for git tree entries.
@interface GHTreeEntry : GHObject

/// The SHA of the entry.
@property (nonatomic, readonly, copy) NSString *SHA;

/// The repository-relative path.
@property (nonatomic, readonly, copy) NSString *path;

/// The type of the entry.
@property (nonatomic, readonly, assign) GHTreeEntryType type;

/// The mode of the entry.
@property (nonatomic, readonly, assign) GHTreeEntryMode mode;

@end
