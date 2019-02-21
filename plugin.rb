# $LOAD_PATH.unshift File.expand_path('/Users/kimardenmiller/Dropbox/l_Spiritual/Momentum/discourse', __FILE__)
# require File.expand_path('discourse/app/models/category', __FILE__)
# require '/Users/kimardenmiller/Dropbox/l_Spiritual/Momentum/discourse/app/models'
# require File.expand_path('../../discourse', __FILE__)
# require '/Users/kimardenmiller/Dropbox/l_Spiritual/Momentum/discourse/app/models/category'
# require File.expand_path('../discourse', __FILE__)

module ::WatchMatchingCategory
  def self.watch_category!(common_slug)
    puts common_slug
    watch_category = Category.find_by_slug(common_slug)
    watch_group = Group.find_by_name(common_slug)

    unless watch_category.nil? || watch_group.nil?
      watch_group.users.each do |user|
        puts user.name
        # watched_categories = CategoryUser.lookup(user, :watching).pluck(:category_id)
        # CategoryUser.set_notification_level_for_category(user, CategoryUser.notification_levels[:watching], watch_category.id) unless watched_categories.include?(watch_category.id)
      end
    end

    # second_category = Category.find_by_slug('Agape')
    # second_group = Group.find_by_name('Agape')
    # return if second_category.nil? || second_group.nil?
    #
    # second_group.users.each do |user|
    #   watched_categories = CategoryUser.lookup(user, :watching).pluck(:category_id)
    #   CategoryUser.set_notification_level_for_category(user, CategoryUser.notification_levels[:watching], second_category.id) unless watched_categories.include?(second_category.id)
    # end
  end
end

# after_initialize do
#   module ::WatchMatchingCategory
#     class WatchCategoryJob < ::Jobs::Scheduled
#       every 1.day
#
#       def execute(args)
#         WatchMatchingCategory.watch_category!('Agape')
#       end
#     end
#   end
# end

# WatchMatchingCategory.watch_category!('Agape')
