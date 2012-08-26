//
//  SRMotorcycle.h
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/19/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRMotorcycle : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, assign) int engine;
@property (nonatomic, copy) NSString *transmission;
@property (nonatomic, copy) NSString *drive;
@property (nonatomic, assign) float fuelCapacity;
@property (nonatomic, assign) int mpg;
@property (nonatomic, assign) int weight;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) UIImage *thumbnail;
@property (nonatomic, copy) NSString *link;

- (id)initWithName:(NSString *)name dictionary:(NSDictionary *)dictionary;

@end
