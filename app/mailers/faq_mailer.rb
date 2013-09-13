class FaqMailer < ActionMailer::Base
  add_template_helper(ApplicationHelper)
  default to: "yusuke.isakas555@gmail.com",
          sender: "faq@bijonary.com",
          charset: "ISO-2022-JP"
  
  def send_faq(faq_form, request)
    @faq_form = faq_form
    mail :subject => faq_form.subject, :from => faq_form.email, :template_path => 'faq/mailer', :template_name => 'send_faq'
  end
end
