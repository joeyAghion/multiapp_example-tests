require 'capybara/rspec'
require 'childprocess'

API_PORT = 7000
WEB_PORT = 7001

Capybara.configure do |config|
  config.current_driver = :selenium
  config.run_server = false
  config.app_host = "http://localhost:#{WEB_PORT}"
end

# This file was generated by the `rspec --init` command. Conventionally, all
# specs live under a `spec` directory, which RSpec adds to the `$LOAD_PATH`.
# Require this file using `require "spec_helper"` to ensure that it is only
# loaded once.
#
# See http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.before(:suite) do
    start_api
    start_web
  end

  config.after(:suite) do
    stop_api
    stop_web
  end
end

def start_api
  $stderr.puts "Starting API..."
  Bundler.with_clean_env do
    $api = ChildProcess.build('bundle', 'exec', 'ruby', 'app.rb')
    $api.cwd = './api'
    $api.io.inherit!
    $api.environment['PORT'] = API_PORT
    $api.start
    $stderr.puts "Waiting for API to start listening..."
    sleep(1) while !listening_on?(API_PORT) && $api.alive?
  end
end

def stop_api
  $stderr.puts "Stopping API..."
  $api.stop
end

def start_web
  $stderr.puts "Starting web..."
  $web = ChildProcess.build('node', 'app.js')
  $web.cwd = './web'
  $web.io.inherit!
  $api_base_url = "http://#{api_client['key']}:@localhost:#{API_PORT}"
  $web.environment['API_URL'] = $api_base_url
  $web.environment['PORT'] = WEB_PORT
  $web.start
  $stderr.puts "Waiting for web to start listening..."
  sleep(1) while !listening_on?(WEB_PORT) && $web.alive?
end

def stop_web
  $stderr.puts "Stopping web..."
  $web.stop
end

def listening_on?(port)
  system("netstat -an | grep #{port} | grep LISTEN")
end

def api_client
  $api_client ||= begin
    response = Net::HTTP.post_form(URI("http://localhost:#{API_PORT}/api/clients"), {})
    JSON.parse(response.body)
  end
end

def create_widget(params = {})
  Net::HTTP.post_form(URI("#{$api_base_url}/api/widgets"), params)
end
