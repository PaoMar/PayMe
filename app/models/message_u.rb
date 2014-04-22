class Message_u
  include ActiveModel::Validations

  attr_accessor :subject, :content
 
  validates_presence_of :subject, :content
  validates_length_of :content, :maximum => 500
end