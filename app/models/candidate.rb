class Candidate < ActiveRecord::Base

  acts_as_taggable_on :skills

  validates :name, :contacts, presence: true

  validates_format_of :name, with: /\A[а-яё]+\s[а-яё]+\s[а-яё]+\z/i
  validates :salary, numericality: { only_integer: true }, unless: lambda { |c| c.salary.blank? }

  validate :mandatory_phone_or_email_for_contacts

  # Контактная информация должна содержать телефон или адрес электронной почты
  def mandatory_phone_or_email_for_contacts
    unless self.contacts =~ /[^@\s]+@([^@\s]+\.)+[^@\s]+/ or self.contacts =~ /\(?\d{1,}\)?[\s\-]?\d{2}[\s\-]?\d{2}[\s\-]?\d{2}/
      errors.add :contacts, I18n.t('activerecord.errors.models.candidate.attributes.contacts.invalid')
    end
  end

end
