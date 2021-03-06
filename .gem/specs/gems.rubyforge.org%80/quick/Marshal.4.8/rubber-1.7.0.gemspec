u:Gem::Specification�["
1.3.7i"rubberU:Gem::Version["
1.7.0u:	Time$��    "SA capistrano plugin for managing multi-instance deployments to the cloud (ec2)U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.4.0:
@name"capistrano:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
0.9.0;
"amazon-ec2;@*;F;;o;
;	U;[[[">=U; ["0;
"aws-s3;@4;F;;o;
;	U;[[[">=U; ["0;
"nettica;@>;F;;"rubber"matt@conwaysplace.com["Matt Conway"�      The rubber plugin enables relatively complex multi-instance deployments of RubyOnRails applications to
      Amazon's Elastic Compute Cloud (EC2).  Like capistrano, rubber is role based, so you can define a set
      of configuration files for a role and then assign that role to as many concrete instances as needed. One
      can also assign multiple roles to a single instance. This lets one start out with a single ec2 instance
      (belonging to all roles), and add new instances into the mix as needed to scale specific facets of your
      deployment, e.g. adding in instances that serve only as an 'app' role to handle increased app server load.
"&http://github.com/wr0ngway/rubberT@[ 