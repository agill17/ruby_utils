require 'aws-sdk'
require_relative "../support/Constants"


module S3_Helpers

	# Set AWS creds
	@credentials = Aws::Credentials.new(Constants.access_key_id, Constants.secret_key)
	
	# Get S3 resource and pass constructor values
	@s3 = Aws::S3::Resource.new(region: Constants.default_region, credentials: @credentials)


	def self.check_bucket_exists(bucket_name)
		if @s3.bucket(bucket_name).exists?
			return true
		else
			return false
		end
	end

	def self.list_all_buckets
		p "--------All S3 Buckets--------"
		@s3.buckets.limit(50).each do |b|
			p b.name
		end
	end

	def self.create_s3_bucket(bucket_name)
		if !check_bucket_exists(bucket_name)
		 	@s3.bucket(bucket_name).create
		 	p "#{bucket_name} bucket has been created!"
		else
			raise "#{bucket_name}: exists"
		end
		list_all_buckets
	end

end
