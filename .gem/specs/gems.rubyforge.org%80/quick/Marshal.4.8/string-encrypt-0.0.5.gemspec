u:Gem::Specification�["
1.3.3i"string-encryptU:Gem::Version["
0.0.5Iu:	TimeR�    :@marshal_with_utc_coercionF"uString open classed with AES-256 and RSA encryption and zipping methods for easy, secure, encryption of strings.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ "string-encrypt"branden@rubyforge.com["Branden Giacoletto"�String open classed with AES-256 and RSA encryption and zipping methods for easy, secure, encryption of strings.

The string_encryption gem was started with the intention of being
compatible with the RSA and AES algorithms used in a javascript
library on http://www.pidder.com/pidcrypt .  Usage and testing
against the pidcrypt library hasn't been done yet, but is scheduled
for the future.
The intent of this library is to make encryption and decryption of a 
string as straight forward as capitalizing or reversing is.

To encrypt a string:  
    encrypted_secret = &quot;Super Secret Text&quot;.encrypt(&quot;Super Secret Password&quot;)
To decrypt a string:
    decrypted_secret = encrypted_secret.encrypt(&quot;Super Secret Password&quot;)



Branden Giacoletto
"(http://string-encrypt.rubyforge.comT@[ 