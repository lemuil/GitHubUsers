//
//  UserTableViewCell.m
//  GitHubUsers
//
//  Created by Oleg Kovalyok on 19.09.16, Mo.
//  Copyright © 2016 Oleg Kovalyok. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

#pragma mark - Action

- (IBAction)profileLinkDidTouch:(UIButton *)sender {
    if (self.user) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.user.linkUser]];
    }
}

@end
