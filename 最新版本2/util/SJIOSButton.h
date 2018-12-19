

#import <UIKit/UIKit.h>

@interface SJIOSButton : UIButton

@property(nonatomic, readwrite) UIColor *buttonColor;
@property(nonatomic, readwrite) UIColor *shadowColor;
@property(nonatomic, readwrite) UIColor *highColor;
@property(nonatomic, readwrite) CGFloat shadowHeight;
@property(nonatomic, readwrite) CGFloat cornerRadius;

@end
