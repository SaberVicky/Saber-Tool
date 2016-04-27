//
//  SLNewsCell.h
//  Saber Tool
//
//  Created by songlong on 16/4/26.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SLNews;

@interface SLNewsCell : UITableViewCell

- (void)setupUIWithModel:(SLNews *)news;

@end
