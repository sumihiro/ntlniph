#import <UIKit/UIKit.h>

@interface NTLNConfiguration : NSObject {
	BOOL useSafari;
	BOOL darkColorTheme;
	BOOL autoScroll;
    int refreshIntervalSeconds;
	BOOL showMoreTweetMode;
	int fetchCount;
	BOOL shakeToFullscreen;
	BOOL lefthand;
	BOOL useInsomnia;
}

@property (readonly) BOOL useSafari;
@property (readonly) BOOL darkColorTheme;
@property (readonly) BOOL autoScroll;
@property (readonly) BOOL showMoreTweetMode;
@property (readonly) BOOL shakeToFullscreen;
@property (readonly) BOOL lefthand;
@property (readonly) BOOL useInsomnia;

+ (id) instance;
- (void)reload;

- (int)refreshIntervalSeconds;
- (int)fetchCount;

@end
