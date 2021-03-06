u:Gem::Specificationa["
1.3.4i"smtp_tlsU:Gem::Version["
1.0.3Iu:	TimeY�    :@marshal_with_utc_coercionF"HProvides SMTP STARTTLS support for Ruby 1.8.6 (built-in for 1.8.7+)U:Gem::Requirement[[["~>U; ["1.8.6.0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:
@name"hoe:@version_requirementsU;[[[">=U; ["
2.3.2:@version_requirement0"seattlerb["drbrain@segment7.net" ["Eric Hodel"Kyle Maxwell"�	Provides SMTP STARTTLS support for Ruby 1.8.6 (built-in for 1.8.7+).  Simply
require 'smtp_tls' and use the Net::SMTP#enable_starttls method to talk to
servers that use STARTTLS.

  require 'net/smtp'
  begin
    require 'smtp_tls'
  rescue LoadError
  end

  smtp = Net::SMTP.new address, port
  smtp.enable_starttls
  smtp.start Socket.gethostname, user, password, authentication do |server|
    server.send_message message, from, to
  end

You can also test your SMTP connection settings using mail_smtp_tls:

  $ date | ruby -Ilib bin/mail_smtp_tls smtp.example.com submission \
    &quot;your username&quot; &quot;your password&quot; plain \
    from@example.com to@example.com
  Using SMTP_TLS 1.0.3
  -&gt; &quot;220 smtp.example.com ESMTP XXX\r\n&quot;
  &lt;- &quot;EHLO you.example.com\r\n&quot;
  -&gt; &quot;250-smtp.example.com at your service, [192.0.2.1]\r\n&quot;
  -&gt; &quot;250-SIZE 35651584\r\n&quot;
  -&gt; &quot;250-8BITMIME\r\n&quot;
  -&gt; &quot;250-STARTTLS\r\n&quot;
  -&gt; &quot;250-ENHANCEDSTATUSCODES\r\n&quot;
  -&gt; &quot;250 PIPELINING\r\n&quot;
  &lt;- &quot;STARTTLS\r\n&quot;
  -&gt; &quot;220 2.0.0 Ready to start TLS\r\n&quot;
  TLS connection started
  &lt;- &quot;EHLO you.example.com\r\n&quot;
  -&gt; &quot;250-smtp.example.com at your service, [192.0.2.1]\r\n&quot;
  -&gt; &quot;250-SIZE 35651584\r\n&quot;
  -&gt; &quot;250-8BITMIME\r\n&quot;
  -&gt; &quot;250-AUTH LOGIN PLAIN\r\n&quot;
  -&gt; &quot;250-ENHANCEDSTATUSCODES\r\n&quot;
  -&gt; &quot;250 PIPELINING\r\n&quot;
  &lt;- &quot;AUTH PLAIN BASE64_STUFF_HERE\r\n&quot;
  -&gt; &quot;235 2.7.0 Accepted\r\n&quot;
  &lt;- &quot;MAIL FROM:&lt;from@example.com&gt;\r\n&quot;
  -&gt; &quot;250 2.1.0 OK XXX\r\n&quot;
  &lt;- &quot;RCPT TO:&lt;to@example.com&gt;\r\n&quot;
  -&gt; &quot;250 2.1.5 OK XXX\r\n&quot;
  &lt;- &quot;DATA\r\n&quot;
  -&gt; &quot;354  Go ahead XXX\r\n&quot;
  writing message from String
  wrote 91 bytes
  -&gt; &quot;250 2.0.0 OK 1247028988 XXX\r\n&quot;
  &lt;- &quot;QUIT\r\n&quot;
  -&gt; &quot;221 2.0.0 closing connection XXX\r\n&quot;

This will connect to smtp.example.com using the submission port (port 587)
with a username and password of &quot;your username&quot; and &quot;your password&quot; and
authenticate using plain-text auth (the submission port always uses SSL) then
send the current date to to@example.com from from@example.com.

Debug output from the connection will be printed on stderr.",http://seattlerb.rubyforge.org/smtp_tlsT@[ 