//
//  NewsModel.h
//  CBTableViewSecret
//
//  Created by 陈波 on 2019/1/5.
//  Copyright © 2019 陈波. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface Ext_action :NSObject<YYModel>
@property (nonatomic , copy) NSString              * Fimgurl32;
@property (nonatomic , copy) NSString              * Fimgurl30;
@property (nonatomic , copy) NSString              * Fimgurl33;

@end

@interface Ext_data :NSObject<YYModel>
@property (nonatomic , copy) NSString              * src;
@property (nonatomic , copy) NSString              * desc;
@property (nonatomic , strong) Ext_action              * ext_action;

@end

@interface Newslist :NSObject<YYModel>
@property (nonatomic , strong) Ext_data              * ext_data;
@property (nonatomic , copy) NSString              * source;
@property (nonatomic , copy) NSString              * time;
@property (nonatomic , copy) NSString              * title;
@property (nonatomic , copy) NSString              * url;
@property (nonatomic , copy) NSString              * videoTotalTime;
@property (nonatomic , copy) NSArray<NSString *>              * thumbnails_qqnews;
@property (nonatomic , copy) NSString              * abstract;
@property (nonatomic , assign) NSInteger              imagecount;
@property (nonatomic , copy) NSString              * origUrl;
@property (nonatomic , copy) NSString              * graphicLiveID;
@property (nonatomic , copy) NSString              * uinnick;
@property (nonatomic , copy) NSString              * flag;
@property (nonatomic , copy) NSArray<NSString *>              * tag;
@property (nonatomic , copy) NSString              * voteId;
@property (nonatomic , copy) NSString              * articletype;
@property (nonatomic , copy) NSString              * voteNum;
@property (nonatomic , copy) NSString              * qishu;
@property (nonatomic , copy) NSString              * id;
@property (nonatomic , assign) NSInteger              timestamp;
@property (nonatomic , copy) NSString              * commentid;
@property (nonatomic , assign) NSInteger              comments;
@property (nonatomic , copy) NSString              * weiboid;
@property (nonatomic , copy) NSString              * comment;
@property (nonatomic , copy) NSString              * uinname;
@property (nonatomic , copy) NSString              * surl;
@property (nonatomic , copy) NSArray<NSString *>              * thumbnails;

@end

@interface NewsModel :NSObject<YYModel>
@property (nonatomic , assign) NSInteger              ret;
@property (nonatomic , copy) NSArray<Newslist *>              * newslist;

@end
