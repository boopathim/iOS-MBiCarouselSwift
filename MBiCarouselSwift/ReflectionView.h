

/*
 
 Developer Name : MaxymusBoopathy
 
 iOS Developer
 
 email: www.mboopathi@gmail.com
 iCloud: maxymusboopathy@iCloud.com
 
 Phone: +91 9952671049/ +91 8861277070
 
 Work: Bangalore
 
 Home: Tamilnadu - Salem - Rasipuram - Namagiripettai
 
 */
//
//  iCarousel.swift
//  MBiCarouselSwift

// MB- MaxymusBoopathy

//  MBiCarouselSwift
//
//  Created by boopathi on 12/06/15.
//  Copyright (c) 2015 MaxymusBoopathy. All rights reserved.
//


#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface ReflectionView : UIView

@property (nonatomic, assign) CGFloat reflectionGap;
@property (nonatomic, assign) CGFloat reflectionScale;
@property (nonatomic, assign) CGFloat reflectionAlpha;
@property (nonatomic, assign) BOOL dynamic;

- (void)update;

@end


#pragma GCC diagnostic pop
