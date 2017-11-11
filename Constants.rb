module Constants

	def self.access_key_id
		return ENV['AWS_ACCESS_KEY_ID']
	end

	def self.secret_key
		return ENV['AWS_SECRET_ACCESS_KEY']
	end

	def self.default_region
		return ENV['AWS_REGION']
	end
end