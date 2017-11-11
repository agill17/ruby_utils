
require 'aws-sdk'
require_relative "modules/S3_Helpers"


bucket_name = nil
operation = 'list' # default


if ARGV.length > 0
  bucket_name = ARGV[0]
else
  raise "Enter bucket name then action"
end

operation = ARGV[1] if ARGV.length > 1


case operation

when 'create'
  S3_Helpers.create_s3_bucket(bucket_name)

when 'list'
  S3_Helpers.list_all_buckets

else
  puts "Unknown operation: #{ARGV[1]}"
  puts "Available operations: create, list"
end