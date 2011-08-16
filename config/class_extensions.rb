# any class customisation here will be available in all the app

# Date ------------------------------------------------------------------------
class Date
  # Date.today.to_s :short
  DATE_FORMATS[:default] = '%a %d/%m/%Y'
  DATE_FORMATS[:dmY] = '%d/%m/%Y'
  ABBR_DAYNAMES_TO_SYM = [:sun, :mon, :tue, :wed, :thu, :fri, :sat]
  DAYNAMES_TO_SYM = [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
end

# Time ------------------------------------------------------------------------
class Time
  # Time.now.to_s :short_complete
  DATE_FORMATS[:default] = '%H:%M:%S'
  DATE_FORMATS[:HMSdmY] = '%H:%M:S - %d/%m/%Y'
  DATE_FORMATS[:HMS] = '%H:%M:%S'
end

# String
class String

  # e.g.: 'the_Book_is_ON_the_tABLe'.capitalize_each_word '_' => "The Book Is On The Table" 
  def capitalize_each_word(separator = ' ')
    self.split(separator).map(&:capitalize).join(' ')
  end
  
end

# Array -----------------------------------------------------------------------
class Array
  
  # use to sort two items depending on the list order (of symbols)
  # see sort_with
  def compare_a_b(a, b, list)
    list.index(a.to_sym) > list.index(b.to_sym) ? 1 : -1
  rescue
    Rails.logger.warn "Something went wrong ordering ordering #{a} against #{b} in array #{self} with list #{list}"
    -1
  end
  
  # sort the elements according to the given list
  # e.g.: [:c, :b, :a].sort_with [:a, :b, :c] => [:a, :b, :c] 
  def sort_with(list)
    self.sort{|a,b| self.compare_a_b a, b, list} rescue self
  end

end

# Hash ------------------------------------------------------------------------
class Hash
  
  # delete accepting a list
  # TODO: no super delete???
  # def delete(*args)
  #   args.each {|key| super key}
  # end
  
  # e.g.: {:a => 1}.the_key => :a
  def the_key
    Rails.warn "hash.the_key should not be used for hashes with size > 1, hash = #{self}" if size > 1
    self.first.try(:first)
  end
  
  # e.g.: {:a => 1}.the_value => 1
  def the_value
    Rails.warn "hash.the_value should not be used for hashes with size > 1, hash = #{self}" if size > 1
    self.first.try(:second)
  end
  
  # use to sort two items depending on the list order (of symbols)
  # see sort_with
  def compare_a_b(a, b, list)
    list.index(a.first.to_sym) > list.index(b.first.to_sym) ? 1 : -1
  rescue
    Rails.logger.warn "Something went wrong ordering ordering #{a} against #{b} in hash #{self} with list #{list}"
    -1
  end
  
  # sort the elements according to the given list
  # e.g.: [:c, :b, :a].sort_with [:a, :b, :c] => [:a, :b, :c] 
  def sort_with(list)
    self.sort{|a, b| self.compare_a_b a, b, list}
  end
  
  # Converts a ruby-hash to one in Javascript (e.g. for parameters/ajax)
  # e.g.: {:a => 1, :b => 2} => "{ a: 1, b: 2 }"
  def to_js_code
    # convert all elements
    params = []
    self.each do |key, value|
      next unless value
      # NOTE: recursion
      value = value.to_js_code if value.is_a? Hash
      # sanitaze
      value = value.to_s.gsub('javascript:', '')

      params << "#{key}: '#{value}'"
    end
    # js hash container
    "{ #{params.join(', ')} }"
  end
  
  # returned an hash with stringified keys and string numbers converted
  # e.g.: {'a' => {'b' => '1'}} -> {:a => {:b => 1}}
  def normalized
    result = {}
    self.each do |k, v|
      k = k.to_sym if k.is_a? String
      v = v.normalized if v.is_a? Hash
      v = v.to_i if v == '0' || (v.is_a?(String) && v.to_i > 1)
      result[k] = v
    end
    result
  end
  
end

# Object ----------------------------------------------------------------------
class Object
  
  # update attributes with a hash like with method .new
  # returns the updated object
  # e.g.: bra.set_object_attributes(params[:bra])
  # NOTE: I have the fear that set_attributes could give trobles as a name
  # TODO: too strange there is not already... it's the inverse of .attributes
  def set_object_attributes(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
    self
  end

end

# use User.new.method(:active?).source_location

# log with info like: [INF 110721-111933]
class ActiveSupport::BufferedLogger
  def add(severity, message = nil, progname = nil, &block)
    return if @level > severity
    message = (message || block.try(:call) || progname).to_s

    level = {
      0 => "DBG",
      1 => "NFO",
      2 => "WRN",
      3 => "ERR",
      4 => "FTL"
    }[severity] || "U"

    message = "[%s %s] %s" %
                [level,
                 Time.now.strftime("%y%m%d-%H%M%S"),
                 message]

    # go new line if not there already
    message = "#{message}\n" unless message[-1] == ?\n

    buffer << message
    auto_flush
    message
  end    
end


# returns a list of useful method for the Class passed
# Useful in debugger to a meaningful list of methods
# this could go in ~/.irbrc but I like to have it in the prj source
# e.g.: y method_list Hash
def ml(klass)
  (klass.public_methods - Object.new.methods).sort
end

# absolute path string of the app
RAILS_ROOT = Rails.root.to_s

