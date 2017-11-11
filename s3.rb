
require 'aws-sdk'
require_relative "S3_Helpers"

access_key_id = ENV['AWS_ACCESS_KEY_ID']
secret_key = ENV['AWS_SECRET_ACCESS_KEY']

# Set the name of the bucket on which the operations are performed
# This argument is required
bucket_name = nil
operation = 'list' # default

### this is positional parameter for bucket_name
### after ruby s3.rb ARGV[0]
if ARGV.length > 0
  bucket_name = ARGV[0]
else
  raise "Enter bucket name then action"
end
# The operation to perform on the bucket
### this is positional parameter after ruby s3.rb bucket_name ARGV[1]
operation = ARGV[1] if ARGV.length > 1


case operation

when 'create'
  S3_Helpers.create_s3_bucket(bucket_name)

when 'list'
  S3_Helpers.list_all_buckets

else
  puts "Unknown operation: '%s'!" % operation
end