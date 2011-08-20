module ApplicationHelper

  # show all the flash messages
  def flash_messages
    result = raw '' # TODO: sure there is a better way
    flash.collect do |level, message|
      result << content_tag(:div, message, :id => "flash-#{level}")
    end
    result
  end

  # wrap something to render for development purpose
  # for development purpose, not shown in production
  def test_tag
    return if Rails.env.production?
    content_tag(:div, :class => :test) {yield}
  end

  # self explaining
  def clear_tag
    content_tag :span, nil, :class => :clear
  end

  # a simple <br/>
  def br_tag
    content_tag :br
  end

  # shown in title header and page content
  def title_content(title = Setting.app_title)
    content_for(:title_content) {title}
  end

  # include js in the header from a template or partial by calling
  # js_content 'file_name', 'other_file_name'
  def js_content(*args)
    content_for(:js_content) {javascript_include_tag args}
  end

  # include css in the header from a template or partial by calling
  # css_content 'file_name', 'other_file_name'
  def css_content(*args)
    content_for(:css_content) {stylesheet_link_tag args}
  end

  # shows the params and the session hash
  # for development purpose
  def test_show_params

    ses = session.clone
    ses.delete(:session_id)
    ses.delete(:_csrf_token)
    ses = 'Session ' + ses.to_s

    par = params.clone
    par.delete(:_csrf_token)
    par = ' Params ' + params.to_s

    # exchange the two following instruction to have all or just main params
    # content_tag(:div, (session.to_s + "\n" + params.to_s), :class => 'test') unless Rails.env.production?
    test_tag {clear_tag + raw(ses + br_tag + par)}
  end

  # use this partial for development purpose
  def test_show_partial
    return if Rails.env.production?
    test_tag {render '/tests/test'}
  end

end
