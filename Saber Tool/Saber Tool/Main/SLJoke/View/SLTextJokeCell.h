//
//  SLTextJokeCell.h
//  Saber Tool
//
//  Created by songlong on 16/4/29.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SLJoke;

@interface SLTextJokeCell : UITableViewCell

- (void)setupUIWithModel:(SLJoke *)joke;

@end
