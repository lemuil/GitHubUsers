//
//  OKServerManager.h
//  GitHubUsers
//
//  Created by Oleg Kovalyok on 19.09.16, Mo.
//  Copyright © 2016 Oleg Kovalyok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OKServerManager : NSObject

+ (OKServerManager *)sharedManager;

- (void)getAllUsersSince:(NSInteger)since success:(void(^)(NSArray *users))success failure:(void(^)(NSError *error, NSInteger statusCode))failure;

@end
