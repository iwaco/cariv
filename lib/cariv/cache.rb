# -*- coding: utf-8 -*-
require 'yaml'

class Carib::Cache
  attr_reader :cache_file, :client, :recent_cache_file

  def initialize
    dir = File.expand_path(File.dirname(__FILE__))
    @cache_file = File.join(dir, '..', '..', 'movies.yaml')
  end

  def <<(movie)
    @movies << movie
  end

  def movies
    unless defined?(@movies)
      @movies = []
      if File.file?(self.cache_file)
        @movies = YAML.load(open(self.cache_file).read)
      end
    end

    return @movies
  end

  def save!
    open(self.cache_file, 'w') do |io|
      movies = self.movies.sort.reverse
      movies = movies.map {|m| m.to_h }
      io.write(movies.to_yaml)
    end
  end

end
