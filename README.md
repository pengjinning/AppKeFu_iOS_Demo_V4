# 微客服
iOS客服demo 4.x 版本 - 致力于为开发者提供极致用户体验的SDK

其他：
安卓版：https://github.com/pengjinning/AppKeFu_Android_Demo_V4

## 三种集成方式

### 1.CocoaPods, 最新版本 4.9.0

* pod 'AppKeFu'

### 2.集成framework

* 具体可以参见Demo和开发文档

### 3.集成.a静态库

* 具体可以参见Demo和开发文档

## 预览

<img src="/images/chat_list.png" alt="功能一览" width="260px" />
<img src="/images/chat_buy.png" alt="电商" width="260px" />
<img src="/images/chat_face.png" alt="扩展" width="260px" />
<img src="/images/chat_voice.png" alt="语音" width="260px" />
<img src="/images/chat_robot.png" alt="智能问答" width="260px" />
<img src="/images/chat_rate.png" alt="满意度" width="260px" />
<img src="/images/chat_faq.png" alt="常见问题" width="260px" />
<img src="/images/chat_tag.png" alt="个人标签" width="260px" />


## 开发文档

http://admin.appkefu.com/AppKeFu/doc/ios.html


## 更新日志

#### 2017-10-01: version 4.9.2
* 启用新域名weikefu.net

#### 2017-06-15: version 4.8.0
* 优化界面UI

#### 2017-04-23: version 4.5.0
* 增加可选隐藏 FAQ和满意度 参数

#### 2017-04-15: version 4.4.9
* 优化国际化处理

#### 2017-04-09: version 4.4.5
* 优化页面打开速度

#### 2017-03-13: version 4.4.4
* 优化framework表情

#### 2017-03-08: version 4.4.1
* 优化图片加载

#### 2017-02-09: version 4.3.2
* 增加支持framework集成方式
* 其他优化

#### 2017-01-06: version 4.3.1
* 优化支持https

#### 2017-01-04: version 4.3.0
* 增加支持https

#### 2016-09-26: version 4.2.0
* 增加Ip Server登录模式， 解决部分移动运营商域名解析问题
* 优化用户体验

#### 2016-09-14: version 4.1.6
* 兼容 Xcode 8
* 兼容 iOS 10 && swift 3.0

#### 2016-09-14: version 4.1.5
* 优化用户体验
* 支持接收播放PC客服端语音


 
## 接口一览

```objective-c

//1. 获取AppKeFuLib单例
+(AppKeFuLib *)sharedInstance;

//查看sdk版本
-(NSString *)version;

//2.登录, appkey需要开发者到 http://appkefu.com 申请
-(void)loginWithAppkey:(NSString *)appkey;

//2.1第二种登录方式. 开发者可自定义username，其中：username长度>=6, 用户名不能包含汉字，只能为: 数字、字母和下划线_ 的组合
-(void)loginWithUsername:(NSString *)username withAppkey:(NSString *)appkey;

//3. 注销，退出登录
-(void)logout;

//
-(void)pushKFCenterViewController:(UINavigationController *)navigationController
                withWorkgroupName:(NSString *)workgroupName
         hidesBottomBarWhenPushed:(BOOL)shouldHide;

-(void)presentKFCenterViewController:(UIViewController *)navController
                   withWorkgroupName:(NSString *)workgroupName
            hidesBottomBarWhenPushed:(BOOL)shouldHide;

//4. 显示会话窗口
- (void)pushChatViewController:(UINavigationController *)navController
            withWorkgroupName:(NSString *)workgroupName                        //1. 需要填写 工作组名称，需要到管理后台申请，
//   注意：不是客服用户名，而是工作组名称，支持多客服
        hideRightBarButtonItem:(BOOL)hideRightBarButtonItem                     //2. 隐藏会话页面右上角按钮, 隐藏: YES, 显示: NO
    rightBarButtonItemCallback:(void (^)())rightBarButtonTouchUpInsideCallback  //3. 会话页面右上角按钮回调函数；注意:VIP接口，需要另行开通
        showInputBarSwitchMenu:(BOOL)shouldShowInputBarSwitchMenu               //4. 在会话窗口显示自定义菜单, 类似于微信的自定义菜单；
//      如果需要显示自定义菜单,请首先到管理后台分配自定义菜单,请分配且只分配三个自定义菜单,多于三个的自定义菜单将不予显示。
//      显示: YES, 不显示: NO
        withLeftBarButtonItem:(UIButton *)leftBarButtonItem
                withTitleView:(UILabel *)titleView                             //5. 自定义会话窗户标题
       withRightBarButtonItem:(UIButton *)rightBarButtonItem                   //6. 自定义会话窗口右上角按钮,
//      如果需要保留默认, 请设置为nill
             withProductInfo:(NSString *)productInfo                          //7. 成功连接客服之后,自动将此消息发送给客服,
//   如果不需要发送此信息, 可将其设置为 nil 或者 ""
    withLeftBarButtonItemColor:(UIColor *)color                                 //8. 导航左上角“结束会话”按钮颜色
    hidesBottomBarWhenPushed:(BOOL)shouldHide                                 //9. 从具有Tabbar的viewController打开的时候,隐藏tabbar
          showHistoryMessage:(BOOL)isShow                                     //10. 是否显示历史聊天记录，显示:YES, 不显示:NO
                defaultRobot:(BOOL)defaultRobot                               //11. 默认机器人自动应答, 亦可呼叫人工客服,
//   开启机器人: YES, 人工客服: NO
                    mustRate:(BOOL)mustRate                                   //12.在关闭会话的时候是否强制用户评价，强制：YES, 不评价：NO
//   注意：如果要强制用户在关闭会话的时候评价，需要首先设置参数：
//      withLeftBarButtonItem，否则此参数不会生效
        withKefuAvatarImage:(UIImage *)kefuAvatarImage                       //13. 替换默认客服头像, 设为nil则保留默认头像
        withUserAvatarImage:(UIImage *)userAvatarImage                       //14. 替换默认用户头像, 设为nil则保留默认头像
             hideRateButton:(BOOL)hideRateButton                             //15. false：显示满意度评价按钮，true: 隐藏满意度评价按钮
              hideFAQButton:(BOOL)hideFAQButton                              //16. false: 显示FAQ按钮，true: 隐藏FAQ按钮

        shouldShowGoodsInfo:(BOOL)showGoodsInfo                              //17.是否显示商品信息,
//      取值：true,显示商品信息; false,不显示商品信息
      withGoodsImageViewURL:(NSString *)goodsImageViewURL                    //18.商品信息图片URL链接地址
       withGoodsTitleDetail:(NSString *)goodsTitleDetail                     //19.商品信息简介
             withGoodsPrice:(NSString *)goodsPrice                           //20.商品价格
               withGoodsURL:(NSString *)goodsURL                             //21.商品链接，点击“发送链接”按钮发送给客服
        withGoodsCallbackID:(NSString *)goodsCallbackID                      //22.点击商品区域回调参数
    goodsInfoClickedCallback:(void (^)(NSString *goodsCallbackId))goodsInfoClickedCallback //23.点击商品区域回调接口

httpLinkURLClickedCallBack:(void (^)(NSString *url))httpLinkURLClickedCallback //24.点击URL的回调函数，如果不想使用回调,请设置为nil
faqButtonTouchUpInsideCallback:(void (^)())faqButtonTouchUpInsideCallback;      //25.自定义FAQ常见问题button回调，可在此打开自己的常见问题FAQ页面


//4.1
-(void)presentChatViewController:(UIViewController *)navController
               withWorkgroupName:(NSString *)workgroupName
          hideRightBarButtonItem:(BOOL)hideRightBarButtonItem
      rightBarButtonItemCallback:(void (^)())rightBarButtonTouchUpInsideCallback
          showInputBarSwitchMenu:(BOOL)shouldShowInputBarSwitchMenu
           withLeftBarButtonItem:(UIButton *)leftBarButtonItem
                   withTitleView:(UILabel *)titleView
          withRightBarButtonItem:(UIButton *)rightBarButtonItem
                 withProductInfo:(NSString *)productInfo
      withLeftBarButtonItemColor:(UIColor *)color
        hidesBottomBarWhenPushed:(BOOL)shouldHide
              showHistoryMessage:(BOOL)isShow
                    defaultRobot:(BOOL)defaultRobot
                        mustRate:(BOOL)mustRate
             withKefuAvatarImage:(UIImage *)kefuAvatarImage
             withUserAvatarImage:(UIImage *)userAvatarImage

             shouldShowGoodsInfo:(BOOL)showGoodsInfo
           withGoodsImageViewURL:(NSString *)goodsImageViewURL
            withGoodsTitleDetail:(NSString *)goodsTitleDetail
                  withGoodsPrice:(NSString *)goodsPrice
                    withGoodsURL:(NSString *)goodsURL
             withGoodsCallbackID:(NSString *)goodsCallbackID
        goodsInfoClickedCallback:(void (^)(NSString *goodsCallbackId))goodsInfoClickedCallback

      httpLinkURLClickedCallBack:(void (^)(NSString *url))httpLinkURLClickedCallback
  faqButtonTouchUpInsideCallback:(void (^)())faqButtonTouchUpInsideCallback;


//查看常见问题FAQ：push
-(void)pushFAQViewController:(UINavigationController *)navigationController
           withWorkgroupName:(NSString *)workgroupName
    hidesBottomBarWhenPushed:(BOOL)shouldHide;

//查看常见问题FAQ: present
-(void)presentFAQViewController:(UIViewController *)navController
              withWorkgroupName:(NSString *)workgroupName
       hidesBottomBarWhenPushed:(BOOL)shouldHide;


//获取消息记录，每次获取5条, offset为起始参数，如果要返回最近的，请将offset设置为0，则返回的是最新的5条聊天记录
///返回对象为 KFMessageItem 的数组
- (NSMutableArray *)getMessagesWith:(NSString *)workgroupname fromOffset:(NSInteger)offset;


//发送消息，会话页面聊天记录可见
-(void) sendTextMessage:(NSString *)content toWorkgroupname:(NSString *)workgroupName;


//发送消息，但不会显示在会话页面聊天记录里面
-(void) sendBackgroundMessage:(NSString *)content toWorkgroupname:(NSString *)workgroupName;


//5.查询工作组当前在线状态，如果工作组内客服至少有一个客服账号在线，则显示在线。否则，显示离线
-(void) queryWorkgroupOnlineStatus:(NSString *)workgroupname;

//5.1 清空与workgroupName的所有聊天信息
- (void) deleteMessagesWith:(NSString*)workgroupName;

#pragma mark 用户标签

//函数6：设置用户标签昵称
- (NSString *)getTagNickname;

//函数7：获取用户标签昵称
- (void) setTagNickname:(NSString *)nickname;

//函数8：设置用户标签性别
- (NSString *)getTagSex;

//函数9：获取用户标签性别
- (void) setTagSex:(NSString *)sex;

//函数10：设置用户标签语言
- (NSString *)getTagLanguage;

//函数11：获取用户标签语言
- (void) setTagLanguage:(NSString *)language;

//函数12：设置用户标签城市
- (NSString *)getTagCity;

//函数13：获取用户标签城市
- (void) setTagCity:(NSString *)city;

//函数14：设置用户标签省份
- (NSString *)getTagProvince;

//函数15：获取用户标签省份
- (void) setTagProvince:(NSString *)province;

//函数16：设置用户标签国家
- (NSString *)getTagCountry;

//函数17：设置用户标签国家
- (void) setTagCountry:(NSString *)country;

//函数18：设置用户标签其他
- (NSString *)getTagOther;

//函数19：获取用户标签其他
- (void) setTagOther:(NSString *)other;

//函数20：上传DeviceToken，用于离线消息推送
- (void) uploadDeviceToken:(NSData *)deviceToken;

//函数21: 设置发送消息时是否播放提示音
-(BOOL) shouldRingWhenSendMessage;
-(void) setRingWhenSendMessage:(BOOL)flag;

//函数22: 设置接收到消息时是否播放提示音
-(BOOL) shouldRingWhenReceiveMessage;
-(void) setRingWhenReceiveMessage:(BOOL)flag;

//函数23: 设置接收到消息时是否震动
-(BOOL) shouldVibrateWhenReceiveMessage;
-(void) setVibrateWhenReceiveMessage:(BOOL)flag;

//获取当前缓存文件大小
- (NSString *) getCacheFileSize;
//清空缓存文件
- (void) clearAllFileCache;
//获取未读消息数量
-(NSUInteger) getUnreadMessageCount:(NSString *)workgroupname;

//
//发送工作组文字消息
-(void) sendTextMessage:(NSString*)content toKefuname:(NSString *)workgroupName;
//发送一对一文字消息
-(void) sendTextMessage:(NSString *)content toUsername:(NSString *)username;
//发送工作组图片消息
-(void) sendImageMessage:(NSData*)imageData
               imageName:(NSString*)imagename //对方接收到的图片名称，非本地文件名，可自行定义
              toKefuname:(NSString*)workgroupName;
//发送一对一图片消息
-(void) sendImageMessage:(NSData*)imageData   //imageData = UIImageJPEGRepresentation(image, 0),
//其中UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
               imageName:(NSString*)imagename //对方接收到的图片名称，非本地文件名，可自行定义
              toUsername:(NSString*)username;
//发送一对一语音文件，其中soundFileName 为录音文件本地路径
-(void)sendVoiceMessage:(NSString *)soundFileName  userName:(NSString *)username;

/////////////////////////////////////
//获取当前服务器地址
-(NSString *)getHost;
//是否启用ip服务器地址
-(void)enableIPServerMode:(BOOL)enableIPFlag;


```






















