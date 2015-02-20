//
//  packInfoRoomCell.h
//  myPota
//
//  Created by Rodrigo Pimentel on 03/11/14.
//  Copyright (c) 2014 web. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface p2_Package_Info_Cell_Room_Travel : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imgType;

@property (strong, nonatomic) IBOutlet UILabel *lblType;
@property (strong, nonatomic) IBOutlet UILabel *lblNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblPrice;

@property (strong, nonatomic) IBOutlet UIStepper *stepper;

@property (strong, nonatomic) IBOutlet UIImageView *ditLine;
@property (strong, nonatomic) IBOutlet UIImageView *endLine;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@end
