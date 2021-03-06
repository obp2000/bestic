u:Gem::Specification�["
1.3.6i"	hastU:Gem::Version["
0.3.2Iu:	Time���    :@marshal_with_utc_coercionF"�Hosting Account Status Tool - Fetch domains from Apache configuration files and Postfix on a hosting server environment. Then run a report checking each domains DNS records to see if they match your server.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0.1:@requirement@ :
@type:runtime:@prereleaseF:
@name"net-dnso;	
;
U;[[[">=U; ["
0.1.0;@*;;;F;"deep_merge0"w@tson.dk["Thomas Watson Steen"�      HAST stands for 'Hosting Account Status Tool'.

      HAST is a tool for fetching domains from Apache configuration files and
      from Postfix on a hosting server environment. It will then run a report,
      checking the DNS records for each domain to see if they match your server.

      This is important for finding "dead" domains where the domain either
      doesn't exist anymore or where the owner have moved it to another
      hosting provider.

      Before you can use HAST, you need to setup a config.yml file. Run 'hast
      --generate-config &gt; config.yml' to create a sample config file that you
      can modify.
""http://github.com/watson/hastT@[ 