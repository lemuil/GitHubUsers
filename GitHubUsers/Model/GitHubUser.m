//
//  GitHubUser.m
//  GitHubUsers
//
//  Created by Oleg Kovalyok on 19.09.16, Mo.
//  Copyright © 2016 Oleg Kovalyok. All rights reserved.
//

#import "GitHubUser.h"

@implementation GitHubUser

- (GitHubUser *)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.nameUser = [dictionary objectForKey:@"login"];
        self.linkUser = [dictionary objectForKey:@"html_url"];
        self.userId   = [[dictionary objectForKey:@"id"] integerValue];
        
        NSString *avatarString = [dictionary objectForKey:@"avatar_url"];
        self.avatarURL = [NSURL URLWithString:avatarString];
    }
    return self;
}

@end
