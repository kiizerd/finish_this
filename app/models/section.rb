class Section < ApplicationRecord
  after_initialize :defaults

  belongs_to :project
  has_many :tasks, dependent: :destroy
  
  validates :name, presence: true, length: { in: 1..28 }
  validates :status, inclusion: { in: ['standby', 'active', 'complete'] }
  validates :priority, inclusion: { in: ['low', 'normal', 'high'] }

  STATUS_OPTIONS = [
    ['Standby', 'standby'],
    ['Complete', 'complete'],
    ['Active', 'active']
  ]

  PRIORITY_OPTIONS = [
    ['Normal', 'normal'],
    ['High', 'high'],
    ['Low', 'low']
  ]

  def defaults
    self.status   ||= 'standby'
    self.priority ||= 'normal'
  end
  
  def status_badge_color
    case status
    when 'active'   then 'bg-yellow-400'
    when 'standby'  then 'bg-purple-400'
    when 'complete' then 'bg-green-400'
    end
  end

  def priority_badge_color
    # RED for high GREEN for normal BLUE for low
  end

  def percent_complete
    return 0 if tasks.none?
    ((total_complete.to_f / tasks.count) * 100).round
  end

  def total_complete
    tasks.select { |task| task.complete? }.count
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
