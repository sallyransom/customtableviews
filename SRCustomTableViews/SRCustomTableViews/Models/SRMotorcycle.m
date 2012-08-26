//
//  SRMotorcycle.m
//  SRCustomTableViews
//
//  Created by sailon ransom on 8/19/12.
//  Copyright (c) 2012 sailon ransom. All rights reserved.
//

#import "SRMotorcycle.h"

@implementation SRMotorcycle

- (id)initWithName:(NSString *)name dictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.name = name;
        self.info = [dictionary objectForKey:@"info"];
        self.engine = [[dictionary objectForKey:@"engine"] intValue];
        self.transmission = [dictionary objectForKey:@"transmission"];
        self.drive = [dictionary objectForKey:@"drive"];
        self.fuelCapacity = [[dictionary objectForKey:@"fuel capacity"] floatValue];
        self.mpg = [[dictionary objectForKey:@"mpg"] intValue];
        self.weight = [[dictionary objectForKey:@"weight"] intValue];
        self.image = [UIImage imageNamed:[dictionary objectForKey:@"image"]];
        self.thumbnail = [self thumbnailFromDictionary:dictionary];
        self.link = [dictionary objectForKey:@"link"];
    }
    return self;
}

- (UIImage *)thumbnailFromDictionary:(NSDictionary *)dictionary {
    NSString *imageName = [dictionary objectForKey:@"image"];
    NSArray *components = [imageName componentsSeparatedByString:@"."];
    NSString *thumbnailName = [NSString stringWithFormat:@"%@_thumb.%@", [components objectAtIndex:0], [components objectAtIndex:1]];
    
    return [UIImage imageNamed:thumbnailName];
}

@end
