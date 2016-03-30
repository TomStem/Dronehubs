module CategoriesHelper
  def category_human_names(model)
    # model can be a Job or a User (as pilot)
    model.categories.map(&:name).to_sentence.gsub(', and', ' and')
  end
end