u:Gem::Specification["
1.3.6i"resque-exponential-backoffU:Gem::Version["
0.1.1Iu:	Time���    :@marshal_with_utc_coercionF"HA resque plugin, add retry/exponential backoff to your resque jobs.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[
o:Gem::Dependency
:@version_requirementsU;[[["~>U; ["
1.8.0:@requirement@ :
@type:runtime:@prereleaseF:
@name"resqueo;	
;
U;[[["~>U; ["
1.8.0;@*;;;F;"resque-schedulero;	
;
U;[[["~>U; ["
0.2.0;@4;;;F;"hashieo;	
;
U;[[[">=U; ["0;@>;:development;F;"	turno;	
;
U;[[[">=U; ["0;@H;;;F;"	yard0"luke@lividpenguin.com["Luke Antins"aA resque plugin that adds retry/exponential backoff functionality to your
resque jobs.

Simply extend your module/class with this module:

    require 'resque-exponential-backoff'

    class DeliverWebHook
        extend Resque::Plugins::ExponentialBackoff

        def self.perform(url, hook_id, hmac_key)
            heavy_lifting
        end
    end
"9http://github.com/lantins/resque-exponential-backoffF@[ 