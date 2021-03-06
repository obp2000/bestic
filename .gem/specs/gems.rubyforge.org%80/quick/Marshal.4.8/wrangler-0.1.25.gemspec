u:Gem::SpecificationN["
1.3.7i"wranglerU:Gem::Version["0.1.25u:	Time���    "�Handles exceptions in rails apps, rendering error pages and emailing when exceptions occur. Spun off from some work at discovereads.comU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"percivalatumamibuddotcom["Brian Percival"�A gem for handling exceptions thrown inside your Rails app. If you include the
gem in your application controller, wrangler will render the error pages you
configure for each exception or HTTP error code. It will also handle notifying
you via email when certain exceptions are raised. Allows for configuration of
which exceptions map to which error pages, which exceptions result in emails
being sent. Also allows for asynchronous email sending via delayed job so that
error pages don't take forever to load (but delayed_job is not required for
sending email; wrangler will automatically send email synchronously if
delayed_job is not available. . See README for lots of info on how to
get started and what configuration options are available.
"'http://github.com/bmpercy/wranglerT@[ 