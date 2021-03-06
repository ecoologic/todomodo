# helpers logically related to the whole application
# see application_layout_helper for functions that
# makes sense only in the layout (eg: flash_messages)
module ApplicationHelper

  include ApplicationLayoutHelper

  ############################## forms

  # renders the grouped explanation of errors in the submitted form
  def error_explanation(resource)
    render 'error_explanation', :resource => resource
  end


  ############################## links

  # link to back page (it's a js core function) if possible
  def link_to_back
    link_to 'back', :back if request.env['HTTP_REFERER'].present?
  end


  ############################ tags

  # wrap something to render for development purpose
  # for development purpose, not shown in production
  def test_tag
    return if Rails.env.production?
    content_tag(:div, :class => :test) {yield}
  end

  # self explaining
  def clear_tag(tag = :span)
    content_tag tag, nil, :class => :clear
  end

  # a simple <br/>
  def br_tag
    content_tag :br
  end

  # will provide a thumb image (first url) that links to a second one
  # link to thumb if dest_url is nil
  # also assigning alt and title to the link
  def prettyphoto_tag(thumb_url, dest_url, description)
    dest_url ||= thumb_url
    thumb      = image_tag thumb_url.to_s, :alt => description, :title => description
    link_to thumb, dest_url.to_s , :rel => 'prettyPhoto'
  end

  ######################### contents

  # shown in title header and page content
  def title_content(title, other = '')
    content_for(:page_title_content) {title.to_s}
    content_for(:header_title_content) {raw(title.to_s + other.to_s)}
  end

  # actions views can determinate how to populate the footer
  def footer_nav_content(*args)
    # TODO: footer: add back link... not as easy! see railscast
    content_for(:footer_nav_content) {yield}
  end



end
