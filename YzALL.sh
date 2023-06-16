#!bin/bash
echo "请切换到root"
sudo su root
sleep
clear
echo"更新软件源"
apt update -y&& apt upgrade -y
echo “开始安装nodejs”
sudo apt-get install nodejs -y
sudo apt-get install npm -y
sudo npm install -g n
sudo n stable # latest
echo "已经安装node$node_version'"
clear
echo "安装数据库"
sudo apt install redis-server -y
clear 
echo "安装喵仔"
git clone --depth=1 https://gitee.com/yoimiya-kokomi/Miao-Yunzai.git
cd Miao-Yunzai 
git clone --depth=1 https://gitee.com/yoimiya-kokomi/miao-plugin.git ./plugins/miao-plugin/
npm --registry=https://registry.npmmirror.com install pnpm -g
pnpm install -P
echo "喵仔安装完成"
cd
 
clear
echo "安装云崽fork by miao"
git clone --depth=1 -b main https://gitee.com/yoimiya-kokomi/Yunzai-Bot.git
cd Yunzai-Bot #进入Yunzai目录
npm install pnpm -g
pnpm install -P
cd
clear
echo "正在安装柠檬崽"
npm install alemon-cli -g
alemon-cli install
sleep 5
echo "安装完成！"

