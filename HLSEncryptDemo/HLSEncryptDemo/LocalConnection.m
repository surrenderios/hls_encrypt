//
//  LocalConnection.m
//  HLSEncryptDemo
//
//  Created by Alex_Wu on 11/5/20.
//  Copyright © 2020 yiban. All rights reserved.
//

#import "LocalConnection.h"
#import <HTTPDataResponse.h>

@implementation LocalConnection

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path;
{
    if ([path.pathExtension isEqualToString:@"m3u8"]) {
        NSString *filePath = [self filePathForURI:path allowDirectory:NO];
        if (filePath.length == 0) {
            return NULL;
        }
        NSData *m3u8Data = [[NSData alloc] initWithContentsOfFile:filePath];
        return [[HTTPDataResponse alloc] initWithData:m3u8Data];
    }else if ([path.pathExtension isEqualToString:@"ts"]){
        NSObject<HTTPResponse> *response = [super httpResponseForMethod:method URI:path];
        return response;
    }
    return [super httpResponseForMethod:method URI:path];
}
@end
