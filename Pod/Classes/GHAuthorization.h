//
// GHAuthorization.h
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <GitHubAPI/GHObject.h>

/// An OAuth token returned from the /authorizations API.
@interface GHAuthorization : GHObject

/// The access token itself. You should treat this as you would treat the user's password.
/// \remarks This property will not be serialized to JSON. If you need to persist it, save it to the Keychain.
@property (nonatomic, readonly, copy) NSString *token;

@end
