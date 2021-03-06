u:Gem::Specification�["
1.3.7i"mockingbirdU:Gem::Version["
0.1.0u:	Time��    "MMockingbird is a mock server for testing with the Twitter Streaming API.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0.12.0:
@name"eventmachine:@requirement@ :@prereleaseF:
@type:runtime0"hayes@appozite.com["Hayes Davis"    Mockingbird emulates the Twitter Streaming API using a simple script-like 
    configuration that makes it easy to test code that connects to the Streaming 
    API. Mockingbird can be used to simulate bad data, unexpected status codes, 
    hard disconnects, etc.
    
    Mockingbird uses eventmachine to run as an actual streaming http server so
    it's a drop-in replacement for code that reads from the streaming api. 
    Simply change the host and port your code is connecting to from Twitter to 
    a running Mockingbird.
"-http://github.com/hayesdavis/mockingbirdT@[ 