class Piece < ActiveRecord::Base
  attr_accessible :size
  belongs_to :user
  belongs_to :receiver, :class_name=>"User", :foreign_key=>"piece_receiver_id"
  belongs_to :tournament
end
