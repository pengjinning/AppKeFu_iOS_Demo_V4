//
//  AppKeFuLib7.h
//  AppKeFuLib7
//
//  Created by jack on 15/9/21.
//  Copyright © 2015年 appkefu.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/*
 //消息类型：文本（已经文本内点击button:用于FAQ，支持电话号码、超链接）、
 //          表情、
 //          图片、
 //          语音(仅支持接收，暂时不支持发送)，
 //          文章（类似微信订阅号文章，点击打开内嵌浏览器页面）
 */
typedef enum {
    KFMessageTypeText = 0,              //文本消息
    KFMessageTypeImageHTTPURL,          //图片消息
    KFMessageTypeSoundHTTPURL,          //语音消息
    KFMessageTypeArticle,               //文章消息
    KFMessageTypeRobot,                 //机器人消息
    KFMessageTypeGoodsInfo,             //商品信息
    
    KFMessageTypeComposingText,         //文字输入提示
    KFMessageTypeRecordingVoice,        //语音录制提示
    KFMessageTypeSendingImage,          //图片发送中提示
    KFMessageTypeSendingVoice           //语音发送中提示
    
} KFMessageType;

/*
 */
@interface KFMessageItem : NSObject

/*公共部分*/
@property (nonatomic, strong) NSString      *username;              //对方用户名
@property (nonatomic, strong) NSDate        *timestamp;             //消息时间戳
@property (nonatomic, assign) BOOL          isTimestampVisible;     //时间戳是否可见
@property (nonatomic, strong) NSString      *messageContent;        //消息内容
@property (nonatomic, assign) BOOL          isSendFromMe;           //消息是否自己发送
@property (nonatomic, assign) KFMessageType messageType;            //消息类型
@property (nonatomic, strong) NSString      *workgroupName;         //工作组名称
@property (nonatomic, strong) NSString      *sessionId;             //会话id
@property (nonatomic, strong) NSString      *msgId;                 //消息id
@property (nonatomic, assign) NSInteger     sendStatus;             //发送状态：1：发送中；2：发送成功；3：发送失败

/*图片消息相关*/
@property (nonatomic, strong) NSString      *imageFileName;          //图片文件名
@property (nonatomic, assign) NSString      *imageSendingPercentage; //图片发送进度
@property (nonatomic, strong) UIImage       *imageTobeSend;          //将要被发送的图片

/*语音消息相关*/
@property (nonatomic, strong) NSString      *voiceFileName;         //语音文件名
@property (nonatomic, assign) BOOL          isVoiceMessagePlayed;   //语音消息是否已经播放
@property (nonatomic, assign) NSInteger     voiceMessageLength;     //语音消息长度
@property (nonatomic, strong) NSString      *voiceSendingPercentage;//语音发送进度

/*文章消息相关*/
@property (nonatomic, strong) NSString      *articleTitle;          //文章消息标题
@property (nonatomic, strong) NSString      *articleTimestamp;      //文章消息时间
@property (nonatomic, strong) NSString      *articleImageURL;       //文章消息图片URL
@property (nonatomic, strong) NSString      *articleSummary;        //文章消息摘要
@property (nonatomic, strong) NSString      *articleURL;            //文章消息原文链接地址

/*电商商品相关*/
@property (nonatomic, strong) NSString      *goodsImageViewURL;     //商品图片url地址
@property (nonatomic, strong) NSString      *goodsTitleDetail;      //商品简介
@property (nonatomic, strong) NSString      *goodsPrice;            //商品价格
@property (nonatomic, strong) NSString      *goodsURL;              //商品链接，发送链接
@property (nonatomic, strong) NSString      *goodsCallbackID;       //商品回调ID

/*客服信息*/
@property (nonatomic, strong) NSString      *agentname;
@property (nonatomic, strong) NSString      *agentnickname;
@property (nonatomic, strong) NSString      *agentavatar;


@end


/*
 
 */
@interface AppKeFuLib : NSObject


//
+(AppKeFuLib *)sharedInstance;
//
-(NSString *)version;
//
-(void)loginWithAppkey:(NSString *)appkey;
//
-(void)loginWithUsername:(NSString *)username withAppkey:(NSString *)appkey;
//
-(void)loginWithUsername:(NSString *)username withPassword:(NSString *)password withAppkey:(NSString *)appkey;
//
-(void)registerWithUsername:(NSString *)username withPassword:(NSString *)password;
//上传DeviceToken
- (void) uploadDeviceToken:(NSData *)deviceToken;
//
- (void) removeDeviceToken;
//
- (BOOL) isConnected;
//
-(NSString *)getUsername;
//
-(NSString *)getAppkey;
//注销，退出登录
-(void)logout;

/////////////////////////////////////
-(NSString *)getHost;
//
-(void)setHost:(NSString *)host;
//
-(void)enableIPServerMode:(BOOL)enableIPFlag;
//
-(BOOL)isIPServerModeEnabled;
//
-(NSString *)getUploadImageUrl;
//
-(void)setUploadImageUrl:(NSString *)uploadUrl;
//
-(NSString *)getUploadVoiceUrl;
//
-(void)setUploadVoiceUrl:(NSString *)uploadUrl;

//
-(void)pushKFCenterViewController:(UINavigationController *)navigationController
           withWorkgroupName:(NSString *)workgroupName
    hidesBottomBarWhenPushed:(BOOL)shouldHide;

-(void)presentKFCenterViewController:(UIViewController *)navController
              withWorkgroupName:(NSString *)workgroupName
       hidesBottomBarWhenPushed:(BOOL)shouldHide;

//
- (void)pushChatViewController:(UINavigationController *)navController
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
                hideRateButton:(BOOL)hideRateButton
                 hideFAQButton:(BOOL)hideFAQButton

           shouldShowGoodsInfo:(BOOL)showGoodsInfo
         withGoodsImageViewURL:(NSString *)goodsImageViewURL
          withGoodsTitleDetail:(NSString *)goodsTitleDetail
                withGoodsPrice:(NSString *)goodsPrice
                  withGoodsURL:(NSString *)goodsURL
           withGoodsCallbackID:(NSString *)goodsCallbackID
      goodsInfoClickedCallback:(void (^)(NSString *goodsCallbackId))goodsInfoClickedCallback

    httpLinkURLClickedCallBack:(void (^)(NSString *url))httpLinkURLClickedCallback
faqButtonTouchUpInsideCallback:(void (^)())faqButtonTouchUpInsideCallback;

//
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
                  hideRateButton:(BOOL)hideRateButton
                   hideFAQButton:(BOOL)hideFAQButton

             shouldShowGoodsInfo:(BOOL)showGoodsInfo
           withGoodsImageViewURL:(NSString *)goodsImageViewURL
            withGoodsTitleDetail:(NSString *)goodsTitleDetail
                  withGoodsPrice:(NSString *)goodsPrice
                    withGoodsURL:(NSString *)goodsURL
             withGoodsCallbackID:(NSString *)goodsCallbackID
        goodsInfoClickedCallback:(void (^)(NSString *goodsCallbackId))goodsInfoClickedCallback

      httpLinkURLClickedCallBack:(void (^)(NSString *url))httpLinkURLClickedCallback
  faqButtonTouchUpInsideCallback:(void (^)())faqButtonTouchUpInsideCallback;


//
-(void)pushFAQViewController:(UINavigationController *)navigationController
           withWorkgroupName:(NSString *)workgroupName
    hidesBottomBarWhenPushed:(BOOL)shouldHide;

-(void)presentFAQViewController:(UIViewController *)navController
              withWorkgroupName:(NSString *)workgroupName
       hidesBottomBarWhenPushed:(BOOL)shouldHide;


//发送工作组文字消息
-(void) sendTextMessage:(NSString *)content toWorkgroupname:(NSString *)workgroupName withType:(NSString *)type;
-(void) resendTextMessage:(KFMessageItem *)item;

-(void) sendBackgroundMessage:(NSString *)content toWorkgroupname:(NSString *)workgroupName withType:(NSString *)type;
-(void) sendTextMessage:(NSString *)content toUsername:(NSString *)username;

//发送图片
-(void) sendImageMessage:(NSData*)imageData
               imageName:(NSString*)imagename //对方接收到的图片名称，非本地文件名，可自行定义
         toWorkgroupname:(NSString*)workgroupName;
//
-(void) sendImageMessage:(NSData*)imageData
               imageName:(NSString*)imagename //对方接收到的图片名称，非本地文件名，可自行定义
              toUsername:(NSString*)username;
//
-(void) sendVoiceMessage:(NSString *)soundFileName  userName:(NSString *)username;
//
-(void) rateAgent:(NSString *)agentName ratation:(NSString *)rate withInWorkgroup:(NSString *)workgroupName;
//
-(void) rateAgent5:(NSString *)agentName withNickname:(NSString *)nickname withWorkgroupname:(NSString *)workgroupname withRate:(NSString *)rate withComment:(NSString *)comment;
//
-(void) queryWorkgroupOnlineStatus:(NSString *)workgroupname;
//
-(void) queryWorkgroupFAQ:(NSString *)workgroupName;
//
-(void) queryWorkgroupFAQItems:(NSString *)sectionId;
//
-(void) joinChatSession:(NSString *)workgroupName;
//
-(void) leaveChatSession:(NSString *)workgroupName;
//
-(void) closeChatSession:(NSString *)workgroupName;
//
-(void) requestMenu:(NSString *)workgroupName;
//
-(NSString *) persistMessage:(NSString *)content toWorkgroupname:(NSString *)workgroupname withAgentname:(NSString *)agentname withMessageId:(NSString *)_messageId isSend:(BOOL)issend;
//
-(NSString *) persistMessage:(NSString *)content toWorkgroupname:(NSString *)workgroupname withAgentname:(NSString *)agentname
               withSessionId:(NSString *)sessionid withMessageId:(NSString *)_messageId withSendStatus:(int)sendStatus isSend:(BOOL)issend;

//多次获取消息记录，每次获取5条,
- (NSMutableArray *)getMessagesWith:(NSString *)workgroupname fromOffset:(NSInteger)offset;
//
-(NSUInteger) getUnreadMessageCount:(NSString *)workgroupname;
//
-(void) updateMessageAsRead:(NSString *)workgroupname msgId:(NSString *)msgid;
//
-(void) updateAllMessageAsRead:(NSString *)workgroupname;
//
-(void) updateVoiceMessageAsRead:(NSString *)workgroupname timeStamp:(NSDate *)timestamp;
//
-(void) updateMessageAsSendSuccess:(NSString *)workgroupname msgPacketId:(NSString *)msgpacketid;
//
-(void) updateMessageAsSendError:(NSString *)workgroupname msgPacketId:(NSString *)msgpacketid;

//清空与kefuname的所有聊天信息
- (void) deleteMessagesWith:(NSString*)workgroupname;
//删除与kefuname的时间戳为timestamp的聊天信息
- (void) deleteMessageWith:(NSString *)workgroupname timeStamp:(NSDate *)timestamp;
//
- (NSString *) getCacheFileSize;
//
- (void) clearAllFileCache;
//
-(void) robotJoinChat:(NSString *)workgroupName;

-(void) robotQueryAnswer:(NSString *)workgroupName withQuestionId:(NSString *)questionId;

-(void) robotRateAnswer:(NSString *)workgroupName withQuestionId:(NSString *)questionId withRate:(NSString *)rate;

-(void) robotQueryAnswer:(NSString *)workgroupName withMessage:(NSString *)msgContent;

-(void) msgPreKnowBack:(NSString *)workgroupName withAgentjid:(NSString *)agentjid withContent:(NSString *)content;

//
-(void) leaveMessage:(NSString *)workgroupName withMobile:(NSString *)mobile withContent:(NSString *)content withReplytype:(NSString *)replytype;

//
#pragma mark 用户标签
//函数21：设置用户标签昵称
- (NSString *)getTagNickname;

//函数22：获取用户标签昵称
- (void) setTagNickname:(NSString *)nickname;

//函数23：设置用户标签性别
- (NSString *)getTagSex;

//函数24：获取用户标签性别
- (void) setTagSex:(NSString *)sex;

//函数25：设置用户标签语言
- (NSString *)getTagLanguage;

//函数26：获取用户标签语言
- (void) setTagLanguage:(NSString *)language;

//函数27：设置用户标签城市
- (NSString *)getTagCity;

//函数28：获取用户标签城市
- (void) setTagCity:(NSString *)city;

//函数29：设置用户标签省份
- (NSString *)getTagProvince;

//函数30：获取用户标签省份
- (void) setTagProvince:(NSString *)province;

//函数31：设置用户标签国家
- (NSString *)getTagCountry;

//函数32：设置用户标签国家
- (void) setTagCountry:(NSString *)country;

//函数33：设置用户标签其他
- (NSString *)getTagOther;

//函数34：获取用户标签其他
- (void) setTagOther:(NSString *)other;

//函数35: 设置发送消息时是否播放提示音
-(BOOL) shouldRingWhenSendMessage;
-(void) setRingWhenSendMessage:(BOOL)flag;

//函数36: 设置接收到消息时是否播放提示音
-(BOOL) shouldRingWhenReceiveMessage;
-(void) setRingWhenReceiveMessage:(BOOL)flag;

//函数37: 设置接收到消息时是否震动
-(BOOL) shouldVibrateWhenReceiveMessage;
-(void) setVibrateWhenReceiveMessage:(BOOL)flag;

//

@end



