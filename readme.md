### 备份所有用户创建的数据库到以当前时间(精确到分钟, 示例:2016-10-28_21-23)命名的文件夹里 

交互版要输入 MySQL 用户名与密码.

静默版要将 MySQL 用户名密码写进去再执行.

可备份为 sql 脚本文件 或用 gzip 压缩过的文件.

刚 pull 下来先 chmod 掉.

---

### Backup all user-created databases to a directory named by current datetime(format example:2016-10-28_21-23)

You need to enter MySQL credentials for the `interactive` versions.

You need to modify the MySQL credentials in the `silent` versions before executing them. 

You can backup your databases as `*.gz` files or the `*.sql` files as indicated in the script names.

Of course you need to `chmod` the scripts first.

---

### 参考/references

http://www.linux-magazine.com/Online/Blogs/Productivity-Sauce/Back-up-MySQL-Databases-with-a-Simple-Bash-Script


