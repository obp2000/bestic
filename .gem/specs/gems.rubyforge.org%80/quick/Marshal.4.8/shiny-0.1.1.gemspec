u:Gem::Specificationv["
1.3.7i"
shinyU:Gem::Version["
0.1.1u:	Time���    "Wsome common nice and shiny ansi escapse sequences for the daily grind in the shellU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["
1.3.4"	ruby[ "
shiny"tonini.samuel@gmail.com["Samuel Tonini"F  Shiny gives you some common ansi escape sequences, which
  are available over a defined proxy method called 'shell', in
  the core ruby String class.

  Some colors examples:

  puts "magenta".shell.magenta
  puts "bold blue".shell.bold.blue
  puts "yellow on cyan".shell.yellow.on_cyan
  puts "bright blue on green".shell.bright_blue.on_green
  puts "red on bright blue".shell.red.on_bright_blue

  Some other effect examples:

  puts "bold".shell.bold
  puts "oh! i'm blinking".shell.blink
  puts "nice and underlined".shell.underline
  puts "other side, please".shell.negative
"#http://github.com/zastav/shinyT@[ 