//
//  HSLogger.m
//
//  Created by Hermoso Cariaga on 02/21/14.
//  Copyright 2014 Hercsoft. All rights reserved.
//

#import "HSLogger.h"
//#import "AsyncUdpSocket.h"

@implementation HSLogger

#define LOGGING_LEVEL_DEBUG                 1
#define LOGGING_LEVEL_WARNING               2
#define LOGGING_LEVEL_ERROR                 3
#define LOGGING_LEVEL_DEBUG_WARNING         4
#define LOGGING_LEVEL_WARNING_ERROR         5
#define LOGGING_LEVEL_DEBUG_ERROR           6
#define LOGGING_LEVEL_DEBUG_WARNING_ERROR   7

+ (void)logWithLoggingLevel:(int)level log:(NSString *)str
{
	NSString *plistPath = [HSLogger dataFilePath:NO withFile:@"HSLogger"];
	NSDictionary *plist = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
	
	if ([plist count] < 1)
	{
		return;
	}
	
    int loggingLevel = [[plist objectForKey:@"loggingLevel"] integerValue];
    if (loggingLevel > 0 && loggingLevel <8)
    {
        BOOL logOnConsole = [[plist objectForKey:@"logOnConsole"] boolValue];
        if (logOnConsole)
        {
            BOOL log = NO;
            
            switch (loggingLevel)
            {
                case LOGGING_LEVEL_DEBUG:
                    if (level == 1) log = YES;
                    break;
                case LOGGING_LEVEL_WARNING:
                    if (level == 2) log = YES;
                    break;
                case LOGGING_LEVEL_ERROR:
                    if (level == 3) log = YES;
                    break;
                case LOGGING_LEVEL_DEBUG_WARNING:
                    if (level == 1 || level == 2) log = YES;
                    break;
                case LOGGING_LEVEL_WARNING_ERROR:
                    if (level == 2 || level == 3) log = YES;
                    break;
                case LOGGING_LEVEL_DEBUG_ERROR:
                    if (level == 1 || level == 3) log = YES;
                    break;
                case LOGGING_LEVEL_DEBUG_WARNING_ERROR:
                    if (level == 1 || level == 2 || level == 3) log = YES;
                    break;
                default:
                    break;
            }

            if (log)
            {
                NSLog(@"%@", str);
            }
            
            /*
             BOOL broadcast = [[plist objectForKey:@"broadcastLog"] boolValue];
             if(broadcast)
             {
             NSString *host	= [plist objectForKey:@"host"];
             int port		= [[plist objectForKey:@"port"] intValue];
             [HSLogger broadcastLog:host withPort:port withData:[str dataUsingEncoding:NSUTF8StringEncoding]];
             }
             */
        }        
    }
}

/*
+ (void) broadcastLog:(NSString *)host withPort:(int)port withData:(NSData *)data
{
	AsyncUdpSocket *udpSocket = [[AsyncUdpSocket alloc] init];
	[udpSocket enableBroadcast:YES error:nil];
	[udpSocket sendData:data toHost:host port:port withTimeout:-1 tag:1];
	udpSocket = nil;
}
*/

+ (NSString *)dataFilePath:(BOOL)forSave withFile:(NSString *)file
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *documentsPath = [documentsDirectory stringByAppendingPathComponent:[file stringByAppendingString:@".plist"]];
	
    if (forSave || [[NSFileManager defaultManager] fileExistsAtPath:documentsPath]) {
		return documentsPath;
    } else {
		return [[NSBundle mainBundle] pathForResource:[file stringByAppendingString:@".plist"] ofType:nil];
    }
}

@end
