//
// GHObject.h
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import <GitHubAPI/GHServer.h>

/// The base model class for any objects retrieved through the GitHub API.
@interface GHObject : MTLModel <MTLJSONSerializing>

/// The unique ID for this object. This is only guaranteed to be unique among
/// objects of the same type, from the same server.
///
/// \remarks By default, the JSON representation for this property assumes a numeric
/// representation (which is the case for most API objects). Subclasses may
/// override the \c +objectIDJSONTransformer method to change this behavior.
@property (nonatomic, copy, readonly) NSString *objectID;

/// The server this object is associated with.
/// \remarks This object is not encoded into JSON.
@property (nonatomic, strong, readonly) GHServer *server;

@end
