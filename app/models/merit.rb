class Merit < ActiveRecord::Base
  belongs_to :meritor, class_name: "User"
  belongs_to :meritee, class_name: "User"
end
