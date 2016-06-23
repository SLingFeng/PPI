//
//  Model.h
//  GenHao
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 LingFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (retain, nonatomic) NSMutableArray *title;
@property (retain, nonatomic) NSMutableArray *width;
@property (retain, nonatomic) NSMutableArray *height;
@property (retain, nonatomic) NSMutableArray *scale;
-(void)createModel;
+ (BOOL)isValidatePassword:(NSString *)passWord;

@end
