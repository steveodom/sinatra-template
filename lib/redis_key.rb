class RedisKey

	attr_accessor :registry

	def initialize(prefix)
		@prefix = prefix
		@registry = {
			"default" => {
				:name 		=> "example",
				:data_type 	=> "string",
				:desc 		=> "stores example data"
			} 
		}
	end

	def get(name, arg = {})
		if @registry[name]
			str = "#{@prefix}:#{name}"

			if !arg.empty?
				str += ":#{arg}"
			end
			return str
		else
			raise NotFound
		end
	end

	class NotFound < StandardError; end
end