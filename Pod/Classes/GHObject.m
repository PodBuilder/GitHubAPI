//
// GHObject.m
// GitHubAPI
//
// Created by William Kent on 2013-07-07.
// Copyright (c) 2013 GitHub. Licensed under the MIT license.
//

#import <GitHubAPI/GHObject.h>
#import <GitHubAPI/GHObject+Private.h>
#import <Mantle/EXTKeyPathCoding.h>

@interface GHObject ()

@property (nonatomic, strong, readwrite) GHServer *server;

@end

#pragma mark -

@implementation GHObject

- (instancetype)init {
    self = [super init];
    if (self == nil) return nil;
    
    self.server = [GHServer dotComServer];
    
    return self;
}

+ (NSSet *)propertyKeys {
    NSMutableSet *keys = [[super propertyKeys] mutableCopy];
    
    // This is a derived property.
    [keys removeObject:@keypath(GHObject.new, baseURL)];
    
    return keys;
}

+ (NSUInteger)modelVersion {
    return 5;
}

+ (NSDictionary *)dictionaryValueFromArchivedExternalRepresentation:(NSDictionary *)externalRepresentation version:(NSUInteger)fromVersion {
    id objectID = externalRepresentation[@"id"];
    if (objectID == nil) return nil;
    
    return @{ @"objectID": objectID };
}

#pragma mark MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{ @"objectID": @"id", @"server": [NSNull null] };
}

+ (NSValueTransformer *)objectIDJSONTransformer {
    return [MTLValueTransformer
            reversibleTransformerWithForwardBlock:^id(NSNumber *num) {
                return num.stringValue;
            } reverseBlock:^id(NSString *str) {
                if (str == nil) return nil;
                return [NSDecimalNumber decimalNumberWithString:str];
            }];
}

#pragma mark Properties

- (NSURL *)baseURL {
    return self.server.baseURL;
}

- (void)setBaseURL:(NSURL *)baseURL {
    if ([self.baseURL isEqual:baseURL]) return;
    
    if (baseURL == nil || [baseURL.host isEqualToString:@"api.github.com"]) {
        self.server = [GHServer dotComServer];
    } else {
        NSString *baseURLString = [NSString stringWithFormat:@"%@://%@", baseURL.scheme, baseURL.host];
        self.server = [GHServer serverWithBaseURL:[NSURL URLWithString:baseURLString]];
    }
}

- (BOOL)validateObjectID:(id *)objectID error:(NSError **)error {
    if ([*objectID isKindOfClass:[NSString class]]) {
        return YES;
    } else if ([*objectID isKindOfClass:[NSNumber class]]) {
        *objectID = [*objectID stringValue];
        return YES;
    }
    
    return *objectID == nil;
}

#pragma mark NSObject

- (NSUInteger)hash {
    return self.server.hash ^ self.objectID.hash;
}

- (BOOL)isEqual:(GHObject *)object {
    if (self == object) return YES;
    if (![object isKindOfClass:[self class]]) return NO;
    
    return [object.server isEqual:self.server] && [object.objectID isEqual:self.objectID];
}

@end
