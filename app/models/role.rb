class Role < ApplicationRecord
  has_many :users

  def self.creating_options
    [['no', 0], ['yes', 1]]
  end

  def self.updating_options
    [['no', 0], ['own', 1]]
  end

  def self.deleting_options
    [['no', 0], ['own', 1], ['all', 2]]
  end

  def self.commenting_options
    [['no create, no delete, no update', 0],
     ['create, delete own, update own', 1],
     ['create, delete on own products, update own', 2],
     ['create, delete all, update own', 3]]
  end

  def self.user_control_options
    [['no', 0], ['yes', 1]]
  end

  def self.buying_options
    [['no', 0], ['yes', 1]]
  end
end
