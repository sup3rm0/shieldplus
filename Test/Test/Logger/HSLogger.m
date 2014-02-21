//
//  HSLogger.m
//
//  Created by Hermoso Cariaga on 02/21/14.
//  Copyright 2014 Hercsoft. All rights reserved.
//

#import "HSLogger.h"
//#import "AsyncUdpSocket.h"

@implementation HSLogger

+ (void)logWithLoggingLevel:(int)level log:(NSString *)str
{
    
    NSLog(@"Logging Level: %i", level);
    
	NSString *plistPath = [HSLogger dataFilePath:NO withFile:@"HSLogger"];
	NSDictionary *plist = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
	
	if ([plist count] < 1)
	{
		return;
	}
	
	BOOL logOnConsole = [[plist objectForKey:@"logOnConsole"] boolValue];
	if (logOnConsole) 
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
