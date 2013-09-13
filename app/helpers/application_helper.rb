module ApplicationHelper
  def custom_error_messages(object, attr)
    if object.errors.get(attr).present?
      return object.errors.get(attr).map{|message| object.errors.full_message(attr, message)} 
    end
    return []
  end
  #改行を<br/>に変換
  def hbr(str)
    str = html_escape(str)
    str.gsub(/\r\n|\r|\n/, "<br/>").html_safe
  end
end
