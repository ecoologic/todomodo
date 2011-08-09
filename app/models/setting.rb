# setting hash loaded from yml, no model involved
class Setting < Settingslogic
  source "#{Rails.root}/config/settings.yml"
  namespace Rails.env
  load!
end
