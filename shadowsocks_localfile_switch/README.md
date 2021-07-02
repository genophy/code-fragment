# shadowsocks_localfile_switch
### bash（zsh）科学上网切换脚本

### 用法 
##### 以文件名 ~/opt/shadowsocks/config.json.us 为例
1. 启动服务
```
./e-shadowsocks.sh us
```
2. 查看状态
```
./e-shadowsocks.sh status
```
3. 停止服务
```
./e-shadowsocks.sh stop
```
### 原理
##### 在~/opt/shadowsocks/目录下，寻找【config.json.】开头的文件，如config.json.us
文件配置如下
```json
{
    "server":"ip_address???",
    "server_port":10080,
    "local_address":"0.0.0.0",
    "local_port":1080,
    "password":"???",
    "timeout":600,
    "method":"aes-256-cfb"
}
```
##### 等同于命令
```
nohup sslocal -c ~/opt/shadowsocks/config.json.us
```
