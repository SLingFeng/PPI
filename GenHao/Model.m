//
//  Model.m
//  GenHao
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 LingFeng. All rights reserved.
//

#import "Model.h"
#import "TFHppleElement.h"
#import "TFHpple.h"

@implementation Model

-(void)createModel {
    
    Model * m = [[Model alloc] init];
    
    NSString * file = [[NSBundle mainBundle] pathForResource:@"显示分辨率列表" ofType:@"htm"];
    NSData * data = [NSData dataWithContentsOfFile:file];
    TFHpple * doc = [[TFHpple alloc] initWithHTMLData:data];
    //132 3个
        NSMutableArray * elements = [[NSMutableArray alloc]initWithCapacity:0];
        [elements addObjectsFromArray:[doc searchWithXPathQuery:@"//table/tr/td"]];
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray * array1 = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray * array2 = [NSMutableArray arrayWithCapacity:0];

    
    for (int i=0; i<=131; i++) {
        TFHppleElement * he = elements[i];
        
        if (i%3 == 1) {
            NSString * str = [he text];
            NSArray * arr1 = [str componentsSeparatedByString:@"x"];
            NSString * str1 = arr1[0];
            NSArray * arr = [str1 componentsSeparatedByString:@"×"];
//            m.width = arr[0];
//            m.height = arr[1];
            [array addObject:arr[0]];
            [array1 addObject:arr[1]];
        }
        if (i%3 == 2) {
//            m.scale = [he text];
            [array2 addObject:[he text]];
        }
        
    }
    NSUserDefaults * ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:array forKey:@"width"];
    [ud setObject:array1 forKey:@"height"];
    [ud setObject:array2 forKey:@"scale"];
    [ud synchronize];
    [m.width addObjectsFromArray:array];
    [m.height addObjectsFromArray:array1];
    [m.scale addObjectsFromArray:array2];
//    return m;
}

+ (BOOL)isValidatePassword:(NSString *)passWord {
    
    NSString *passWordRegex = @"^[0-9]＋(\\.[0-9]{1,2})?$";
    
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    
    return [passWordPredicate evaluateWithObject:passWord];
}

@end
