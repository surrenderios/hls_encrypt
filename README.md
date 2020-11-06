# hls_encrypt

## 1:生成密钥
终端执行：openssl rand 16 > enc.key, 会生产一个key文件

## 2:生成随机向量
终端执行：openssl rand -hex 16

## 3:生成 key_info 文件
需要保证文件的格式为：

`Key URI

Path to key file

IV (optional)`

建立一个key_info.txt文件，将上面生成的写入：如下图所示：
![](media/16046291461964/16046297090805.jpg)

（此处使用Key URI 使用的本地的，标准的是一个 https 地址）

## 4: 加密文件并切片
终端执行: ffmpeg -y -i SampleVideo_1280x720_5mb.mp4 -hls_time 5 -hls_key_info_file key_info -hls_playlist_type vod -hls_segment_filename part_%04d.ts encrypted.m3u8

## 5: 本地播放
参见Demo, 通过搭建的本地服务器, 然后播放器请求指向本地的加密文件，就可以正常进行播放了


## 具体详细内容请参考
1. HLS协议官方文档：https://developer.apple.com/streaming/
2. 本地服务器搭建：https://github.com/robbiehanson/CocoaHTTPServer


