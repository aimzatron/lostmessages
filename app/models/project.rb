class Project < ActiveRecord::Base
  has_many :project_messages

  scope :incomplete, -> { where(project_complete: false) }

  KB_KEYS = [" ","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p",
             "q","r","s","t","u","v","w","x","y","z","A","B","C","D","E","F","G",
             "H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X",
             "Y","Z","0","1","2","3","4","5","6","7","8","9","(",")","[","]",'"',
             ".",",","delete"]

  def convert_project_messages
    full_message = []
    project_messages.order(:message_id).each do |pm|
      new_index = pm.key - 1
      return full_message.pop if new_index == 71
      full_message << KB_KEYS[new_index]
    end
    full_message.join
  end
end
