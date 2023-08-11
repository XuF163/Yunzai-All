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


