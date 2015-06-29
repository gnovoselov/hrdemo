class TagsController < ApplicationController

  autocomplete :tag, :name, :full => true, :class_name => 'ActsAsTaggableOn::Tag'

end