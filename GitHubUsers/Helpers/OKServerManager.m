//
//  OKServerManager.m
//  GitHubUsers
//
//  Created by Oleg Kovalyok on 19.09.16, Mo.
//  Copyright © 2016 Oleg Kovalyok. All rights reserved.
//

#import "OKServerManager.h"
#import "AFNetworking.h"
#import "GitHubUser.h"

@interface OKServerManager ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;

@end

@implementation OKServerManager

+ (OKServerManager *)sharedManager {
    static OKServerManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[OKServerManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSURL *url = [NSURL URLWithString:@"https://api.github.com"];
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    }
    return self;
}

#pragma mark - API

- (void)getAllUsersSince:(NSInteger)since success:(void(^)(NSArray *users))success failure:(void(^)(NSError *error, NSInteger statusCode))failure {
    
    NSString *stringSince = [NSString stringWithFormat:@"%d", since];
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                stringSince, @"since",
                                nil];
    
    [self.manager GET:@"/users" parameters:parameters progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        
        NSArray *dictionariesArray = responseObject;
        NSMutableArray *usersArray = [NSMutableArray array];

        for (NSDictionary *dictionary in dictionariesArray) {
            GitHubUser *gitHubUser = [[GitHubUser alloc] initWithDictionary:dictionary];
            [usersArray addObject:gitHubUser];
        }

        if (success) {
            success(usersArray);
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

- (void)getSearchResultForUsername:(NSString *)name success:(void(^)(NSArray *users))success failure:(void(^)(NSError *error, NSInteger statusCode))failure {
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                                name, @"q",
                                nil];
    

}

@end
