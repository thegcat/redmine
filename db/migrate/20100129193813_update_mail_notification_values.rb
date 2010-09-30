# Patch the data from a boolean change.
class UpdateMailNotificationValues < ActiveRecord::Migration
  def self.up
    User.update_all("mail_notification = 'all'", "mail_notification IN ('1', 't')")
    User.update_all("mail_notification = 'only_my_events'", "mail_notification IN ('0', 'f')")
  end

  def self.down
    # No-op
  end
end
