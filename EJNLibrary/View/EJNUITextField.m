//
//  EJNUITextField.m
//  Enjoyney
//
//  Created by Ryanfu on 15/3/18.
//  Copyright (c) 2015年 Ryanfu. All rights reserved.
//

#import "EJNUITextField.h"

@implementation EJNUITextField

- (CGFloat)heightHiddenBehindDatePicker{
    CGFloat datePickerHeight = 253.0f;
    CGFloat viewHeight;
    if(IsDevicePhone6P)
    {
        viewHeight = 736.0f;
    }
    else if (IsDevicePhone6)
    {
        viewHeight = 667.0f;
    }
    else if (IsDevicePhone5)
    {
        viewHeight = 568.0f;
    }
    else if (IsDevicePhone4)
    {
        viewHeight = 480.0f;
    }
    CGFloat height = self.frame.origin.y + self.frame.size.height - viewHeight + datePickerHeight;
    return height;
}

- (CGFloat)heightHiddenBehindKeyboard{
    CGFloat keyboardHeight;
    CGFloat viewHeight;
    if(IsDevicePhone6P)
    {
        keyboardHeight = 271.0f;
        viewHeight = 736.0f;
    }
    else if (IsDevicePhone6)
    {
        keyboardHeight = 258.0f;
        viewHeight = 667.0f;
    }
    else if (IsDevicePhone5)
    {
        keyboardHeight = 253.0f;
        viewHeight = 568.0f;
    }
    else if (IsDevicePhone4)
    {
        keyboardHeight = 253.0f;
        viewHeight = 480.0f;
    }
    CGFloat height = self.frame.origin.y + self.frame.size.height - viewHeight + keyboardHeight;
    return height;
}

@end

