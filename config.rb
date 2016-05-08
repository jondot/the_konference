require 'time'
require 'redcarpet'
require 'stringex'


# Custom Config
DATA_EXT = ".yml" # Should be JSON if easier
API_PREFIX = "/api/v1"
GOOGLE_ANALYTICS = "UA-0000000-1"


#Dir["data/*"].each do |path|
    #name = File.basename path, DATA_EXT
    #proxy "#{API_PREFIX}/#{name}.json", "api.json",
      #:locals => { :collection => name }
#end

require 'date'
helpers do
  PIXELS_IN_MINUTE=4

  def markdown(data)
    Tilt['md'].new { data }.render(scope=self)
  end


  def duration_to_pixels(start, finish)
    minutes = (Time.parse(finish) - Time.parse(start))/60
    PIXELS_IN_MINUTE * minutes
  end

  def panel_offset(time, day_start="08:00")
    duration_to_pixels(day_start, time.start)
  end

  def panel_span(time)
    duration_to_pixels(time.start, time.end)
  end

#  def api(page)
#    "#{API_PREFIX}/#{page}.json"
#  end
end

activate :autoprefixer, browsers: [
  "last 2 versions"
]

activate :external_pipeline,
         name: :webpack,
         command: build? ? "npm run build" : "npm start",
         source: ".tmp/dist",
         latency: 1
# Middleman Plugins
#
activate :livereload

configure :build do

  # "Ignore" JS and CSS so webpack has full control.

  # Minify Javascript on build
  activate :minify_javascript

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  config[:relative_links] = true
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
end
