u:Gem::Specification:["
1.3.7i"cadenceU:Gem::Version["
0.0.2u:	Time$��    "%Interval/period callback libraryU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"mtodd@highgroove.com["Matt Todd"J    Track counts and compute rate of iteration. Set up callbacks for various
    intervals such as every n increments or every n ticks.
    
    computer = Cadence::Computer.new do |c|
      c.every 5 do
        p [:completed_processing, n]
      end
    end
    
    computer.start do |c|
      1.upto(100) do |n|
        c.next
        # do magic here
      end
    end
    
    Mostly intended for providing intermitent feedback of the progress of tasks
    that will run for lengthy periods of time.
    
    Rudimentary support for time-based callbacks is possible through #ticks.
"$http://github.com/mtodd/cadenceT@[ 