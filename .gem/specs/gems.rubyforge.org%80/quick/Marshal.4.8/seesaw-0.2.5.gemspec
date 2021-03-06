u:Gem::SpecificationY["
0.9.4i"seesawU:Gem::Version["
0.2.5Iu:	Timen��    :@marshal_with_utc_coercionF"6Ripple-restart a mongrel cluster with no downtimeU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[	o:Gem::Dependency:@version_requirement0:
@name"gem_plugin:@version_requirementsU;[[[">=U; ["
0.2.2o;	;
0;"mongrel;U;[[[">=U; ["
1.0.1o;	;
0;"mongrel_cluster;U;[[[">=U; ["
1.0.2o;	;
0;"hoe;U;[[[">=U; ["
1.2.2"seesaw"max@muermann.org["Matt Allen, Max Muermann"?== DESCRIPTION:  seesaw: [verb] to change rapidly from one state or condition to another and back again.  Seesaw is a replacement/addition to the mongrel_cluster gem and allows you to perform a safe rippling restart of your mongrel cluster without dropping any requests.  Let's say you have a mongrel cluster setup with 7 individual mongrels on your server. Let's also say that you have to deploy a code update and restart all of your mongrels but your site is really busy and you cannot afford any downtime whatsoever.  When you execute:  mongrel_rails seesaw::bounce  This will happen:  1. your webserver configuration is switched to only use the front half of your mongrel pack (mongrels 1-4) 2. the webserver (apache or nginx) is gracefully restarted 3. the back half of your mongrel pack (mongrels 5-7) is restarted 4. your webserver configuration is switched to only use the back half of the pack 5. the webserver is gracefully restarted 6. front half mongrels are restared 7. webserver configuration switched back to full cluster configuration 8. webserver restarted one last time"'    by Matt Allen and Max MuermannT@0