//
//  runloopQuestion.m
//  Questions
//
//  Created by wyz on 16/6/22.
//  Copyright © 2016年 com.pencho.com. All rights reserved.
//

//http://my.oschina.net/u/816791/blog/387568
//http://blog.csdn.net/ios_che/article/details/8252800

/*
 
NSRunloop就是类似于windows的消息机制。他的存在是给线程增加事件处理机制。
对于多线程开发而言，有两种处理方案，一种是不需要太多的交互，直接运算比较大的数据内容就可以，另一种方法是将执行函数加入到消息循环当中去，等待事件的发生，然后执行。
 
 有了NSRunloop，会使线程的表现变得更加的好，他的存在一个重要目的是当有事件发生时，唤醒线程，当没有事件时，线程将处于休眠状态，这样的多线程运行，用户表现会非常的好。因为，线程其实也是有开销的。
 
 
 对于NSRunloop来说，他的输入原，有事件输入原和定时器，事件输入原是异步通信的方式，而定时器是同步的输入方式。对于事件输入原，其实并不是用户直接定义的，而是通过一些特定的port对象机器方法共同实现的。
 
 
 Run loops 是线程相关的的基础框架的一部分。一个 run loop 就是一个事件处理 的循环,用来不停的调度工作以及处理输入事件。使用 run loop 的目的是让你的线 程在有工作的时候忙于工作,而没工作的时候处于休眠状态。
 
 Run loops 是线程相关的的基础框架的一部分。一个 run loop 就是一个事件处理 的循环,用来不停的调度工作以及处理输入事件。使用 run loop 的目的是让你的线 程在有工作的时候忙于工作,而没工作的时候处于休眠状态。
 
 仅当在为你的程序创建辅助线程的时候,你才需要显式运行一个 run loop。Run loop 是程序主线程基础设施的关键部分。所以,Cocoa 和 Carbon 程序提供了代码运 行主程序的循环并自动启动 run loop。IOS 程序中 UIApplication 的 run 方法(或 Mac OS X 中的 NSApplication)作为程序启动步骤的一部分,它在程序正常启动的时 候就会启动程序的主循环。类似的,RunApplicationEventLoop 函数为 Carbon 程序 启动主循环。如果你使用 xcode 提供的模板创建你的程序,那你永远不需要自己去显 式的调用这些例程。
 
 对于辅助线程,你需要判断一个 run loop 是否是必须的。如果是必须的,那么 你要自己配置并启动它。你不需要在任何情况下都去启动一个线程的 run loop。比 如,你使用线程来处理一个预先定义的长时间运行的任务时,你应该避免启动 run loop。Run loop 在你要和线程有更多的交互时才需要,比如以下情况:

 */




#import "runloopQuestion.h"

@implementation runloopQuestion

@end
