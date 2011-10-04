# Load the rails application
require File.expand_path('../application', __FILE__)

# Load all custom extensions to Ruby and Rails classes
require File.join(File.dirname(__FILE__), '../lib/ecoologic/class_extensions')

# Load extension for active admin (view helpers)
require File.join(File.dirname(__FILE__), '../lib/ecoologic/active_admin_extension')


# Initialize the rails application
Todomodo::Application.initialize!


