u:Gem::SpecificationO["
1.3.5i"axtro-rubberU:Gem::Version["
1.2.1Iu:	Time���    :@marshal_with_utc_coercionF"SA capistrano plugin for managing multi-instance deployments to the cloud (ec2)U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[["<U; ["
0.4.0:
@type:runtime:@version_requirement0:
@name"gemcuttero;		;
U;[[[">=U; ["0;;;0;"capistranoo;		;
U;[[[">=U; ["
0.9.0;;;0;"amazon-ec2o;		;
U;[[[">=U; ["0;;;0;"aws-s3o;		;
U;[[[">=U; ["0;;;0;"netticao;		;
U;[[[">=U; ["0;;;0;"httpartyo;		;
U;[[[">=U; ["0;;;0;"
rails"rubber"matt@conwaysplace.com["Matt Conway"pThe rubber plugin enables relatively complex multi-instance deployments of RubyOnRails applications to Amazon's Elastic Compute Cloud (EC2).  Like capistrano, rubber is role based, so you can define a set of configuration files for a role and then assign that role to as many concrete instances as needed. One can also assign multiple roles to a single instance. This lets one start out with a single ec2 instance (belonging to all roles), and add new instances into the mix as needed to scale specific facets of your deployment, e.g. adding in instances that serve only as an 'app' role to handle increased app server load."&http://github.com/wr0ngway/rubberT@[ 