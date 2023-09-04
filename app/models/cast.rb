class Cast < ApplicationRecord
  attr_accessor :role


  belongs_to :user
  belongs_to :video



end
