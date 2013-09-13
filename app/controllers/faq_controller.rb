#coding: utf-8
class FaqController < ApplicationController
  
  before_filter :disable_field_with_error
  
  def disable_field_with_error
    ActionView::Base.field_error_proc = Proc.new { |html_tag, instance| 
      "#{html_tag}".html_safe 
    }
  end
  
  def index
    @faq_form = Form::Faq.new
  end
  
  def back
    @faq_form = Form::Faq.new(params[:form_faq])
    render :action => 'index'
  end
  
  def confirm
    @faq_form = Form::Faq.new(params[:form_faq])
    unless @faq_form.valid?
      render :action => 'index'
      return
    end
  end
  
  def complete
    @faq_form = Form::Faq.new(params[:form_faq])
    unless @faq_form.valid?
      render :action => 'index'
      return
    end
    mail = FaqMailer.send_faq(@faq_form, request).deliver
  end
  end