namespace :users do

  # Level 1
  desc "Free Coffee for collecting 100 points with one month"
  task free_coffee_reward: :environment do
    Rails.logger.info "Running Free Coffee rake task at #{Time.now}"
    users = User.monthly
    users.each do |user|
      Rails.logger.info "User ID: #{user.id}"
      monthly_points = user.monthly_collected_points(Time.now.month)
      Rails.logger.info "monthly_points: #{monthly_points}"
      if monthly_points >= 100
        i = monthly_points/100
        while i >= 0
          user.rewards = JSON.parse(user.rewards) if user.rewards.is_a?(String)
          user.rewards = user.rewards.merge({name: "monthly_points", code: "free_coffee", expired: Time.now.end_of_month})
          i -= 1
        end
        user.save
      end
    end
  end

  # Level 2
  desc "Birthday coffee reward"
  task birthday_coffee_reward: :environment do
    Rails.logger.info "Running rewards updating function at #{Time.now}"
    p "Running birthday coffee rake task at #{Time.now}"
    User.where('EXTRACT(month FROM birthday) = ?', Time.now.month).each do |user|
      Rails.logger.info "User ID: #{user.id}"
      user.rewards = JSON.parse(user.rewards) if user.rewards.is_a?(String)
      user.rewards = user.rewards.merge({name: "birthday_month", code: "birthday_coffee", expired: Time.now.end_of_month})
      user.save
    end
  end

end
