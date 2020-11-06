//
//  LocalServer.h
//  HLSEncryptDemo
//
//  Created by Alex_Wu on 11/5/20.
//  Copyright © 2020 yiban. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocalServer : NSObject
- (instancetype)initWithServerContainer:(NSString *)path;
- (void)startServer;
- (void)stopServer;
@end

NS_ASSUME_NONNULL_END
