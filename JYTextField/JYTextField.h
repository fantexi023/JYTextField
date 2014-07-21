//
//  JYTextField.h
//  meetingManager
//
//  Created by kinglate on 13-1-22.
//  Copyright (c) 2013年 joyame. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JYTextField : UITextField

@property (strong, nonatomic) NSString *pattern;

- (void)setFocusColorWithCornerRadio:(CGFloat)radio
                         borderColor:(UIColor *)bColor
                         borderWidth:(CGFloat)bWidth
                          lightColor:(UIColor *)lColor
                           lightSize:(CGFloat)lSize
                    lightBorderColor:(UIColor *)lbColor;
@end
