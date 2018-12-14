class User < ApplicationRecord

  scope :most_recent, -> {
    order('created_at DESC')
  }
  scope :from_sampa, -> {
    where(:location =>'São Paulo')
  }

  scope :confirmed, -> {
    where('confirmed_at IS NOT NULL')
  }

  #scope :from, ->(location) { where(:location => location) }
	#attr_accessible :full_name, :location, :email, :password, :password_confirmation, :bio

  before_create :generate_token

  validates_presence_of :email, :full_name, :location
  validates_length_of :bio, :minimum => 20, :allow_blank => false, :message => 'Informe no mínimo 20 caracteres'
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :message => 'Informe um email válido'
  validates_uniqueness_of :email

  has_secure_password

  def generate_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def self.authenticate(email, password)
    confirmed.
    find_by_email(email).
    try(:authenticate, password)
  end

  def confirm!
    return if confirmed?

    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end

  def confirmed?
    confirmed_at.present?
  end
end
