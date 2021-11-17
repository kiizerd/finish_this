class Task < ApplicationRecord
  after_initialize :defaults

  belongs_to :section
  
  validates :name, presence: true, length: { in: 1..28 }
  validates :status, inclusion: { in: ['standby', 'active', 'complete'] }
  validates :priority, inclusion: { in: ['low', 'normal', 'high'] }

  STATUS_OPTIONS = [
    ['Standby', 'standby'],
    ['Active', 'active'],
    ['Complete', 'complete']
  ]

  PRIORITY_OPTIONS = [
    ['Low', 'low'],
    ['Normal', 'normal'],
    ['High', 'high']
  ]

  def defaults
    self.status   ||= 'standby'
    self.priority ||= 'normal'
  end
  
  def badge_color
    case status
    when 'active'   then 'bg-yellow-400'
    when 'standby'  then 'bg-purple-400'
    when 'complete' then 'bg-green-400'
    end
  end

  def active?
    status == 'active'
  end

  def standby?
    status == 'standby'
  end

  def complete?
    status == 'complete'
  end
end
