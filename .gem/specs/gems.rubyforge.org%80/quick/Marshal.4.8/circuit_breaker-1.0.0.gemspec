u:Gem::SpecificationQ["
1.3.4i"circuit_breakerU:Gem::Version["
1.0.0Iu:	Time�Y�    :@marshal_with_utc_coercionF"{CircuitBreaker is a relatively simple Ruby mixin that will wrap a call to a given service in a circuit breaker patternU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:
@name"rubyist-aasm:@version_requirementsU;[[[">=U; ["0:@version_requirement0o;		;
:development;"
rspec;U;[[[">=U; ["0;0o;		;
;;"hoe;U;[[[">=U; ["
2.3.1;0"will_sargent["will.sargent@gmail.com["Will Sargent"�CircuitBreaker is a relatively simple Ruby mixin that will wrap
 a call to a given service in a circuit breaker pattern.

 The circuit starts off &quot;closed&quot; meaning that all calls will go through.
 However, consecutive failures are recorded and after a threshold is reached,
 the circuit will &quot;trip&quot;, setting the circuit into an &quot;open&quot; state.

 In an &quot;open&quot; state, every call to the service will fail by raising
 CircuitBrokenException.

 The circuit will remain in an &quot;open&quot; state until the failure timeout has
 elapsed.

 After the failure_timeout has elapsed, the circuit will go into
 a &quot;half open&quot; state and the call will go through.  A failure will
 immediately pop the circuit open again, and a success will close the
 circuit and reset the failure count.

     require 'circuit_breaker'
     class TestService

       include CircuitBreaker

       def call_remote_service() ...

       circuit_method :call_remote_service

       # Optional
       circuit_handler do |handler|
         handler.logger = Logger.new(STDOUT)
         handler.failure_threshold = 5
         handler.failure_timeout = 5
       end

       # Optional
       circuit_handler_class MyCustomCircuitHandler
     end"/http://github.com/wsargent/circuit_breakerT@[ 