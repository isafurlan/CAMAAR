class User < ApplicationRecord
  has_secure_password

  enum role: {
    student: 'student',
    professor: 'professor',
    admin: 'admin'
  }

  has_many :answers
end
