module MainpageHelper
  def title
    base_title="Live Questions"
    if @title.nil? 
      title = base_title
    else
      title = "#{base_title} | #{@title}"
    end
  end
end
