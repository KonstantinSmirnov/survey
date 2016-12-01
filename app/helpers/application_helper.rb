module ApplicationHelper
  
  def full_title(page_title)
    base_title = "Surveys"
    page_title.empty? ?  base_title : "#{base_title} | #{page_title}"
  end
  
  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end
 
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def controller?(*controller)
    controller.include?(params[:controller])
  end

  def action?(*action)
    action.include?(params[:action])
  end

  def namespace?(*namespace)
    namespace.include?(params[:controller].split('/').first)
  end
end
