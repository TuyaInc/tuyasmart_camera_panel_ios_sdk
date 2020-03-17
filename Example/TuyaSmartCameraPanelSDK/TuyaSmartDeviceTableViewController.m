//
//  TuyaSmartDeviceTableViewController.m
//  TuyaSmartCamera_Example
//
//  Created by 傅浪 on 2018/12/24.
//  Copyright © 2018 fulang@tuya.com. All rights reserved.
//

#import "TuyaSmartDeviceTableViewController.h"
#import "TuyaSmartUserConfig.h"
#import "TuyaSmartLoginManager.h"
#import "TuyaSmartDeviceManager.h"
#import <TuyaSmartHomeKit/TuyaSmartKit.h>
#import <TuyaSmartPanelSDK/TuyaSmartPanelSDK.h>
#import <TuyaSmartCameraPanelSDK/TuyaSmartCameraPanelSDK.h>

@interface TuyaSmartDeviceTableViewController ()<TuyaSmartPanelSDKDelegate, TuyaSmartCameraPanelSDKDelegate>

@property (nonatomic, strong) NSArray<TuyaSmartDeviceModel *> *dataSource;

@end

@implementation TuyaSmartDeviceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设备列表";
    [TuyaSmartCameraPanelSDK sharedInstance].delegate = self;
    [self doLogin:^{
        [[TuyaSmartDeviceManager sharedManager] getAllDevice];
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadData) name:@"deviceDidUpdate" object:nil];
    [TuyaSmartPanelSDK sharedInstance].delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadData];
}

- (void)doLogin:(void(^)(void))complete {
    NSString *countryCode = [TuyaSmartUserConfig countryCode];
    NSString *phoneNumer = [TuyaSmartUserConfig phoneNumber];
    NSString *email = [TuyaSmartUserConfig email];
    NSString *uid = [TuyaSmartUserConfig uid];
    NSString *password = [TuyaSmartUserConfig password];
    if (uid.length > 0) {
        [TuyaSmartLoginManager loginByUid:countryCode uid:uid password:password complete:^(NSError * _Nonnull error) {
            if (error) {
                NSLog(@"login error: %@", error);
            }
            !complete?:complete();
        }];
    }
    else if (phoneNumer.length > 0) {
        [TuyaSmartLoginManager loginByPhone:countryCode phoneNumber:phoneNumer password:password complete:^(NSError * _Nonnull error) {
            if (error) {
                NSLog(@"login error: %@", error);
            }
            !complete?:complete();
        }];
    }
    else if (email.length > 0) {
        [TuyaSmartLoginManager loginByEmail:countryCode email:email password:password complete:^(NSError * _Nonnull error) {
            if (error) {
                NSLog(@"login error: %@", error);
            }
            !complete?:complete();
        }];
    }
}

#pragma mark - private

- (void)reloadData {
    _dataSource = [TuyaSmartDeviceManager sharedManager].deviceList;
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cameraDevice"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cameraDevice"];
    }
    TuyaSmartDeviceModel *deviceModel = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.text = deviceModel.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TuyaSmartDeviceModel *deviceMode = [self.dataSource objectAtIndex:indexPath.row];
    [TuyaSmartPanelSDK sharedInstance].homeId = deviceMode.homeId;
    [[TuyaSmartPanelSDK sharedInstance] gotoPanelViewControllerWithDevice:deviceMode completion:nil];
}

- (UIViewController *)vcForSpecialPanelWithDeviceModel:(TuyaSmartDeviceModel *)device {
    return [[TuyaSmartCameraPanelSDK sharedInstance] cameraViewControllerWithForDevice:device];
}

//- (void)deviceGotoCloudServicePanel:(TuyaSmartDeviceModel *)deviceModel {
//    NSLog(@"---- device goto cloud service panel");
//}
// if you want develop setting panel by yourself, implement this method return your own setting view controller.
//- (void)deviceGotoSettingPanel:(TuyaSmartDeviceModel *)deviceModel {
//    NSLog(@"---- device goto setting panel");
//}

//- (void)cameraPanelSDK:(TuyaSmartCameraPanelSDK *)cameraPanelSDK deviceGotoSettingPanel:(TuyaSmartDeviceModel *)deviceModel {
//    NSLog(@"---- deviceGotoSettingPanel");
//}
////
//- (void)cameraPanelSDK:(TuyaSmartCameraPanelSDK *)cameraPanelSDK deviceGotoCameraNewPlayBackPanel:(TuyaSmartDeviceModel *)deviceModel {
//    NSLog(@"---- deviceGotoCameraNewPlayBackPanel");
//}
////
//- (void)cameraPanelSDK:(TuyaSmartCameraPanelSDK *)cameraPanelSDK deviceGotoCameraCloudStoragePanel:(TuyaSmartDeviceModel *)deviceModel {
//    NSLog(@"---- deviceGotoCameraCloudStoragePanel");
//}
////
//- (void)cameraPanelSDK:(TuyaSmartCameraPanelSDK *)cameraPanelSDK deviceGotoCameraMessageCenterPanel:(TuyaSmartDeviceModel *)deviceModel {
//    NSLog(@"---- deviceGotoCameraMessageCenterPanel");
//}
////
//- (void)cameraPanelSDK:(TuyaSmartCameraPanelSDK *)cameraPanelSDK deviceGotoPhotoLibrary:(TuyaSmartDeviceModel *)deviceModel {
//    NSLog(@"---- deviceGotoPhotoLibrary");
//}

- (BOOL)cameraPanelSDK:(TuyaSmartCameraPanelSDK *)cameraPanelSDK deviceGotoCustomCameraInfoPanel:(TuyaSmartDeviceModel *)deviceModel {
    NSLog(@"---- deviceGotoCustomCameraInfoPanel");
    return YES;
}
//
- (BOOL)cameraPanelSDK:(TuyaSmartCameraPanelSDK *)cameraPanelSDK deviceGotoCustomFeedbackPanel:(TuyaSmartDeviceModel *)deviceModel {
    NSLog(@"---- deviceGotoCustomFeedbackPanel");
    return YES;
}

@end
