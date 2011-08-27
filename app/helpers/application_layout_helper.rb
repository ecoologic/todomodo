# only for helpers that logically belongs to the layout and not to templates
module ApplicationLayoutHelper

  # link to ecoologic in stack exchange
  def link_to_ecoologic
    image = image_tag(Setting.ecoologic_link_image_url,
                      {:alt => Setting.ecoologic_alt, :height => '64px'})
    url = Setting.ecoologic_link_url
    link_opts = {:title => Setting.ecoologic_link_title, :target => '_blank'}
                 # :id => :ecoologic_link
    
    link_to image, url, link_opts
  end

  # show all the flash messages
  # and flush the flash (to be called from js templates as well)
  def flash_messages
    result = raw '' # TODO: sure there is a better way
    flash.collect do |level, message|
      result << content_tag(:div, message, :id => "flash-#{level}")
    end
    flash.discard
    result
  end

  # shows the params and the session hash
  # for development purpose
  def test_show_params

    ses = session.clone
    ses.delete :session_id
    ses.delete :_csrf_token
    ses = 'Session ' + ses.to_s

    par = params.clone
    par.delete :_csrf_token
    par = ' Params ' + params.to_s

    # exchange the two following instruction to have all or just main params
    # content_tag(:div, (session.to_s + "\n" + params.to_s), :class => 'test') unless Rails.env.production?
    test_tag {clear_tag + raw(ses + br_tag + par)}
  end

  # use this partial for development purpose
  def test_show_partial
    return if Rails.env.production?
    test_tag {render '/sandboxes/test'}
  end


end