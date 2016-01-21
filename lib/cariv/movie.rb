# -*- coding: utf-8 -*-

class Cariv::MovieManager

end

class Cariv::Movie
  attr_reader :client
  attr_reader :target_dir

  def initialize(client, data)
    @client     = client
    @target_dir = client.target_dir
    @data_hash  = data
  end

  def download(format=nil)

  end

  def method_missing(method_sym, *arguments, &block)
    if @data_hash.include? method_sym.to_s
      @data_hash[method_sym.to_s]
    else
      super
    end
  end

  def respond_to?(method_sym, include_private = false)
    if @data_hash.include? method_sym.to_s
      true
    else
      super
    end
  end

  def [](key)
    return @data_hash[key]
  end

  def []=(key, value)
    return @data_hash[key] = value
  end

  def <=>(other)
    if(other.kind_of?(Cariv::Movie))
      return "#{self.date}-#{self.id}" <=> "#{other.date}-#{other.id}"
    else
      return nil
    end
  end

  def to_h
    @data_hash.dup
  end
end
