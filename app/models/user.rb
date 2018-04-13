class User < ApplicationRecord

  #validates_presence_of :email, :full_name, :location, :bio#, :password
  #validates_confirmation_of :password
  #validates_length_of :bio, :minimum => 20, :allow_blank => false, :message => 'Informe no mínimo 20 caracteres'
  #validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  #validates_uniqueness_of :email
end
