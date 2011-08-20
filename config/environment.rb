# Load the rails application
require File.expand_path('../application', __FILE__)

# Load all custom extensions to Ruby and Rails classes
require File.join(File.dirname(__FILE__), 'class_extensions')

# Initialize the rails application
Todomodo::Application.initialize!


