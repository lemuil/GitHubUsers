//
//  DetailViewController.h
//  GitHubUsers
//
//  Created by Oleg Kovalyok on 19.09.16, Mo.
//  Copyright © 2016 Oleg Kovalyok. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GitHubUser;

@interface DetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (strong, nonatomic) GitHubUser *user;

@end
