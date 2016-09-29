//
//  VICacheManager.h
//  VIMediaCacheDemo
//
//  Created by Vito on 4/21/16.
//  Copyright © 2016 Vito. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *VICacheManagerDidUpdateCacheNotification;

extern NSString *VICacheURLKey;
extern NSString *VICacheFragmentsKey;
extern NSString *VICacheContentLengthKey;

@interface VICacheManager : NSObject

+ (void)setCacheDirectory:(NSString *)cacheDirectory;
+ (NSString *)cacheDirectory;

+ (NSString *)cachedFilePathForURL:(NSURL *)url;

@end
