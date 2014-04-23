class MessageU
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :subject, :content
 
  validates_presence_of :subject, :content
  validates_length_of :content, :maximum => 500

  def initialize(opts={})
    self.subject = opts[:subject]
    self.content = opts[:content]
  end

  def persisted?
    false
  end
end