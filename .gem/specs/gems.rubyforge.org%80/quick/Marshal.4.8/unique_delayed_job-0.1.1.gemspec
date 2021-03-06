u:Gem::Specification�["
1.3.5i"unique_delayed_jobU:Gem::Version["
0.1.1Iu:	Timehj�    :@marshal_with_utc_coercionF"9Class for inserting delayed jobs without duplicationU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"percivalatumamibuddotcom["Brian Percival"�Class for creating delayed jobs that can be de-duped with existing delayed jobs
already in the delayed jobs table. You just specify some additional columns on
your delayed_jobs table and set them to have uniqueness constraints. Then
specify these column values when you create a UniqueDelayedJob and if a
duplicate key is raised on insert, then the insert will just be ignored. There
are factory methods for creating a delayed job in the following ways:
* with a delayed job handler class (one that responds to perform())
* with an object, method and method arguments
* with a code string to be evaled

NOTE: you must have delayed_job installed as a gem or plugin
"1http://github.com/bmpercy/unique_delayed_jobT@[ 