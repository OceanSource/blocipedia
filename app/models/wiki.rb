# == Schema Information
#
# Table name: wikis
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  private    :boolean
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Wiki < ActiveRecord::Base
  belongs_to :user

  #after_initialize :make_public
  ## Method causes problems when making wikis private

  default_scope { order('title ASC') }


  def private?
   self.private == true
  end

  private

  def make_public
    self.private = false
  end

end
