//
//  UserTableViewCell.h
//  GitHubUsers
//
//  Created by Oleg Kovalyok on 19.09.16, Mo.
//  Copyright © 2016 Oleg Kovalyok. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GitHubUser.h"

@interface UserTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *avatarButton;
@property (weak, nonatomic) IBOutlet UILabel  *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *profileButton;

@property (strong, nonatomic) GitHubUser *user;

@end
