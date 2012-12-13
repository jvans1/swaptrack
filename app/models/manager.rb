class Manager < ActiveRecord::Base
  # attr_accessible :title, :body
  def pending_recuests
    recuests.map { |r| r.status == 0 }.count
  end

  def debt
    recuests.map { |r| }
  end

  def payments_due
    
  end
end
