# -*- coding: utf-8 -*-

class Cariv::Client
  attr_reader :cache
  attr_reader :agent
  attr_reader :username
  attr_reader :password

  def initialize(username: username, password: password)
    @username = username || ENV['CARIV_USERNAME']
    @password = password || ENV['CARIV_PASSWORD']
    @agent = Mechanize.new
    @agent.user_agent = 'Mac Safari'
    @cache = Carib::Cache.new
  end
end
