class Link

	def self.ignore_list
		keyword_file = File.join(Dir.pwd, "lib/ignore.yml")
		YAML::load( File.open( keyword_file ) )
	end

	def self.aggregate_across_list(list_owner, list_name)
		ignore = ignore_list
		domains = {}
		puts ignore.inspect
		members = Twitter.list_members(list_owner, list_name)
		members.each do |screen_name, twid|
			Link.new(screen_name, {:ignore => ignore }).from_twitter(domains)
		end
		domains
	end

	def initialize(screen_name, options = {})
		@screen_name = screen_name
		if options[:ignore]
			@ignore = options[:ignore]
		end
	end

	def from_twitter(domains = {})
		puts "screen_name: #{@screen_name}"
		res = Twitter.timeline(@screen_name)
		res.each do |tweet|
			if !tweet['entities']['urls'].empty?
				tweet['entities']['urls'].each do |obj|
					begin
						shared = obj['expanded_url']
						link = Link.base_uri(shared)
						url = URI.parse(link)
						domain = PublicSuffix.parse(url.host).domain
						puts domain
						next if @ignore && @ignore.include?(domain)

						if domains[domain]
							domains[domain] += 1
						else
							domains[domain] = 1
						end
					rescue => e
						puts "LINK problem: #{e.message}"
					end
				end
			end
		end
		puts "__________________________________"
		domains
	end

	def self.base_uri(url)
		begin
			Timeout.timeout(3) do
				open(url,:allow_redirections => :safe) do |res|
					res.base_uri.to_s
				end
			end
		rescue => e
			puts "TIMEOUT for #{url}"
			url
		end
	end
end
