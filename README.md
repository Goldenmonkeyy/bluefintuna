# bluefintuna
An analysis tool for blue team.

Functions:
1. Find the init time of intrusion.
2. Describe intrusion trail.
3. Find the possible hole and uri.
4. Find the adversary IP address.

Output contents（可直接用于溯源报告?）:
1. 最早入侵时间为年月日
2. 描述入侵和后续行为，可直接用于溯源报告：
3. 漏洞描述
4. 攻击IP地址，属地
5. 问题：导出报告中包含图片，怎么解决?

Input parameters
1. backend language: java, php
2. webshell name: *.jsp
3. warning time on detection system.
4. middleware type: tomcat, weblogic, nginx, etc...

Logic map:
1. 请求用户输入参数，并设置变量供以下使用
2. OS detection, 决定后面要使用的命令
3. 判断是否为root用户
   若不是，结束运行并告警；
   若是，则继续运行以下命令
4. 若输入中无时间，则需要查询系统当前时间
5. 可疑文件排查
6. 可疑网络连接排查
7. 可疑账号排查
8. 历史命令排查
9. 计划任务排查
10. 启动项排查
11. 中间件日志排查（最主要）
