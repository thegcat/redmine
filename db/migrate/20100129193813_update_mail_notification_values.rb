# Patch the data from a boolean change.
class UpdateMailNotificationValues < ActiveRecord::Migration
  def self.up
    User.record_timestamps = false
    User.all.each do |u|
      u.mail_notification = (u.mail_notification =~ /\A(1|t)\z/ ? 'all' : (u.notified_projects_ids.empty? ? 'only_my_events' : 'selected'))
      u.save!
    end
    User.record_timestamps = true
  end

  def self.down
    # No-op
  end
end
