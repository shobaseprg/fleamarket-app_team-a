class Evaluation < ApplicationRecord
  belongs_to :saller, class_name: "User"
  belongs_to :receiver, class_name: "User"
end