u:Gem::Specification�["
1.3.5i"ignore_nilU:Gem::Version["
1.0.3Iu:	Timef�    :@marshal_with_utc_coercionF"�ignore_nil lets you happily ignore nil methods on long method chains.  Keeps code pretty and much safer than &quot;rescue nil&quot;, since it only catches NoMethodError on nil objectsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"ssoroka78@gmail.com["Steven Soroka"�
    The plugin is really rather simple; here's the ignore_nil method:

        def ignore_nil(&amp;block)
          begin
            yield
          rescue NoMethodError, RuntimeError =&gt; e
            if (e.message =~ /You have a nil object when you didn't expect it/) ||
                (e.message =~ /undefined method `.*?' for nil:NilClass/) || (e.message =~ /^Called id for nil/)
              return nil
            else
              raise e
            end
          end
        end

    What's interesting about this is it catches both NoMethodError and RuntimeError, both of which
    can occur if a method unexpectedly returned nil and you called a method on it, but *ONLY* if
    the error message matches!  This means legitimate NoMethodError and RuntimeError messages will
    not be bothered by ignore_nil, and will still raise in your application as you expect.

    I've used this in a production application since about mid/late 2008, I'd consider it very stable.
    Feedback welcome!
    ")http://github.com/ssoroka/ignore_nilT@[ 