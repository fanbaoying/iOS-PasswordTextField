//
//  TXSecretaryField.h
//  GroupBuyUserAPP
//
//  Created by tianXin on 16/3/21.
//  Copyright © 2016年 tianXin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TXSecretaryField;

@protocol TXSecretaryFieldDelegate <NSObject>
-(void)sectetaryDidFinishedInput:(TXSecretaryField *)secField;
@end

@interface TXSecretaryField : UITextField
@property(nonatomic,weak) id<TXSecretaryFieldDelegate> secretaryDelegate;

@end
