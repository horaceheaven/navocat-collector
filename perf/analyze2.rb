require 'rubygems'
require_relative 'jtl_analyze'

paths = {}
descriptor = { 
  hits: "Total Hits",
  successes: "Successful responses",
  failures: "Error responses",
  p50: "50% response time (ms)", 
  p90: "90% response time (ms)", 
  mean: "Mean response time (ms)",
  rate: "Transaction rate (trans/sec)"
}

print "Area"

ARGV.each do |c| 
  analysis = JtlAnalyze::Analysis.new("perf/results/perf_test_#{c}_results.jtl").analyze!

  print ", #{c}"

  analysis.subjects.each do |subject|
	subject.join_result(paths, subject.path)
  end

  analysis.summary.join_result(paths, :SUMMARY)
end

paths.each do |key, values|
	values.each do |name, areas| 
		print "\n#{key} - #{descriptor[name]}, ", areas.join(', ')
	end
end

print "\n"