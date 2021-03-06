u:Gem::Specification["
1.3.7i"!resque_action_mailer_backendU:Gem::Version["
0.0.2u:	Timec��    "/Use Resque to enqueue and send your emailsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.8.0:
@name"resque:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
2.2.0;
"actionmailer;@*;F;;o;
;	U;[[[">=U; ["
1.2.9;
"
rspec;@4;F;:development"!resque_action_mailer_backend" mauricio.linhares@gmail.com["Maur&#237;cio Linhares"�
      With this gem you will be able to enqueue your emails
      on your Resque workers to avoid making your user wait for the email to be
      send when he causes an email sending action in your application.

      Using resque_action_mailer_backend makes email sending a breeze as
      you will be able to use Resque to retry failed emails, easily deliver all
      those marketing emails to your clients and without changing anything at
      your email sending code.

      Just tell your application to use :resque for sending emails and you're done,
      no need to add yet another tool just for delivering your emails if you're
      already using Resque for your asynchronous processing.
    "<http://github.com/mauricio/resque_action_mailer_backendT@[ 