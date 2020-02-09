class SendMailWorker
  include Sidekiq::Worker

  def perform user_id, name
    user = User.find(user_id)

    if user.name != name
      File.open(Rails.root.join("log", "send_mail"), 'a') do |f|
        f.write("actual: #{user.name}  |  expect: #{name}\n")
      end
    end
  end
end
