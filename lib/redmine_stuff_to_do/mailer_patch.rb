module RedmineStuffToDo
  module MailerPatch
    def self.included(base) # :nodoc:
      base.extend(ClassMethods)

      base.send(:include, InstanceMethods)
      # Same as typing in the class
      base.class_eval do

      end
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def recommended_below_threshold(user, stuff_to_dos, comment = '')
      @stuff_to_dos = stuff_to_dos
      @user = user
      @comment = comment
      mail :to => @user.mail,
           :subject => "What's Recommended is below the threshold"
    end
  end

end