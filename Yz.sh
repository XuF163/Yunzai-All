#!/bin/bash
cat <<-EOF
-------------------------------------------------------------------------------------
欢迎使用open-scripts脚本！  
1.系统信息
2.安装云崽
3.性能测试
4.网速测试
-------------------------------------------------------------------------------------
read -p "请输入：" action
EOF
case "$action" in
1)
cat <<-EOF
当前服务器信息如下：
CPU型号： $(lscpu|grep -v "Model name")
核心数量：$(lscpu|grep -v"CPU(s):")
内存：已使用$(awk {print $3})
;
;      
2) 
echo "正在比较网络环境"
ping github.com -c1
ping gitee.com -c1
#获取ping值
ping_github=$(ping github.com -c1|grep "avg"|awk -F"/" '{print $5}')
ping_gitee=$(ping gitee.com -c1|grep "avg"|awk -F"/" '{print $5}')
if [ $ping_github -gt $ping_gitee ];
echo"github 网速更快" 
url=github.com
then
echo "gitee 网速更快"
url=gitee.com
fi
echo "检测git命令是否安装"、
git --version
if [ $? -eq 0 ];
then 
echo "git已安装"
else
apt-get install git -y
fi
 #检测node是否安装以及版本号是否大于16，如果小于或未安装则安装
node -v&>/dev/null   
if [ $? -gt 16 ];
then 
echo "node已安装"
elif [ $? ne 0 ];
then echo "node未安装"
#安装node并升级到最新稳定版
aptupdate -y
apt install nodejs -y
npm install -g n
n stable
fi
#检测redis是否安装，未安装则安装
redis-server -v&>/dev/null
if [ $? -eq 0 ];
then echo "redis已安装"
redis-server --daemonize yes
else
#安装redis并启动保活
aptupdate -y
apt install redis-server -y
redis-server --daemonize yes
fi
echo"-------------------------------------------------------------------------------------"
echo "正在安装云崽"
 if [url=gitee.com];
    then
        git clone --depth=1 https://gitee.com/yoimiya-kokomi/Miao-Yunzai.git&>/dev/null
        cd Miao-Yunzai 
        git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/ &>/dev/null
        npm --registry=https://registry.npmmirror.com install pnpm -g %>/dev/null
        pnpm config set registry https://registry.npmmirror.com 
        pnpm install -P
        echo "-------------------------------------------------------------------------------------"
elif [url=github.com];
    then
        echo "国外源还没找到"
        echo "安装完成"
#全局替换“node app”命令为“云崽启动”
alias 云崽="cd Miao-Yunzai&&node app"
#刷新配置文件
source ~/.bashrc
;
;
3）
;
;
#调用speedtest-cli进行网络测速
apt-get install speedtest-cli -y
speedtest-cli
;;
esac


