//
//  XWAppMacro.h
//  XWApp
//
//  Created by 李飞恒 on 16/10/30.
//  Copyright © 2016年 李飞恒. All rights reserved.
//

#define LocalizedString(key) \
[[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

#define EON_BEGIN_THREAD_PREPARE_MAIN(lockObject) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),^{ \
@synchronized(lockObject){dispatch_async(dispatch_get_main_queue(),^{if(YES)
#define EON_THREAD_PROCESS });if (YES)
#define EON_FINALLY_MAIN dispatch_async(dispatch_get_main_queue(),^{if(YES)
#define EON_END_THREAD });}});

// color setting
#define RGB_MainColor             RGB(255, 0, 33)        // 主色 #FF0021
#define RGB_NavigationBarForiOS   RGB(247, 247, 247)     // iOS标准导航底色
#define RGB_Line                  RGB(222, 222, 222)     // 线条色(所有线条高度设0.5)
#define RGB_SectionInterval       RGB(242, 242, 242)     // 表视图分隔间距色
#define RGB_TableView             RGB(242, 242, 242)     // 表视图背景色

//
#define LineHeight     0.5
#define TabbarWidth    80

#if TARGET_IPHONE_SIMULATOR
#define TARGET_IPHONE_VIDYO 0

#else
#define TARGET_IPHONE_VIDYO 1

#endif

