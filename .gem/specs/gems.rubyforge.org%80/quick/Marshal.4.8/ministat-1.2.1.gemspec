u:Gem::Specification�["
1.3.7i"ministatU:Gem::Version["
1.2.1Iu:	TimeG��    :@marshal_with_utc_coercionF"YA small and simple library to generate statistical info on single-variable datasets.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"dean@ero.com["Dean Hudson"�ministat
    Author: H. Dean Hudson &lt;dean@ero.com&gt;

== DESCRIPTION:

This is a simple package that generates simple statistical info on
numerical data sets of a single variable. It's nothing too fancy, but
maybe just enough to coat your numbers with a thin layer of science. Or,
at least to get you thinking about what it may take to do so.

== FEATURES/PROBLEMS:

* Pure Ruby
* It's small and simple
* It's probably good enough
* I haven't profiled it against large data sets
* Naive median implementation requires a sort, but it could be done in linear time. Patches welcome.
* Missing tests for harmonic and geometric mean -- the stats package I was generating test data with didn't have them.

== SYNOPSIS:

  require 'ministat'

  data = [1,2,3,4,5,6,7,7,6,5,4,4]
  puts MiniStat::Data.new(data).to_s

== REQUIREMENTS:

  None

== INSTALL:

  sudo gem install ministat

== LICENSE:

(The MIT License)

Copyright (c) 2007-2010 Dean Hudson

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
0T@[ 