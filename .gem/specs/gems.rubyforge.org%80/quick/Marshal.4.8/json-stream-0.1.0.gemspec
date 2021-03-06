u:Gem::Specification6["
1.3.7i"json-streamU:Gem::Version["
0.1.0u:	Timef��    "<A streaming JSON parser that generates SAX-like events.U:Gem::Requirement[[[">=U; ["
1.9.1U;[[[">=U; ["0"	ruby[ 0""david.malcom.graham@gmail.com["David Graham"A finite state machine based JSON parser that generates events
for each state change. This allows us to stream both the JSON document into
memory and the parsed object graph out of memory to some other process.  This
is much like an XML SAX parser that generates events during parsing.  There is
no requirement for the document nor the object graph to be fully buffered in
memory.  This is best suited for huge JSON documents that won't fit in memory.
For example, streaming and processing large map/reduce views from Apache CouchDB."*http://github.com/dgraham/json-streamT@[ 