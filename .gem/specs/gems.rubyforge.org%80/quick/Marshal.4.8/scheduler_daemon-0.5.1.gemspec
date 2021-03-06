u:Gem::Specification�["
1.3.5i"scheduler_daemonU:Gem::Version["
0.5.1Iu:	Timef�    :@marshal_with_utc_coercionF"�Rails 2.3.2 compatible scheduler daemon.  Replaces cron/rake pattern of periodically running rake tasks  to perform maintenance tasks in Rails apps. Scheduler Daemon is made specifically for your Rails app,  and only loads the environment once, no matter how many tasks run.  What's so great about it?  Well, I'm glad you asked!  - Only loads your Rails environment once on daemon start, not every time a task is run - Allows you to easily deploy the scheduled tasks with your Rails app instead of depending on an administrator to update crontab - It doesn't use rake or cron! - Gets you up and running with your own daemon in under 2 minutesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency	:
@type:runtime:@version_requirement0:@version_requirementsU;[[[">=U; ["0.12.8:
@name"eventmachineo;		;
;;0;U;[[[">=U; ["1.0.10;"daemonso;		;
;;0;U;[[[">=U; ["
2.0.1;"rufus-schedulero;		;
;;0;U;[[[">=U; ["
0.2.0;"chronic0"ssoroka78@gmail.com["Steven Soroka" "/http://github.com/ssoroka/scheduler_daemonT@[ 