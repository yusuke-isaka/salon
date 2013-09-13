#coding: utf-8;
class Form::Faq
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Translation
  
  attr_accessor :last_name, :first_name, :email, :subject, :content, :agree, :flash_version
  
  validates_presence_of :last_name, :first_name, :email, :subject, :content
  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :if => "email.present?"
  validates_length_of :name, :email, :maximum => 300
  validates_length_of :subject, :maximum => 300
  validates_length_of :content, :maximum => 5000
  validates :agree, :acceptance => true
  validates :email, :confirmation => true
  
  def initialize(attributes = {})
    #return unless attributes.present?
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
  def name
    name = last_name + first_name
  end
end