require 'bigdecimal'
require 'benchmark'

require File.expand_path('lib/jrjackson')
require File.expand_path('benchmarking/fixtures/bench_options')

filename = File.expand_path(BenchOptions.source)

opts = {use_bigdecimal: true}
dumped_string = File.read(filename)

Benchmark.bmbm(BenchOptions.output_width) do |x|
  x.report("jackson parse string + bigdecimal: #{BenchOptions.iterations}") do
    BenchOptions.iterations.times { JrJackson::Json.load(dumped_string, opts) }
  end
end
