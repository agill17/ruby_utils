

module Upload_All
	@chef_repo = "#{ENV['HOME']}/chef-repo"
	@cookbooks = "#{@chef_repo}/cookbooks"

	def self.upload_all_cookbooks
		all_cookbooks = Dir.entries(@cookbooks).select {|x| x != ".." && x != "." && x != /.rb/}
		p "Number of cookbooks to upload #{all_cookbooks.size}"
		
		Dir.chdir("#{@cookbooks}")

		all_cookbooks.each do |each_book|
			system("knife cookbook upload #{each_book}")
		end
	end

	def self.upload_all_roles
		all_roles = Dir.entries("#{@chef_repo}/roles").select { |x| x != ".." and x != "."}
		p "Number of roles to upload: #{all_roles.size}"

		Dir.chdir(@chef_repo)

		all_roles.each do |x|
			system("knife role from file #{x}")
		end
	end

	def self.upload_all_envs
		all_envs = File.readlines("all_envs.txt").map {|x| x.chomp("\n")}

		if (Dir.exists?("#{@chef_repo}/environments"))
			all_envs.each do |x|
				system("knife environment from file #{x}")
			end
		else
			fail "environments dir does not exists in chef-repo."
		end
	end

end	

Upload_All.upload_all_cookbooks
Upload_All.upload_all_roles
Upload_All.upload_all_envs
