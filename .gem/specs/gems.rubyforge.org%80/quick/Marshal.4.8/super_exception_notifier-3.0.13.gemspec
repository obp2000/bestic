u:Gem::Specification�["
1.3.7i"super_exception_notifierU:Gem::Version["3.0.13Iu:	Timeė�    :@marshal_with_utc_coercionF"QAllows unhandled (and handled!) exceptions to be captured and sent via emailU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:
@type:runtime:@requirement@ :@prereleaseF:
@name"actionmailero;	
;
U;[[[">=U; ["0;;;@*;F;"	rake0"peter.boling@gmail.com[
"Peter Boling"Scott Windsor"Ismael Celis"Jacques Crocker"Jamis Buck"�Allows customization of:
* Specify which level of notification you would like with an array of optional styles of notification (email, webhooks)
* the sender address of the email
* the recipient addresses
* the text used to prefix the subject line
* the HTTP status codes to notify for
* the error classes to send emails for
* alternatively, the error classes to not notify for
* whether to send error emails or just render without sending anything
* the HTTP status and status code that gets rendered with specific errors
* the view path to the error page templates
* custom errors, with custom error templates
* define error layouts at application or controller level, or use the controller's own default layout, or no layout at all
* get error notification for errors that occur in the console, using notifiable method
* Override the gem's handling and rendering with explicit rescue statements inline.
* Hooks into `git blame` output so you can get an idea of who (may) have introduced the bug
* Hooks into other website services (e.g. you can send exceptions to to Switchub.com)
* Can notify of errors occurring in any class/method using notifiable { method }
* Can notify of errors in Rake tasks using NotifiedTask.new instead of task
* Works with Hoptoad Notifier, so you can notify via SEN and/or Hoptoad for any particular errors.
* Tested with Rails 2.3.x, should work with rails 2.2.x, and is apparently not yet compatible with rails 3."5http://github.com/pboling/exception_notificationT@[ 