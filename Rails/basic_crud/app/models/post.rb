class Post < ApplicationRecord
	after_create -> {"created post success."}
	# change it to singular
end
