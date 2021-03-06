u:Gem::Specification�	["
1.3.6i"syncacheU:Gem::Version["
1.0.0Iu:	TimeĐ�    :@marshal_with_utc_coercionF"7SynCache is a thread-safe time-limited cache with flexible replacement policy and ability to wrap generation of expensive cache entries in synchronized blocks. SynCache was used in the Samizdat open publishing engine since 2005, and now it's released as a stand-alone module ready for use in other applications.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"angdraug@debian.org["Dmitry Borodaenko"David Czarnecki"RSynCache::Cache stores cached objects in a Hash that is protected by an advanced two-level locking mechanism. Two-level locking ensures that:

        * Multiple threads can add and fetch objects in parallel without stepping on each other's toes.
        * While one thread is working on a cache entry, other threads can access the rest of the cache with no waiting on the global lock, no race conditions nor deadlock or livelock situations.
        * While one thread is performing a long and resource-intensive operation, other threads that request the same data with fetch_or_add() method will be put on hold, and as soon as the first thread completes the operation, the result will be returned to all threads. Without this feature, a steady stream of requests with less time between them than it takes to complete one request can easily bury a server under an avalanche of threads all wasting resources on the same expensive operation.

    When number of cache entries exceeds the size limit, the least recently accessed entries are replaced with new data. This replacement strategy is controlled by the SynCache::CacheEntry class and can be changed by overriding its replacement_index() method.

    Cache entries are automatically invalidated when their ttl (time to live) is exceeded. Entries can be explicitly invalidated by flush() method. The method can use === operator to compare cache keys against flush base (so that base can be e.g. a Regexp), and invalidates all entries when invoked without the base parameter.

    The flush_delay initialization option allows to limit cache's flush rate. When this option is set, SynCache will make sure that at least this many seconds (it can also be a fraction) pass between two flushes. When extra flushes are requested, invalidation of flushed entries is postponed until earliest time when next flush is allowed.
    "*http://github.com/czarneckid/syncacheT@[ 