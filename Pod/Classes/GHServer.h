//
// GHServer.h
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

/// The default URL scheme to use for Enterprise URLs, if none is explicitly known or specified.
extern NSString * const GHServerDefaultEnterpriseScheme;
/// The HTTPS URL scheme to use for Enterprise URLs.
extern NSString * const GHServerHTTPSEnterpriseScheme;

/// Represents a GitHub server instance (i.e. github.com or an Enterprise instance).
@interface GHServer : MTLModel

/// Returns \c YES if this is an Enterprise instance.
@property (nonatomic, assign, getter = isEnterprise, readonly) BOOL enterprise;

/// The base URL to the instance associated with this server.
@property (nonatomic, copy, readonly) NSURL *baseURL;

/// The base URL to the API we should use for requests to this server
/// (i.e., Enterprise or github.com).
/// \remarks This URL is constructed from the baseURL.
@property (nonatomic, copy, readonly) NSURL *APIEndpoint;

/// The base URL to the website for the instance (the
/// Enterprise landing page or github.com).
/// \remarks This URL is constructed from the baseURL.
@property (nonatomic, copy, readonly) NSURL *baseWebURL;

/// Returns the server instance for github.com
+ (instancetype)dotComServer;

/// Returns either the Enterprise instance for a given base URL,
/// or \c +dotComServer if \c baseURL is nil.
+ (instancetype)serverWithBaseURL:(NSURL *)baseURL;

@end
