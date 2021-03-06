u:Gem::SpecificationK["
1.3.2i"cosellU:Gem::Version["
0.0.2Iu:	Timede�    :@marshal_with_utc_coercionF"�Cosell is a minimal implementation of the 'Announcements' observer framework, originally introduced in VisualWorks Smalltalk as a replacement for 'triggerEvent' style of event notificationU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:@version_requirementsU;[[[">=U; ["
2.5.1:
@name"
bones"cosell"sswerling@yahoo.com["Steven Swerling"Cosell is a minimal implementation of the 'Announcements' observer
framework, originally introduced in VisualWorks Smalltalk as a
replacement for 'triggerEvent' style of event notification.  Instead of
triggering events identified by symbols, the events are first class
objects.  For rationale, please see the original blog posting by Vassili
Bykov (refs below).

*Lineage*

This implementation is loosely based on Lukas Renggli's tweak of Colin Putney's
Squeak implementation of Vassili Bykov's Announcements framework for
VisualWorks Smalltalk.  (Specifically Announcements-lr.13.mcz was used as
a reference.)

Liberties where taken during the port. In particular, the Announcer class
in the Smalltalk version is implemented here as a ruby module which can be
mixed into any object. Also, in this implementation any object (or class)
can serve as an announcement, so no Announcement class is implemented. 

The ability to queue announcements in the background is built into cosell.

&lt;b&gt;The Name 'Cosell'&lt;/b&gt;

I chose the name 'Cosell' because 

a. Howard Cosell is an iconic event announcer
b. Googling for 'Ruby Announcements', 'Ruby Event Announcements', etc., produced scads of results about ruby meetups, conferences, and the like. So I went with something a bit cryptic but hopefully a little more searchable. 

*See*

* {Original blog posting describing Announcments by Vassili Bykov}[http://www.cincomsmalltalk.com/userblogs/vbykov/blogView?entry=3310034894]
* {More info on the Announcements Framework}[http://wiki.squeak.org/squeak/5734]"$http://github.com/swerling/TODOT@[ 