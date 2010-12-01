u:Gem::SpecificationG["
1.3.7i"ruby-mcryptU:Gem::Version["
0.1.1u:	Time��    " Ruby bindings for libmcryptU:Gem::Requirement[[[">=U; ["
1.8.6U;[[[">=U; ["0"	ruby[ 0"philgarr@gmail.com["Philip Garrett"J
= Mcrypt - libmcrypt bindings for Ruby

Mcrypt provides Ruby-language bindings for libmcrypt(3), a
symmetric cryptography library. {Libmcrypt}[http://mcrypt.sourceforge.net/]
supports lots of different ciphers and encryption modes.

== You will need

* A working Ruby installation (&gt;= 1.8.6 or 1.9)
* A working libmcrypt installation (2.5.x or 2.6.x, tested with 2.5.8)
* A sane build environment

== Installation

Install the gem:
  gem install ruby-mcrypt --test -- --with-mcrypt-dir=/path/to/mcrypt/prefix

If you want to run the longer test suite, do this instead:
  MCRYPT_TEST_BRUTE=1 \
  gem install ruby-mcrypt --test -- --with-mcrypt-dir=/path/to/mcrypt/prefix

Put this in your code:
  require 'rubygems'
  require 'mcrypt'

Or in Rails' environment.rb:
  gem "ruby-mcrypt", :lib =&gt; "mcrypt"

== Usage

  crypto = Mcrypt.new(:twofish, :cbc, MY_KEY, MY_IV, :pkcs)

  # encryption and decryption in one step
  ciphertext = crypto.encrypt(plaintext)
  plaintext  = crypto.decrypt(ciphertext)

  # encrypt in smaller steps
  while chunk = $stdin.read(4096)
    $stdout &lt;&lt; crypto.encrypt_more(chunk)
  end
  $stdout &lt;&lt; crypto.encrypt_finish

  # or decrypt:
  while chunk = $stdin.read(4096)
    $stdout &lt;&lt; crypto.decrypt_more(chunk)
  end
  $stdout &lt;&lt; crypto.decrypt_finish

== Known Issues

* Test coverage is lacking.

If you find any bugs, please let the author know.

== Wish List

* IO-like behavior, e.g. crypto.open($stdin) { |stream| ... }

== Author

* Philip Garrett &lt;philgarr at gmail.com&gt;

== Copyright and License

Copyright (c) 2009-2010 Philip Garrett.

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"+http://github.com/kingpong/ruby-mcryptT@[ 