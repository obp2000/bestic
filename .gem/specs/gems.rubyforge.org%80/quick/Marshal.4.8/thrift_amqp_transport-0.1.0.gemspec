u:Gem::Specification�["
1.3.1i"thrift_amqp_transportU:Gem::Version["
0.1.0Iu:	Time�_�    :@marshal_with_utc_coercionF"JTransports thrift messages over a the advanced message queue protocolU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:@version_requirementsU;[[[">=U; ["
2.3.3:
@name"hoe"thrift_amqp_transport["eule@space.ch["Kaspar Schiess"�Transports thrift messages over a the advanced message queue protocol. (AMQP) Because of the unconnected broadcasting nature of the message queue, this  transport supports only one-way communication.   The usage scenario is that you would use this to broadcast information about  services (1 producer, n consumers) and then create point to point connections  from client to service using normal (TCP) thrift. You gain the advantage of using only one interface definition language (IDL).0T@0