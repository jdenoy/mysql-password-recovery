#!/bin/bash
echo "update mysql.user set Super_priv='y' where user='root';" > recovery.sql
echo "update mysql.user set Select_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Insert_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Update_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Delete_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Create_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Drop_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Reload_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Shutdown_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Process_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set File_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Grant_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set References_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Index_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Alter_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Show_db_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Super_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Create_tmp_table_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Lock_tables_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Execute_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Repl_slave_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Repl_client_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Create_view_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Show_view_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Create_routine_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Alter_routine_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set Create_user_priv='y' where user='root';" >> recovery.sql
echo "update mysql.user set password=password('PASS-ROOT') where user='root';" >> recovery.sql
echo "grand all privileges on *.* to 'root'@'localhost' with grant option;" >> recovery.sql
/etc/init.d/mysql stop
/usr/sbin/mysqld -skip-grant-tables &
/usr/bin/mysql -vv < restore.sql
/etc/init.d/mysql restart
rm recovery.sql
