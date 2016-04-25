//
//  RJNetRequestTool.h
//  问答
//
//  Created by lirenjie on 16/3/31.
//  Copyright © 2016年 Mr.zY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RJNetRequestTool : NSObject

+ (void)PATCHWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;
+ (void)PostWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;
+ (void)PostWithURL:(NSString *)url params:(NSDictionary *)params constructingBodyWithBlock:(void (^)(id formdata))block success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;
+ (void)GetWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;
+ (void)DeleteWithURL:(NSString *)url params:(NSDictionary *)params success:(void(^)(id json))success failure:(void(^)(NSError *error))failure;

@end

