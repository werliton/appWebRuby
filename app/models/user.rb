class User < ApplicationRecord

	#attr_accessor :full_name, :location, :email, :password, :password_confirmation

  validates_presence_of :email, :full_name, :location, :password
  validates_confirmation_of :password
  validates_length_of :bio, :minimum => 20, :allow_blank => false, :message => 'Informe no mínimo 20 caracteres'
  #validates_format_of :email, :with => /\A[^@]+@[^@\.]+\z/
  validates_uniqueness_of :email
end
