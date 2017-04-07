//
//  TXSecretaryField.m
//  GroupBuyUserAPP
//
//  Created by tianXin on 16/3/21.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import "TXSecretaryField.h"

@interface TXSecretaryField (){
    UIImage *_forcusImage;
    UIImage *_normalImage;
    UIImage *_dotImage;
}
@end


@implementation TXSecretaryField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self commonSetup];
        self.secureTextEntry = YES;
        self.textColor = [UIColor grayColor];
        self.font = [UIFont systemFontOfSize:0];
        self.textAlignment = NSTextAlignmentCenter;
        self.tintColor = [UIColor whiteColor];
    }
    return self;
}

- (void)commonSetup
{
    _forcusImage = [UIImage imageNamed:@"member_center_key_selected.png"];
//    _forcusImage = [_forcusImage resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4)];
    _normalImage = [UIImage imageNamed:@"member_center_key.png"];
 //   _normalImage = [_normalImage resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4)];
    _dotImage = [UIImage imageNamed:@"Noaccess_Point_ic.png"];
  //  _dotImage = [_dotImage resizableImageWithCapInsets:UIEdgeInsetsMake(4, 4, 4, 4)];
    [self addTarget:self action:@selector(textFieldEditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textFieldEditingDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
    [self addTarget:self action:@selector(textFieldEditingDidChanged:) forControlEvents:UIControlEventEditingChanged];
}

- (void)textFieldEditingDidBegin:(id)sender
{
    self.text = @"";
    [self setNeedsDisplay];
}

- (void)textFieldEditingDidEnd:(id)sender
{
    [self setNeedsDisplay];
}

- (void)textFieldEditingDidChanged:(id)sender{
    if ([self.text length]>6) {
        self.text = [self.text substringToIndex:6];
    }
    [self setNeedsDisplay];
    int textLength = [self.text length];
    if (self.secretaryDelegate && textLength==6) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [NSThread sleepForTimeInterval:0.2];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.secretaryDelegate sectetaryDidFinishedInput:self];
            });
        });
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGFloat imgWidth = (self.frame.size.width-5)/6.0;
    CGFloat imgHeight = self.frame.size.height;
    int textLength = [self.text length];
    for (int i=0; i<6; i++) {
        CGRect rect = CGRectMake((imgWidth+1)*i, 0, imgWidth, imgHeight);
        CGPoint center = CGPointMake(rect.origin.x+rect.size.width/2.0, rect.origin.y+rect.size.height/2.0);
        CGRect rect1 = CGRectMake(center.x-_dotImage.size.width/2.0, center.y-_dotImage.size.height/2.0, _dotImage.size.width, _dotImage.size.height);
        if (textLength > 0) {
            if ( i < textLength ) {
                [_forcusImage drawInRect:rect];
                [_dotImage drawInRect:rect1];
            }else{
                [_forcusImage drawInRect:rect];
            }
        }else{
            if ([self isFirstResponder]) {
                [_forcusImage drawInRect:rect];
            }else{
                [_normalImage drawInRect:rect];
            }
        }
    }
}





@end
