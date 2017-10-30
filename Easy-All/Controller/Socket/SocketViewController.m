//
//  SocketViewController.m
//  Easy-All
//
//  Created by chensa on 2017/10/29.
//  Copyright © 2017年 chensa. All rights reserved.
//

#import "SocketViewController.h"
#import <sys/socket.h> //socket相关
#import <netinet/in.h>  //internet相关
#import <arpa/inet.h>   //地址解析协议相关

@interface SocketViewController ()
@property (nonatomic, assign) int clientSocket;

@end

@implementation SocketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    int socket = socket(192.168.33.11, SOCK_STREAM, 0);
    self.clientSocket = socket(AF_INET, SOCK_STREAM, 0);
    
    struct sockaddr_in serverAddress;
    // IPV4 - 协议
    serverAddress.sin_family = AF_INET;
    // inet_addr函数可以把ip地址转换成一个整数
    serverAddress.sin_addr.s_addr = inet_addr(@"192.168.33.11".UTF8String);
    // 端口小端存储
    serverAddress.sin_port = htons(9999);
    
    int result = connect(self.clientSocket, (const struct sockaddr *)&serverAddress, sizeof(serverAddress));
    
    // 如果连接成功返回 YES
//    return (result == 0);
    
//    [self connection:@"192.168.33.11" port:9999];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)sendAndRecv:(NSString *)message {
    // send发送
    /**
     参数
     1> 客户端socket
     2> 发送内容地址 void * == id
     3> 发送内容长度
     4> 发送方式标志，一般为0
     返回值
     如果成功，则返回发送的字节数，失败则返回SOCKET_ERROR
     */
    
    ssize_t sendLen = send(self.clientSocket, message.UTF8String, strlen(message.UTF8String), 0);
    NSLog(@"%ld", sendLen);
    
    // recv 接收 - 几乎所有的网络访问，都是有来有往的
    /**
     参数
     第一个int :创建的socket
     void *：接收内容的地址
     size_t：接收内容的长度
     第二个int.：接收数据的标记 0，就是阻塞式，一直等待服务器的数据
     返回值 接收到的数据长度
     */
    // unsigned char，字符串的数组
    uint8_t buffer[1024];
    
    ssize_t recvLen = recv(self.clientSocket, buffer, sizeof(buffer), 0);
    
    // 从buffer中读取服务器发回的数据
    // 按照服务器返回的长度，从 buffer 中，读取二进制数据，建立 NSData 对象
    NSData *data = [NSData dataWithBytes:buffer length:recvLen];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}

///  断开连接
- (void)disConnection {
    close(self.clientSocket);
}

@end
