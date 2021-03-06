u:Gem::Specification�["
1.3.5i"mischacksU:Gem::Version["
0.2.1u:	Time���    "8Miscellaneous methods that may or may not be usefulU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"devel@johan.kiviniemi.name["Johan Kiviniemi"�Miscellaneous methods that may or may not be useful.

sh:: Safely pass untrusted parameters to sh scripts. Raise an exception if the
script returns a non-zero value.

fork_and_check:: Run a block in a forked process and raise an exception if the
process returns a non-zero value.

do_and_exit, do_and_exit!:: Run a block. If the block does not run exit!, a
successful exec or equivalent, run exit(1) or exit!(1) ourselves. Useful to
make sure a forked block either runs a successful exec or dies.

Any exceptions from the block are printed to standard error.

overwrite:: Safely replace a file. Writes to a temporary file and then moves it
over the old file.

tempname_for:: Generates an unique temporary path based on a filename. The
generated filename resides in the same directory as the original one.

try_n_times:: Retries a block of code until it succeeds or a maximum number of
attempts (default 10) is exceeded.

Exception#to_formatted_string:: Return a string that looks like how Ruby would
dump an uncaught exception.

IO#best_datasync:: Try fdatasync, falling back to fsync, falling back to flush.

Random#exp:: Return a random integer 0 &#8804; n &lt; 2^argument (using SecureRandom).

Random#float:: Return a random float 0.0 &#8804; n &lt; argument (using SecureRandom).

Random#int:: Return a random integer 0 &#8804; n &lt; argument (using SecureRandom).

Password:: A small wrapper for String#crypt that does secure salt generation
and easy password verification."4http://johan.kiviniemi.name/software/mischacks/T@[ 