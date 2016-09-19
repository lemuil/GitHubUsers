//
//  GitHubUser.h
//  GitHubUsers
//
//  Created by Oleg Kovalyok on 19.09.16, Mo.
//  Copyright © 2016 Oleg Kovalyok. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GitHubUser : NSObject

@property (strong, nonatomic) NSString *nameUser;
@property (strong, nonatomic) NSString *linkUser;
@property (strong, nonatomic) NSURL *avatarURL;
@property (assign, nonatomic) NSInteger userId;

- (GitHubUser *)initWithDictionary:(NSDictionary *)dictionary;

@end
