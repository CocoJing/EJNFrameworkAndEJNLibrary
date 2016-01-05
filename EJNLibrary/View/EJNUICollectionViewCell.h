//
//  EJNUICollectionViewCell.h
//  Enjoyney
//
//  Created by Andrew Liu on 7/23/15.
//  Copyright (c) 2015 enjoyney. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EJNUILabel.h"
#import "EJNUIImageView.h"

@interface EJNUICollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet EJNUILabel *label;
@property (weak, nonatomic) IBOutlet EJNUIImageView *imageView;
@property (weak, nonatomic) IBOutlet EJNUIImageView *imageViewCheckMark;

@end
