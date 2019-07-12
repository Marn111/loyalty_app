require 'rails_helper'
require 'rake'
Rake.application.rake_require "tasks/user_tasks"

RSpec.describe UserTasks, type: :task do

  describe 'rake users:free_coffee_reward' do
    let (:free_coffee_reward) { { name: "monthly_points", code: "free_coffee", expired: Time.now.end_of_month } }
    before do
      Rake.application.invoke_task "users:free_coffee_reward"
      Rake::Task.define_task(:environment)
    end

    context 'expect to run successfuly' do
      it 'free coffee for collecting 100 in one month' do
        jhon = create(:user, name: "Jhon", birthday: "01-01-1989")
        order_1 = create(:purchase, user_id: jhon.id, ordered_from: "Singapore", created_at: "10-06-2019")
        order_2 = create(:purchase, user_id: jhon.id, ordered_from: "Thailand", created_at: "10-06-2019")
        task.execute
        expect(jhon.rewards).to include(free_coffee_reward)
      end

      it 'no free coffee' do
        rose = create(:user, name: "Rose", birthday: "01-01-1989")
        order_1 = create(:purchase, user_id: jhon.id, ordered_from: "Singapore", created_at: "10-06-2019", items: [{"product_name"=> "Desk", "qty"=> "1", "amount"=> "50"}], amount: 50)
        task.execute
        expect(jhon.rewards).not_to include(free_coffee_reward)
      end
    end
  end

  describe 'rake users:free_coffee_reward' do
    let (:birthday_coffee_reward) { { name: "birthday_month", code: "birthday_coffee", expired: Time.now.end_of_month } }
    before do
      Rake.application.invoke_task "users:birthday_coffee_reward"
      Rake::Task.define_task(:environment)
    end

    context 'expect to run successfuly' do
      it 'birthday month coffee' do
        alex = create(:user, name: "Alex", birthday: "01-07-1989")
        task.execute
        expect(alex.rewards).to include(birthday_coffee_reward)
      end

      it 'no free coffee' do
        rose = create(:user, name: "Merry", birthday: "01-05-1989")
        task.execute
        expect(rose.rewards).not_to include(birthday_coffee_reward)
      end
    end
  end

end
