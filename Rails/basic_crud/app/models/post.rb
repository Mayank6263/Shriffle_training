class Post < ApplicationRecord
  # has_one :profiles
  # has_one :products, through: :profiles
  # has_and_belongs_to_many :users
  # has_many :profiles
  # has_many :posts, through: :profiles
  # has_many :profiles, as: :midiator
  belongs_to :user
  # scope :sabhi, -> {all}

  enum :status, { draft: 0,  posted: 1, archived: 2 }

  # change it to singular
  # validates :p1, presence:{message:"name can't be blank."}
  # =>  Older versions syntax also works fine
  # validates_presence_of :p1, :p2, presence: true
  # validates :p1, uniqueness: true
  #validates :p1 , presence: { strict:true}
  # validates :p1, inclusion: { in: %w[rails no ruby], message: "Please add any rails, no, ruby %{value} "}
  # validates :p1, exclusion: { in: %w[rails no ruby], message: "Please remove these words rails, no, ruby %{value} "}
  
  # =>    Custom Validations
  # validate :contain
  # def contain
  #   unless p1.include?('rails')
  #     errors.add("string must contain 'rails'");
  #   end
  # end



  # Callbacks in rails using Logger.info
  # after_create -> {Rails.logger.info("created post success.")}
  
  # =>  Ways to define callbacks
  #Ist way
  # before_validation :m1
  # private
  # def m1
  #   p "i am callback"
  # end

  #IInd way
  # before_validation do
  #   p "i am callback"
  # end

  # IIIrd Way
  # before_validation -> {p "i am before_validation callback."}

  # =>        CREATE PHASE  
  # byebug
  # before_validation -> {p "i am before_validation callback."}
  # after_validation -> {p "i am after_validation callback."}
  # before_save -> {p ' before_save callback.'}
  # around_save -> {p ' around_save callback.'} #will not let your create callbacks run.

  # =>                      WAYS TO USE AROUND 
  # =>                              I).
  # around_save do |activity, block|
  #   puts 'before save'
  #   block.call
  #   puts 'after save'
  # end

  # =>                            II) WAY USE AROUND .
  # around_save :aroundsavemethod
  # def aroundsavemethod 
  #   puts "action before aournd save"
  #   yield
  #   puts "action after aournd save"
  # end
  # after_initialize -> {p "initialize wala"}
  # before_commit -> {p ' before_commit callback.'}
  # before_create -> {p ' before_create callback.'}
  # # # around_create -> {p ' around_create callback.'}
  # around_create do |activity, block|
  #   puts 'before create'
  #   block.call
  #   puts 'after create'
  # end
  # after_create -> {p ' after_create callback.'}
  # after_save -> {p ' after_save callback.'}
  # after_commit -> {p 'after_commit callback.'}

  # WIll ONLY WORK IN BETWEEN TRANSACTION
  # after_rollback :roll0


  # Usually the after_rollback callback will not run by applying validation.
  # ActiveRecord::Base.transaction do
  #   post = Post.create!(p1:"u", p2:"p")

  #   raise ActiveRecord::Rollback
  # end

  # after_rollback do 
  #   byebug
  #   puts "i am rolling back"
  # end



  #=>         UPDATE PHASE
  # after_initialize -> {p "initialize wala"}
  
  # before_validation -> {p "i am before_validation callback."}
  # after_validation -> {p "i am after_validation callback."}
  # before_save -> {p ' before_save callback.'}
  # around_save do |activity, block|
  #   p "before_save callback" 
  #   block.call
  #   p "after_save."
  # end
  # before_commit -> {p ' before_commit callback.'}
  # before_update -> {p ' before_create callback.'}
  # around_update do |activity, block|
  #   p " around_update  callback"
  #   block.call
  #   p "after around and befor after_update."
  # end
  # after_update -> {p ' after_update callback.'}
  # after_save -> {p ' after_save callback.'}
  # after_commit -> {p 'after_commit callback.'}



  #=>         DELETION PHASE
  # VALIDATIONS, SAVE, CREATE AND UPDATE CALLBACK WILL NOT WORK IN THE DELETION PHASE.
  # before_validation -> {p 'before_vaidation callback'}
  # after_validation -> {p 'after_validation callback'}

  # before_destroy -> {p 'before destroy callback. '}
  # around_destroy do|activity, block|
  #   p 'before_around_destroy callback'
  #   block.call
  #   p 'after_around_destroy callback'
  # end
  # after_destroy -> {p 'after_destroy callback'}
  # after_commit -> {p 'First callback'}
  # after_commit -> {p 'Second callback'}



  # after_initialize do |x|
  #   Rails.logger.info("You have initialize record.")
  # end

  # after_find do |x|
  #   Rails.logger.info("You found the record which you are searching #{x}")
  # end

  # after_touch -> {"After touch command."}
  
end
