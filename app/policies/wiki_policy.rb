class WikiPolicy < ApplicationPolicy

def edit?
  user.present?
end

end