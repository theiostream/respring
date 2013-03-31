#include <notify.h>

@interface UIApplication (SpringBoard)
- (void)languageChanged;
@end

%subclass RespringIcon : SBApplicationIcon
- (void)launch {
	system("/usr/bin/uicache");
	
	if ([[[UIDevice currentDevice] systemVersion] hasPrefix:@"2."])
		notify_post("com.apple.language.changed");
	
	else if ([[UIApplication sharedApplication] respondsToSelector:@selector(languageChanged)])
		[[UIApplication sharedApplication] languageChanged];
	
	else
		system("killall backboardd");
}
%end