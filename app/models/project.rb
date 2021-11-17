class Project < ApplicationRecord
  belongs_to :user

  has_many :sections, dependent: :destroy

  validates :name, presence: true, length: { in: 1..28 }
  
  def badge_color
    case status
    when 'active'   then 'bg-yellow-300'
    when 'standby'  then 'bg-purple-400'
    when 'complete' then 'bg-green-400'
    end
  end

  def status
    return 'standby' if sections.none?

    if sections.all? { |section| section.tasks.all? { |task| task.complete? } }
      'complete'
    elsif sections.any? { |section| section.tasks.any? { |task| task.active? || task.complete? } }
      'active'
    else
      'standby'
    end
  end

  def percent_complete
    return 0 if sections.none?
    ((total_complete.to_f / total_tasks) * 100).round
  end

  def total_complete
    sections.select { |section| section.tasks.select { |task| task.complete? }.count }
  end

  def total_tasks
    sections.map(&:tasks).flatten.count
  end
end
