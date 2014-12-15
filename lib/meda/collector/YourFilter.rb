
class YourFilter 
	
	def filter_hit(hit,dataset) 
	   puts "-----\nfilter logic\n------"
	   hit.tracking_id = 1
	   hit
	end

end
