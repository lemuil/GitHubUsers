//
//  UsersTableViewController.m
//  GitHubUsers
//
//  Created by Oleg Kovalyok on 19.09.16, Mo.
//  Copyright © 2016 Oleg Kovalyok. All rights reserved.
//

#import "UsersTableViewController.h"
#import "UserTableViewCell.h"
#import "GitHubUser.h"

@interface UsersTableViewController ()

@property (strong, nonatomic) NSMutableArray *gitHubUsers;

@end

@implementation UsersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.gitHubUsers = [NSMutableArray array];
    [self getUsersFromServer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - API

- (void)getUsersFromServer {
    
//    GitUser *lastUser = [self.gitUsers lastObject];
//    
//    [[DVServerManager sharedManager] getAllUsersSince:lastUser.userId success:^(NSArray *users) {
//        
//        [self.gitUsers addObjectsFromArray:users];
//        
//        NSMutableArray *newPaths = [NSMutableArray array];
//        for (int i = (int)[self.gitUsers count] - (int)[users count]; i < [self.gitUsers count]; i++) {
//            [newPaths addObject:[NSIndexPath indexPathForItem:i inSection:0]];
//        }
//        
//        [self.tableView beginUpdates];
//        [self.tableView insertRowsAtIndexPaths:newPaths withRowAnimation:UITableViewRowAnimationFade];
//        [self.tableView endUpdates];
//        
//        self.loadingData = NO;
//        
//    } failure:^(NSError *error, NSInteger statusCode) {
//        NSLog(@"%ld: %@",  (long)statusCode, [error localizedDescription]);
//    }];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 100;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowAvatar"]) {
        
    }
}


@end
