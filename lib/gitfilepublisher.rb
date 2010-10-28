require 'grit'

module Rack
  class GitFilePublisher
    def initialize(git_path)
      @git_path = git_path
      @repo = Grit::Repo.new git_path
    end

    def call(env)
      env['PATH_INFO'] =~ /\/(.*)?\/(.*)?/
      sha, filename = [$1, $2]
      blob = @repo.blob(sha)
      data = blob.data
      content_type = blob.mime_type
      
      if not data.empty?
        [202, { 'Content-Type' => content_type }, data]
      else
        [404, { 'Content-Type' => content_type }, data]
      end
    end
  end
end
