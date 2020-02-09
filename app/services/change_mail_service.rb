class ChangeMailService
  attr_reader :user

  def initialize half:
    @user =  User.all.sample
  end

  def perform
    ActiveRecord::Base.transaction do
      update_attributes
      user.save!

      SendMailWorker.perform_async user.id, user.name
    end
  end

  private

  def update_attributes
    user.update_times += 1
    user.email = "my_email" + user.update_times.to_s
  end
end
