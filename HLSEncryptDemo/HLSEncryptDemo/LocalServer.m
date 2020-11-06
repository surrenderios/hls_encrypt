//
//  LocalServer.m
//  HLSEncryptDemo
//
//  Created by Alex_Wu on 11/5/20.
//  Copyright © 2020 yiban. All rights reserved.
//

#import "LocalServer.h"
#import <HTTPServer.h>
#import "LocalConnection.h"

static NSString *const LocalAddress = @"http://127.0.0.1";

@interface LocalServer ()
@property (nonatomic, copy) NSString *container;
@property (nonatomic, assign) BOOL isRunning;
@property (nonatomic, strong) HTTPServer *localServer;
@end

@implementation LocalServer
- (instancetype)initWithServerContainer:(NSString *)path;
{
    if (self = [super init]) {
        _container = path;
    }
    return self;
}

- (void)startServer;
{
    if (self.isRunning) {
        return;
    }
    self.isRunning = [self startLocalServer];
    if (self.isRunning) {
        NSLog(@">>>>>>>>>server is running");
    }
}

- (void)stopServer;
{
    [self stopLocalServer];
}

- (BOOL)startLocalServer
{
    if (!self.localServer) {
        self.localServer = [[HTTPServer alloc] init];
        [self.localServer setPort:8080];
        [self.localServer setType:@"_http._tcp."];
        [self.localServer setName:@"HLSDownloader_Local_Server"];
        [self.localServer setDocumentRoot:self.container];
        [self.localServer setConnectionClass:[LocalConnection class]];
    }
    
    if (self.localServer.isRunning) {
        return YES;
    }
    
    return [self.localServer start:nil];
}

- (void)stopLocalServer
{
    [self.localServer stop:YES];
}
@end
