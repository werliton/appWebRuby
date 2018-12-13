class User < ApplicationRecord

	#attr_accessible :full_name, :location, :email, :password, :password_confirmation, :bio

  validates_presence_of :email, :full_name, :location
  validates_length_of :bio, :minimum => 20, :allow_blank => false, :message => 'Informe no mínimo 20 caracteres'
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/, :message => 'Informe um email válido'
  validates_uniqueness_of :email

  has_secure_password
end
