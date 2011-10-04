# any class customisation here will be available in all the app

# ActiveRecord ----------------------------------------------------------------
class ActiveRecord::Base

  # to access view helpers like pluralize
  # e.g.: view_context.pluralize 1, 'cow'
  def view_context
    ActionController::Base.helpers
  end

end

# Date ------------------------------------------------------------------------
class Date
  # e.g.: Date.today.to_s :short
  DATE_FORMATS[:default]    = '%d/%m/%Y'
  DATE_FORMATS[:datepicker] = '%d/%m/%Y'
  DATE_FORMATS[:datetime]   = '%d/%m/%Y - %H:%M:%S'
  DATE_FORMATS[:short]      = '%d/%m/%y'
  DATE_FORMATS[:long]       = '%a, %d %B %Y'

  ABBR_DAYNAMES_TO_SYM = Date::ABBR_DAYNAMES.map(&:downcase).map(&:to_sym)
  DAYNAMES_TO_SYM      = Date::DAYNAMES.map(&:downcase).map(&:to_sym)
end

# Time ------------------------------------------------------------------------
class Time
  # e.g.: Time.now.to_s :short
  DATE_FORMATS[:default]  = '%H:%M:%S'
  DATE_FORMATS[:datetime] = '%d/%m/%Y - %H:%M:%S'
  DATE_FORMATS[:short]    = '%H:%M'
  DATE_FORMATS[:long]     = '%a, %d %B %Y - %H:%M:%S'
end

# Array -----------------------------------------------------------------------
class Array
  # Note: Hash[ [[:a, 1], [:b, 2]] ] => {:a => 1, :b => 2}

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
    self.first.try :first
  end
  
  # e.g.: {:a => 1}.the_value => 1
  def the_value
    Rails.warn "hash.the_value should not be used for hashes with size > 1, hash = #{self}" if size > 1
    self.first.try :second
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

      params << "'#{key}': '#{value}'"
    end
    # js hash container
    "{ #{params.join(', ')} }"
  end
  
  # returned an hash with stringified keys and string numbers converted
  # e.g.: {'a' => {'b' => '1', :c => 'false'}, :d => '0', :e=> '1', :f => '2', :g => 'asdf'}
  #       -> {:a=>{:b=>1, :c=>"false"}, :d=>0, :e=>1, :f=>2, :g=>"asdf"}
  def normalize
    result = {}
    self.each do |k, v|
      k = k.to_sym     if k.is_a? String
      v = v.normalize  if v.try(:normalize).present?
      result[k] = v
    end
    result
  end
  
end

# String ----------------------------------------------------------------------
class String

  # is the string convertible to a number?
  # because ''.to_i => 0
  def int?
    self == '0' || self.to_i > 0
  end

  # convert the string to a (selected) primitive data type
  def normalize
    if self.int?
      self.to_i
    elsif self.bool?
      self.to_bool
    end
  end


  # is the value of the string convertible to boolean?
  # see to_bool
  def bool?
    self.to_bool != nil
  end

  # convert a string to a bool
  # returns nil if not convertible
  def to_bool
    case self
      when 'true'  then true
      when '1'     then true
      when 'false' then false
      when '0'     then false
    end
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
  end

end

# use User.new.method(:active?).source_location

# log with info like: [INF 110721-111933]
class ActiveSupport::BufferedLogger
  def add(severity, message = nil, progname = nil, &block)
    return if @level > severity
    message = (message || block.try(:call) || progname).to_s

    level = {
      0 => "DBG", 1 => "NFO",
      2 => "WRN", 3 => "ERR", 4 => "FTL"
    }[severity] || "U" # for undefined

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

