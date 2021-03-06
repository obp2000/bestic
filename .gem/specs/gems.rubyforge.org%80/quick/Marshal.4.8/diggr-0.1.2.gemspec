u:Gem::Specification ["
1.2.0i"
diggrU:Gem::Version["
0.1.2Iu:	Time�!�    :@marshal_with_utc_coercionF"-Diggr is a ruby wrapper for the Digg APIU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"	need:@version_requirementsU;[[[">=U; ["
1.0.2o;		;
;;0;"	json;U;[[[">=U; ["
1.1.3o;		;
;;0;"activesupport;U;[[[">=U; ["
2.1.1o;		;
:development;0;"hoe;U;[[[">=U; ["
1.7.0"
diggr["drew@drewolson.org["Drew Olson"�Diggr is a ruby wrapper for the Digg API.  Diggr strives to remain consistent with the Digg API endpoints listed here:  http://apidoc.digg.com/CompleteList. Endpoints are created in Diggr with method calls.  Each node in an endpoint becomes a method call and each node which is an argument becomes  an argument to the previous method. As an example, the following endpoint  /user/{user name}  in which the user name is &quot;johndoe&quot; would be created with this Diggr call:  diggr.user(&quot;johndoe&quot;)  To send the request to the Digg API and retrieve the results of the call, Diggr requests are terminated in one of two ways.  1. Using the fetch method. By ending your request with the fetch method, your result will be returned to you. If the request is singular, you will receive a single object as a response. If the request is plural, you will receive a collection of objects stored in an array.  2. Using any Enumerable method. This works only on plural requests. In this case, it is unnecessary to use the fetch method.  See the synopsis for examples of each of these types of calls.  Options such as count or offset can be set using the options method and providing a hash of  arguments. See synopsis for more information.  Note: In an effort to remain consistent with the Digg API, some method names do not follow the ruby idiom of underscores. Although somewhat ugly, this allows a user to read the Digg API and understand the exact methods to call in Diggr to achieve their desired results."/Documentation - http://diggr.rubyforge.orgT@0