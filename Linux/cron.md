From [Automated Tasks](https://www.centos.org/docs/5/html/Deployment_Guide-en-US/ch-autotasks.html)

34.1. Cron
34.2. At and Batch
34.3. Additional Resources
In Linux, tasks can be configured to run automatically within a specified period of time, on a specified date, or when the system load average is below a specified number. Red Hat Enterprise Linux is pre-configured to run important system tasks to keep the system updated. For example, the slocate database used by the locate command is updated daily. A system administrator can use automated tasks to perform periodic backups, monitor the system, run custom scripts, and more.

Red Hat Enterprise Linux comes with several automated tasks utilities: cron, at, and batch.

34.1. Cron

Cron is a daemon that can be used to schedule the execution of recurring tasks according to a combination of the time, day of the month, month, day of the week, and week.

Cron assumes that the system is on continuously. If the system is not on when a task is scheduled, it is not executed. To schedule one-time tasks, refer to Section 34.2, “At and Batch”.

To use the cron service, the vixie-cron RPM package must be installed and the crond service must be running. To determine if the package is installed, use the rpm -q vixie-cron command. To determine if the service is running, use the command /sbin/service crond status.

34.1.1. Configuring Cron Tasks

The main configuration file for cron, /etc/crontab, contains the following lines:
<pre>
SHELL=/bin/bash 
PATH=/sbin:/bin:/usr/sbin:/usr/bin 
MAILTO=root HOME=/  
# run-parts 
01 * * * * root run-parts /etc/cron.hourly 
02 4 * * * root run-parts /etc/cron.daily 
22 4 * * 0 root run-parts /etc/cron.weekly 
42 4 1 * * root run-parts /etc/cron.monthly
</pre>

The first four lines are variables used to configure the environment in which the cron tasks are run. The SHELL variable tells the system which shell environment to use (in this example the bash shell), while the PATH variable defines the path used to execute commands. The output of the cron tasks are emailed to the username defined with the MAILTO variable. If the MAILTO variable is defined as an empty string (MAILTO=""), email is not sent. The HOME variable can be used to set the home directory to use when executing commands or scripts.

Each line in the /etc/crontab file represents a task and has the following format:

minute   hour   day   month   dayofweek   command
minute — any integer from 0 to 59

hour — any integer from 0 to 23

day — any integer from 1 to 31 (must be a valid day if a month is specified)

month — any integer from 1 to 12 (or the short name of the month such as jan or feb)

dayofweek — any integer from 0 to 7, where 0 or 7 represents Sunday (or the short name of the week such as sun or mon)

command — the command to execute (the command can either be a command such as ls /proc >> /tmp/proc or the command to execute a custom script)

For any of the above values, an asterisk (*) can be used to specify all valid values. For example, an asterisk for the month value means execute the command every month within the constraints of the other values.

A hyphen (-) between integers specifies a range of integers. For example, 1-4 means the integers 1, 2, 3, and 4.

A list of values separated by commas (,) specifies a list. For example, 3, 4, 6, 8 indicates those four specific integers.

The forward slash (/) can be used to specify step values. The value of an integer can be skipped within a range by following the range with /<integer>. For example, 0-59/2 can be used to define every other minute in the minute field. Step values can also be used with an asterisk. For instance, the value */3 can be used in the month field to run the task every third month.

Any lines that begin with a hash mark (#) are comments and are not processed.

As shown in the /etc/crontab file, the run-parts script executes the scripts in the /etc/cron.hourly/, /etc/cron.daily/, /etc/cron.weekly/, and /etc/cron.monthly/ directories on an hourly, daily, weekly, or monthly basis respectively. The files in these directories should be shell scripts.

If a cron task is required to be executed on a schedule other than hourly, daily, weekly, or monthly, it can be added to the /etc/cron.d/ directory. All files in this directory use the same syntax as /etc/crontab. Refer to Example 34.1, “Crontab Examples” for examples.

<pre>
# record the memory usage of the system every monday
# at 3:30AM in the file /tmp/meminfo 
30 3 * * mon cat /proc/meminfo >> /tmp/meminfo 
# run custom script the first day of every month at 4:10AM 
10 4 1 * * /root/scripts/backup.sh
</pre>

Example 34.1. Crontab Examples

Users other than root can configure cron tasks by using the crontab utility. All user-defined crontabs are stored in the /var/spool/cron/ directory and are executed using the usernames of the users that created them. To create a crontab as a user, login as that user and type the command crontab -e to edit the user's crontab using the editor specified by the VISUAL or EDITOR environment variable. The file uses the same format as /etc/crontab. When the changes to the crontab are saved, the crontab is stored according to username and written to the file /var/spool/cron/username.

The cron daemon checks the /etc/crontab file, the /etc/cron.d/ directory, and the /var/spool/cron/ directory every minute for any changes. If any changes are found, they are loaded into memory. Thus, the daemon does not need to be restarted if a crontab file is changed.

34.1.2. Controlling Access to Cron

The /etc/cron.allow and /etc/cron.deny files are used to restrict access to cron. The format of both access control files is one username on each line. Whitespace is not permitted in either file. The cron daemon (crond) does not have to be restarted if the access control files are modified. The access control files are read each time a user tries to add or delete a cron task.

The root user can always use cron, regardless of the usernames listed in the access control files.

If the file cron.allow exists, only users listed in it are allowed to use cron, and the cron.deny file is ignored.

If cron.allow does not exist, users listed in cron.deny are not allowed to use cron.

#Reference
1. [CentOS下crontab 配置、日志使用记录](http://linux.it.net.cn/CentOS/operation/2016/0103/19553.html)
2. [Centos中crontab（计时器）用法详解](http://www.cnblogs.com/ccdc/archive/2012/06/01/2529471.html)