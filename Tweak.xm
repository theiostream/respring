#include <unistd.h>
#include <notify.h>

@interface UIApplication (SpringBoard)
- (void)languageChanged;
@end

%subclass RespringIcon : SBApplicationIcon
- (void)launch {
	if (getuid() == 0) { seteuid(501); }
	system("/usr/bin/uicache");
	seteuid(0);
	
	if ([[[UIDevice currentDevice] systemVersion] hasPrefix:@"2."])
		notify_post("com.apple.language.changed");
	
	else if ([[UIApplication sharedApplication] respondsToSelector:@selector(languageChanged)])
		[[UIApplication sharedApplication] languageChanged];
	
	else
		system("killall -9 SpringBoard");
}
%end