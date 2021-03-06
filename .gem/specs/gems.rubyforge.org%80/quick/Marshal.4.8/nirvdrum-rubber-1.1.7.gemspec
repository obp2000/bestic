u:Gem::Specification)["
1.3.5i"nirvdrum-rubberU:Gem::Version["
1.1.7Iu:	TimeE��    :@marshal_with_utc_coercionF"SA capistrano plugin for managing multi-instance deployments to the cloud (ec2)U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"capistrano:@version_requirementsU;[[[">=U; ["0o;		;
;;0;"nirvdrum-amazon-ec2;U;[[[">=U; ["
0.7.9o;		;
;;0;"aws-s3;U;[[[">=U; ["0o;		;
;;0;"nettica;U;[[[">=U; ["0o;		;
;;0;"httparty;U;[[[">=U; ["0o;		;
;;0;"
rails;U;[[[">=U; ["0"rubber"matt@conwaysplace.com["Matt Conway"pThe rubber plugin enables relatively complex multi-instance deployments of RubyOnRails applications to Amazon's Elastic Compute Cloud (EC2).  Like capistrano, rubber is role based, so you can define a set of configuration files for a role and then assign that role to as many concrete instances as needed. One can also assign multiple roles to a single instance. This lets one start out with a single ec2 instance (belonging to all roles), and add new instances into the mix as needed to scale specific facets of your deployment, e.g. adding in instances that serve only as an 'app' role to handle increased app server load."&http://github.com/wr0ngway/rubberT@[ 