//
//  SLNoteCell.h
//  Saber Tool
//
//  Created by songlong on 16/4/30.
//  Copyright © 2016年 songlong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SLNote;

@interface SLNoteCell : UITableViewCell

- (void)setupUIWithModel:(SLNote *)note;

@end
