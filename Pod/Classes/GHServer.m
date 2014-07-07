//
// GHServer.m
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <GitHubAPI/GHServer.h>
#import <GitHubAPI/GHServer+Private.h>

NSString * const GHServerDotComAPIEndpoint = @"https://api.github.com";
NSString * const GHServerDotComBaseWebURL = @"https://github.com";
NSString * const GHServerEnterpriseAPIEndpointPathComponent = @"api/v3";

// Enterprise defaults to HTTP, and not all instances have HTTPS set up.
NSString * const GHServerDefaultEnterpriseScheme = @"http";

// Expose Enterprise HTTPS scheme for clients.
NSString * const GHServerHTTPSEnterpriseScheme = @"https";

@interface GHServer ()

@property (nonatomic, copy, readwrite) NSURL *baseURL;

@end

@implementation GHServer

- (NSURL *)APIEndpoint {
    if (self.baseURL == nil) {
        // This environment variable can be used to debug API requests by
        // redirecting them to a different URL.
        NSString *endpoint = NSProcessInfo.processInfo.environment[@"API_ENDPOINT"];
        if (endpoint != nil) return [NSURL URLWithString:endpoint];
        
        return [NSURL URLWithString:GHServerDotComAPIEndpoint];
    } else {
        return [self.baseURL URLByAppendingPathComponent:GHServerEnterpriseAPIEndpointPathComponent isDirectory:YES];
    }
}

- (NSURL *)baseWebURL {
    if (self.baseURL == nil) return [NSURL URLWithString:GHServerDotComBaseWebURL];
    else return self.baseURL;
}

- (BOOL)isEnterprise {
    return self.baseURL != nil;
}

#pragma mark Lifecycle

+ (instancetype)dotComServer {
    static GHServer *dotComServer;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dotComServer = [[self alloc] initWithBaseURL:nil];
    });
    
    return dotComServer;
}

+ (instancetype)serverWithBaseURL:(NSURL *)baseURL {
    if (baseURL == nil) return [self dotComServer];
    return [[GHServer alloc] initWithBaseURL:baseURL];
}

- (instancetype)initWithBaseURL:(NSURL *)baseURL {
    self = [super init];
    if (self == nil) return nil;
    
    _baseURL = baseURL;
    
    return self;
}

#pragma mark Migration

+ (NSDictionary *)dictionaryValueFromArchivedExternalRepresentation:(NSDictionary *)externalRepresentation version:(NSUInteger)fromVersion {
    NSMutableDictionary *dictionaryValue = [[super dictionaryValueFromArchivedExternalRepresentation:externalRepresentation version:fromVersion] mutableCopy];
    
    NSString *baseURLString = externalRepresentation[@"baseURL"];
    if (baseURLString != nil) dictionaryValue[@"baseURL"] = [NSURL URLWithString:baseURLString] ?: [NSNull null];
    
    return dictionaryValue;
}

@end
