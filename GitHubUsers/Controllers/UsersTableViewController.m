//
//  UsersTableViewController.m
//  GitHubUsers
//
//  Created by Oleg Kovalyok on 19.09.16, Mo.
//  Copyright © 2016 Oleg Kovalyok. All rights reserved.
//

#import "UsersTableViewController.h"
#import "DetailViewController.h"
#import "UserTableViewCell.h"
#import "GitHubUser.h"
#import "OKServerManager.h"
#import "UIKit+AFNetworking.h"

@interface UsersTableViewController ()

@property (strong, nonatomic) NSMutableArray *gitHubUsers;
@property (strong, nonatomic) NSMutableArray *lastUsers;
@property (assign, nonatomic) BOOL loadingData;

@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.gitHubUsers = [NSMutableArray array];
    [self getUsersFromServer];
    self.loadingData = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - API

- (void)getUsersFromServer {
    
    GitHubUser *lastUser = [self.gitHubUsers lastObject];
    
    [[OKServerManager sharedManager] getAllUsersSince:lastUser.userId success:^(NSArray *users) {
        
        [self.gitHubUsers addObjectsFromArray:users];
        
        NSMutableArray *newPaths = [NSMutableArray array];
        for (int i = (int)[self.gitHubUsers count] - (int)[users count]; i < [self.gitHubUsers count]; i++) {
            [newPaths addObject:[NSIndexPath indexPathForItem:i inSection:0]];
        }
        
        [self.tableView beginUpdates];
        [self.tableView insertRowsAtIndexPaths:newPaths withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView endUpdates];
        
        self.loadingData = NO;
        
    } failure:^(NSError *error, NSInteger statusCode) {
        NSLog(@"%ld: %@",  (long)statusCode, [error localizedDescription]);
    }];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.gitHubUsers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserCell"];
    }
    
    cell.avatarButton.tag = indexPath.row;
    
    GitHubUser *gitHubUser = [self.gitHubUsers objectAtIndex:indexPath.row];

    cell.nameLabel.text = gitHubUser.nameUser;
    [cell.profileButton setTitle:gitHubUser.linkUser forState:UIControlStateNormal];
    cell.user = gitHubUser;
    
    __weak UserTableViewCell *weakCell = cell;
    NSURLRequest *request = [NSURLRequest requestWithURL:gitHubUser.avatarURL];
    
    cell.imageView.image = nil;
    
    [cell.imageView setImageWithURLRequest:request placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        [weakCell.avatarButton setImage:image forState:UIControlStateNormal];
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"failed to load user image");
    }];
    
    //TODO: Refactor code to cell's function
    //[cell configureCell:gitHubUser];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height / 1.3f) {
        if (!self.loadingData) {
            self.loadingData = YES;
            [self getUsersFromServer];
        }
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowAvatar"]) {
        DetailViewController *detailVC = [segue destinationViewController];

        GitHubUser *user = self.gitHubUsers[[sender tag]];
        detailVC.user = user;
    }
}

@end












