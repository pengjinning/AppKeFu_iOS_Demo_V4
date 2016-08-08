


# AppKeFu_SDK 3.0 使用说明

具体参考：http://appkefu.com/AppKeFu/tutorial-iOS3.html


一.替换图片资源方法：1.将 AppKeFuResources.bundle 去掉后缀，即重命名为 AppKeFuResoures;
                  2.然后用自己的图片替换掉相应的图片，注意保持原文件名。
                  3.替换完毕之后再为其添加.bundle后缀，即改回原先的文件名AppKeFuResources.bundle


二.依赖frameworks:

    libxml2.dylib
    libresolv.dylib
    SystemConfiguration.framework
    CoreLocation.framework
    CoreData.framework
    AVFoundation.framework
    AudioToolbox.framework
    

三：
 选中target中的Build Settings:
    1. Other Linker Flags 添加 -all_load


四：
 支持：armv7 armv7s i386 x86_64 arm64


五：
 国际化 请参见 Localizable.strings 文件
 
六：
 离线消息推送，管理后台上传.pem，请参加官网指南
 
七：
  关于.a文件的大小：因为打包库文件.a的时候，
  需要同时支持i386 armv7 armv7s arm64等几种架构，所以单从体积上来说有33mb,
  但是当在实际开发过程中集成到app里面去之后,发挥作用的只有其中一种架构,
  也就是说实际上.a库文件对app打包之后的.ipa文件大小的影响很小,几乎可以忽略
  

注意：



 

































