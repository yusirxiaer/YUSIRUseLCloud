//
//  LeanCloudPost.h
//  LeanCloud_Try
//
//  Created by JkWpq on 16/3/28.
//  Copyright © 2016年 JkWpq. All rights reserved.
//

#import "AVObject.h"
#import <AVOSCloud/AVOSCloud.h>
#import <MapKit/MapKit.h>
@interface LeanCloudPost : AVObject<AVSubclassing,MKAnnotation>

@property(nonatomic,copy) NSString *text;
@property(nonatomic,retain) AVGeoPoint *geo;
@property(nonatomic,retain) AVRelation *watchUsers;


@end
