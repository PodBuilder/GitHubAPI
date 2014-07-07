//
//  GHTreeEntry.m
//  OctoKit
//
//  Created by Josh Abernathy on 9/5/13.
//  Copyright (c) 2013 GitHub. All rights reserved.
//

#import "GHTreeEntry.h"
#import "GHCommitTreeEntry.h"
#import "GHContentTreeEntry.h"
#import "GHBlobTreeEntry.h"

@implementation GHTreeEntry

#pragma mark Class Cluster

+ (NSDictionary *)contentClassesByType {
    return @{
             @"blob": [GHBlobTreeEntry class],
             @"tree": [GHContentTreeEntry class],
             @"commit": [GHCommitTreeEntry class],
             };
}

#pragma mark MTLJSONSerializing

+ (Class)classForParsingJSONDictionary:(NSDictionary *)JSONDictionary {
    NSString *type = JSONDictionary[@"type"];
    NSAssert(type != nil, @"GHTreeEntry JSON dictionary must contain a type string.");
    Class class = self.contentClassesByType[type];
    NSAssert(class != Nil, @"No known GHTreeEntry class for the type '%@'.", type);
    return class;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return [super.JSONKeyPathsByPropertyKey mtl_dictionaryByAddingEntriesFromDictionary:@{
                                                                                          @"SHA": @"sha",
                                                                                          }];
}

+ (NSValueTransformer *)typeJSONTransformer {
    NSDictionary *typeByName = @{
                                 @"blob": @(GHTreeEntryTypeBlob),
                                 @"tree": @(GHTreeEntryTypeTree),
                                 @"commit": @(GHTreeEntryTypeCommit),
                                 };
    
    return [MTLValueTransformer
            reversibleTransformerWithForwardBlock:^(NSString *typeName) {
                return typeByName[typeName];
            }
            reverseBlock:^(NSNumber *type) {
                return [typeByName allKeysForObject:type].lastObject;
            }];
}

+ (NSValueTransformer *)modeJSONTransformer {
    NSDictionary *typeByName = @{
                                 @"100644": @(GHTreeEntryModeFile),
                                 @"100755": @(GHTreeEntryModeExecutable),
                                 @"040000": @(GHTreeEntryModeSubdirectory),
                                 @"160000": @(GHTreeEntryModeSubmodule),
                                 @"120000": @(GHTreeEntryModeSymlink),
                                 };
    
    return [MTLValueTransformer
            reversibleTransformerWithForwardBlock:^(NSString *typeName) {
                return typeByName[typeName];
            }
            reverseBlock:^(NSNumber *type) {
                return [typeByName allKeysForObject:type].lastObject;
            }];
}

#pragma mark NSObject

- (NSUInteger)hash {
    return self.SHA.hash;
}

- (BOOL)isEqual:(GHTreeEntry *)entry {
    if (self == entry) return YES;
    if (![entry isKindOfClass:self.class]) return NO;
    
    return [entry.SHA isEqual:self.SHA];
}

@end
