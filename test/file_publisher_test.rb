require 'rack/mock'
require 'gitfilepublisher'
require 'shoulda'

class TestFilePublisherTest < Test::Unit::TestCase
  context 'A gitfilepublisher' do
    setup do
      @app = Rack::GitFilePublisher.new("/Users/martinchabot/dev/gems/gitfilepublisher")
      @mock = Rack::MockRequest.new(@app)
    end
    should "return the proper file content" do
      res = @mock.get("/8fb3228965c923bcb3840dbff2be95bccc067fbf/Gemfile")
      assert_match(/gitfilepublisher.gemspec/, res.body)
      assert_equal( "text/plain", res.content_type)
    end
  end
end

# # 
# begin
#   context 'A gitfilepublisher' do
#     it  " should return file with valid url" do
#       app = Rack::GitFilePublisher.new("/Users/martinchabot/dev/gitgems/gitfilepublisher")
#       res = Rack::MockRequest.new(app).get("/8fb3228965c923bcb3840dbff2be95bccc067fbf/Gemfile")
# #      res.should.be.ok
#       debugger
#       res.body.should.include "gitfilepublisher.gemspec"
#     end
#     
#   end
# rescue LoadError => boom
#   $stderr.puts "WARN: Skipping Rack::Profiler tests (ruby-prof not installed)"
# end
