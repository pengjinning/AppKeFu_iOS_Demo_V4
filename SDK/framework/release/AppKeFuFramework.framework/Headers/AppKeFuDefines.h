//
//  AppKeFuDefines.h
//  AppKeFuFramework
//
//  Created by 宁金鹏 on 2017/2/10.
//  Copyright © 2017年 jackning. All rights reserved.
//

#ifndef AppKeFuDefines_h
#define AppKeFuDefines_h

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//消息通知
#define APPKEFU_NOTIFICATION_MESSAGE                @"appkefu_notification_message"
//登录成功通知
#define APPKEFU_LOGIN_SUCCEED_NOTIFICATION          @"appkefu_login_succeed_notification"
//注册成功通知
#define APPKEFU_REGISTER_SUCCEED_NOTIFICATION       @"appkefu_register_succeed_notification"
//如果要禁止发送消息时播放声音，请设置此值为整数2，
//如：[[NSUserDefaults standardUserDefaults] setInteger:2 forKey:APPKEFU_SHOULD_PLAY_SEND_MESSAGE_SOUND];
#define APPKEFU_SHOULD_PLAY_SEND_MESSAGE_SOUND      @"appkefu_should_play_send_message_sound"
//如果要禁止收到消息时播放声音，请设置此值为整数2，
//如：[[NSUserDefaults standardUserDefaults] setInteger:2 forKey:APPKEFU_SHOULD_PLAY_RECEIVE_MESSAGE_SOUND];
#define APPKEFU_SHOULD_PLAY_RECEIVE_MESSAGE_SOUND   @"appkefu_should_play_receive_message_sound"
//如果要禁止收到消息时震动，请设置此值为整数2，
//如：[[NSUserDefaults standardUserDefaults] setInteger:2 forKey:APPKEFU_SHOULD_VIBRATE_ON_RECEIVE_MESSAGE];
#define APPKEFU_SHOULD_VIBRATE_ON_RECEIVE_MESSAGE   @"appkefu_should_vibrate_on_receiving_message"
//后台消息前缀，具有此前缀的消息将不显示在会话窗口中
#define APPKEFU_IN_VISIBLE_MESSAGE_PREFIX           @"appkefu_in_visible_"
//
#define APPKEFU_NOTIFICATION_IMAGE_PERCENTAGE       @"appkefu_notification_image_percentage"
#define APPKEFU_NOTIFICATION_VOICE_PERCENTAGE       @"appkefu_notification_voice_percentage"
#define APPKEFU_NOTIFICATION_REQUEST_RATE           @"appkefu_notification_request_rate"
#define APPKEFU_NOTIFICATION_MSGPREKNOW             @"appkefu_notification_msg_pre_know"
#define APPKEFU_NOTIFICATION_DISCONNECT_WITH_ERROR  @"appkefu_notification_disconnect_with_error"
#define APPKEFU_NOTIFICATION_UPLOADIMAGE_ERROR      @"appkefu_notification_uploadimage_error"
#define APPKEFU_NOTIFICATION_UPLOADVOICE_ERROR      @"appkefu_notification_uploadvoice_error"
#define APPKEFU_NO_AGENT_AVAILABLE                  @"appkefu_no_agent_available"
#define APPKEFU_JOIN_CHAT_SESSION_RESPONSE          @"appkefu_join_chat_session_response"
#define APPKEFU_ACCEPT_CHAT_SESSION                 @"appkefu_accept_chat_session"
#define APPKEFU_WORKGROUP_QUEUESTATUS               @"appkefu_workgroup_queue_status"
#define APPKEFU_WORKGROUP_ONLINESTATUS              @"appkefu_workgroup_online_status"
#define APPKEFU_VALIDATE_APPKEY_RESULT              @"appkefu_validate_appkey_result"
#define APPKEFU_FAQ_SECTION_RESULT                  @"appkefu_faq_section_results"
#define APPKEFU_FAQ_DETAIL_RESULT                   @"appkefu_faq_detail_results"
#define APPKEFU_CLOSE_SESSION                       @"appkefu_close_session"
#define APPKEFU_AGENT_QUIT                          @"appkefu_agent_quit"
#define APPKEFU_MENU                                @"appkefu_menu"
#define APPKEFU_MESSAGE_ACK                         @"appkefu_message_ack"
#define APPKEFU_KEFU_AVATAR_IMAGE                   @"appkefu_kefu_avatar_image"
#define APPKEFU_USER_AVATAR_IMAGE                   @"appkefu_user_avatar_image"
#define APPKEFU_SESSIONID                           @"appkefu_sessionid"
#define APPKEFU_TRANSFER_ACCEPT_CHAT                @"appkefu_transfer_accept_chat2"
#define APPKEFU_HIDE_RATE_BUTTON                    @"appkefu_hide_rate_button"
#define APPKEFU_HIDE_FAQ_BUTTON                     @"appkefu_hide_faq_button"
#define APPKEFU_MESSAGE_RETRACT                     @"appkefu_message_retract"
#define APPKEFU_MESSAGE_RETRACT_PREFIX              @"system_message_retracted"

//
#define APPKEFU_WORKGROUP_NAMESPACE                 @"http://jabber.org/protocol/workgroup"
#define APPKEFU_VALIDATE_NAMESPACE                  @"http://jabber.org/protocol/validate"
#define APPKEFU_FAQ_NAMESPACE                       @"http://jabber.org/protocol/faq"
#define APPKEFU_MENU_NAMESPACE                      @"http://jabber.org/protocol/menu"
#define APPKEFU_TAG_NAMESPACE                       @"http://jabber.org/protocol/tag"
#define APPKEFU_ROBOT_NAMESPACE                     @"http://jabber.org/protocol/robot"
#define APPKEFU_EXTINFO_NAMESPACE                   @"http://jabber.org/protocol/extinfo"

#define APPKEFU_SERVICE_RESOURCE                    @"iphone_kefu_sdk"
#define APPKEFU_ROBOT_NAME                          @"appkefu_robot_name"
#define APPKEFU_AGENT_NAME                          @"appkefu_agent_name"
#define APPKEFU_AGENT_NICKNAME                      @"appkefu_agent_nickname"
#define APPKEFU_AGENT_AVATAR                        @"appkefu_agent_avatar"
#define APPKEFU_IS_TAGS_SET                         @"appkefu_is_tags_set"

#define APPKEFU_TAG_NICKNAME                        @"appkefu_tag_nickname"
#define APPKEFU_TAG_SEX                             @"appkefu_tag_sex"
#define APPKEFU_TAG_LANGUAGE                        @"appkefu_tag_language"
#define APPKEFU_TAG_COUNTRY                         @"appkefu_tag_country"
#define APPKEFU_TAG_PROVINCE                        @"appkefu_tag_province"
#define APPKEFU_TAG_CITY                            @"appkefu_tag_city"
#define APPKEFU_TAG_OTHER                           @"appkefu_tag_other"

#define APPKEFU_MSGTYPE_TXT                         @"txt"
#define APPKEFU_MSGTYPE_IMG                         @"img"
#define APPKEFU_MSGTYPE_VOICE                       @"voice"

#define APPKEFU_ENABLEIPMODE                        @"appkefu_enableipmode"

//
#define APPKEFU_UPLOAD_DEVICETOKEN                  @"https://upload.weikefu.net/AppKeFu/apis/uploadDeviceToken.php?username=%@&token=%@&appkey=%@"
#define APPKEFU_REMOVE_DEVICETOKEN                  @"https://upload.weikefu.net/AppKeFu/apis/removeDeviceToken.php?username=%@&appkey=%@"

//
//#define APPKEFU_SERVER_DOMAIN                       @"appkefu.com"
//#define APPKEFU_SERVER_DOMAIN                       @"47.90.33.185"
#define APPKEFU_SERVER_DOMAIN                       @"xmpp.weikefu.net"
#define APPKEFU_IP_SERVER_DOMAIN                    @"121.43.69.144"
#define APPKEFU_UPLOAD_IMAGEURL                     @"https://upload.weikefu.net/AppKeFu/uploadoss/uploadiOSImage.php"
#define APPKEFU_UPLOAD_VOICEURL                     @"https://upload.weikefu.net/AppKeFu/uploadoss/uploadiOSVoice.php"


//#define AppKeFuLocalizedString(key, comment) \
//NSLocalizedStringFromTableInBundle((key), @"AppKeFu", [[NSBundle mainBundle] pathForResource:@"AppKeFuResources.bundle/Localizable" ofType:@"strings"], (comment))


//http://dalezak.ca/2012/12/nslocalizedstring-framework.html
//http://blog.xianqu.org/2015/08/pod-resources/
#define AppKeFuLocalizedString(key, comment) \
NSLocalizedStringFromTableInBundle((key), @"AppKeFu", [NSBundle bundleWithPath:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"AppKeFuResources.bundle"]], (comment))



#endif /* AppKeFuDefines_h */










