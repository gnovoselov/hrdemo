class Employee < ActiveRecord::Base

  validates_format_of :name, with: /\A[а-яё]+\s[а-яё]+\s[а-яё]+\z/i
  validates_presence_of :name
  validates :salary, numericality: { only_integer: true }

  validate :event_shipping_method_uniqueness

  def event_shipping_method_uniqueness
    unless self.contacts =~ /[^@\s]+@([^@\s]+\.)+[^@\s]+/ or self.contacts =~ /\(?\d{1,}\)?[\s\-]?\d{2}[\s\-]?\d{2}[\s\-]?\d{2}/
      errors.add :event, 'Контактная информация должна содержать номер телефона или адрес эл-почты'
    end
  end

end
