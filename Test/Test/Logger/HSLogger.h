//
//  HSLogger.h
//
//  Created by Hermoso Cariaga on 02/21/14.
//  Copyright 2014 Hercsoft. All rights reserved.
//

#ifdef HSLOG_ENABLED
#	define HSLog(fmt, ...) [HSLogger logWithLoggingLevel:1 log:[NSString stringWithFormat:(@"%s[L:%d]\n" fmt @"\n-"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__]];
#	define HSLogWarning(fmt, ...) [HSLogger logWithLoggingLevel:2 log:[NSString stringWithFormat:(@"%s[L:%d]\n" fmt @"\n-"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__]];
#	define HSLogError(fmt, ...) [HSLogger logWithLoggingLevel:3 log:[NSString stringWithFormat:(@"%s[L:%d]\n" fmt @"\n-"), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__]];
#else
#	define HSLog(...)
#	define HSLogWarning(...)
#	define HSLogError(...)
#endif

@interface HSLogger : NSObject
{}

+ (void)logWithLoggingLevel:(int)level log:(NSString *)str;
//+ (void)broadcastLog:(NSString *)host withPort:(int)port withData:(NSData *)data;
+ (NSString *)dataFilePath:(BOOL)forSave withFile:(NSString *)file;
@end