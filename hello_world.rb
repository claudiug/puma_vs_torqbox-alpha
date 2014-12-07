require 'cuba'
require 'rack/protection'
require 'multi_json'

Cuba.use Rack::Session::Cookie, :secret => "qweqW%$&^%HRNTUK*(lrbRGRT_+_wrwetretreyrtdbdg!@#!$@#%#gRH%YU6HRBu*I*hFGFHReTYRYRRU^&I^%%^^&(*trhrgrgrgrSDSD_"
Cuba.use Rack::Protection

Cuba.define do
  on get do
    on "hello" do
      res.write MultiJson.load(File.open('products_berlin.json'))
    end

    on root do
      res.redirect "/hello"
    end
  end
end