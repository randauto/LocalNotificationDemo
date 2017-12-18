//
//  ViewController.m
//  LocalNotificationDemo
//
//  Created by TuanLQ on 11/27/17.
//  Copyright © 2017 TuanLQ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showNotificationLocal:(id)sender {
    UNNotificationCategory* generalCategory = [UNNotificationCategory
                                               categoryWithIdentifier:@"GENERAL"
                                               actions:@[]
                                               intentIdentifiers:@[]
                                               options:UNNotificationCategoryOptionCustomDismissAction];
    
    // Create the custom actions for expired timer notifications.
    UNNotificationAction* snoozeAction = [UNNotificationAction
                                          actionWithIdentifier:@"SNOOZE_ACTION"
                                          title:@"Snooze"
                                          options:UNNotificationActionOptionNone];
    
    UNNotificationAction* stopAction = [UNNotificationAction
                                        actionWithIdentifier:@"STOP_ACTION"
                                        title:@"Stop"
                                        options:UNNotificationActionOptionForeground];
    
    // Create the category with the custom actions.
    UNNotificationCategory* expiredCategory = [UNNotificationCategory
                                               categoryWithIdentifier:@"TIMER_EXPIRED"
                                               actions:@[snoozeAction, stopAction]
                                               intentIdentifiers:@[]
                                               options:UNNotificationCategoryOptionNone];
    
    // Register the notification categories.
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    [center setNotificationCategories:[NSSet setWithObjects:generalCategory, expiredCategory,
                                       nil]];
    
    
}


@end
