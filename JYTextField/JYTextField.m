//
//  JYTextField.m
//  meetingManager
//
//  Created by kinglate on 13-1-22.
//  Copyright (c) 2013年 joyame. All rights reserved.
//

#import "JYTextField.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>

@implementation JYTextField
{
	CGFloat _cornerRadio;
	UIColor *_borderColor;
	CGFloat _borderWidth;
	UIColor *_lightColor;
	CGFloat _lightSize;
	UIColor *_lightBorderColor;
}

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		[self setFocusColorWithCornerRadio:5
		                       borderColor:[UIColor colorWithRed:166 / 255.f green:166 / 255.f blue:166 / 255.f alpha:1.0f]
		                       borderWidth:2
		                        lightColor:[UIColor colorWithRed:0.729 green:0.400 blue:0.176 alpha:1.000]
		                         lightSize:8
		                  lightBorderColor:[UIColor colorWithRed:235 / 255.f green:235 / 255.f blue:235 / 255.f alpha:1.0f]];
	}
	return self;
}

- (void)awakeFromNib {
	[self setFocusColorWithCornerRadio:5
	                       borderColor:[UIColor colorWithRed:166 / 255.f green:166 / 255.f blue:166 / 255.f alpha:1.0f]
	                       borderWidth:2
	                        lightColor:[UIColor colorWithRed:0.749 green:0.420 blue:0.184 alpha:1.000]
	                         lightSize:8
	                  lightBorderColor:[UIColor colorWithRed:235 / 255.f green:235 / 255.f blue:235 / 255.f alpha:1.0f]];
}

- (void)setFocusColorWithCornerRadio:(CGFloat)radio borderColor:(UIColor *)bColor borderWidth:(CGFloat)bWidth lightColor:(UIColor *)lColor lightSize:(CGFloat)lSize lightBorderColor:(UIColor *)lbColor {
	_borderColor = bColor;
	_cornerRadio = radio;
	_borderWidth = bWidth;
	_lightColor = lColor;
	_lightSize = lSize;
	_lightBorderColor = lbColor;

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledBeginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFiledEndEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
	[self.layer setCornerRadius:_cornerRadio];
	[self.layer setBorderColor:_borderColor.CGColor];
	[self.layer setBorderWidth:_borderWidth];
	[self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
	[self setBackgroundColor:[UIColor whiteColor]];
	[self.layer setMasksToBounds:NO];
}

- (void)textFiledBeginEditing:(NSNotification *)notification {
	[[self layer] setShadowOffset:CGSizeMake(0, 0)];
	[[self layer] setShadowRadius:_lightSize];
	[[self layer] setShadowOpacity:1];
	[[self layer] setShadowColor:_lightColor.CGColor];
	[self.layer setBorderColor:_lightBorderColor.CGColor];
}

- (void)textFiledEndEditing:(NSNotification *)notification {
	[[self layer] setShadowOffset:CGSizeZero];
	[[self layer] setShadowRadius:0];
	[[self layer] setShadowOpacity:0];
	[[self layer] setShadowColor:nil];
	[self.layer setBorderColor:_borderColor.CGColor];
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (CGRect)textRectForBounds:(CGRect)bounds {
	CGRect inset = CGRectMake(bounds.origin.x + _cornerRadio * 2,
	                          bounds.origin.y,
	                          bounds.size.width - _cornerRadio * 2,
	                          bounds.size.height);
	return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
	CGRect inset = CGRectMake(bounds.origin.x + _cornerRadio * 2,
	                          bounds.origin.y,
	                          bounds.size.width - _cornerRadio * 2,
	                          bounds.size.height);
	return inset;
}

@end
