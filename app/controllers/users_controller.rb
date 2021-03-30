class UsersController < ApplicationController
  has_many :ratings
  has_many :courses, through: :ratings
end
