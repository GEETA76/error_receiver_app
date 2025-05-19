json.extract! error, :id, :error_class, :message, :backtrace, :path, :method, :timestamp, :created_at, :updated_at
json.url error_url(error, format: :json)
