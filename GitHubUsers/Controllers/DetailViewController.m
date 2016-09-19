//
//  DetailViewController.m
//  GitHubUsers
//
//  Created by Oleg Kovalyok on 19.09.16, Mo.
//  Copyright © 2016 Oleg Kovalyok. All rights reserved.
//

#import "DetailViewController.h"
#import "UIKit+AFNetworking.h"
#import "GitHubUser.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //TODO: Fix left item button - white color
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    
    [self loadAvatarImageView];
}

- (void)loadAvatarImageView {

    self.avatarImageView.image = nil;
    
    NSURLRequest *request = [NSURLRequest requestWithURL:self.user.avatarURL];
    [self.avatarImageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        self.avatarImageView.image = image;
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"failed to get image");
    }];

}



@end
