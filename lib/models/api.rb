require 'rest-client'
require 'json'
require 'pry'

API_BASEURL = "http://www.recipepuppy.com/api/"

def get_specific_recipe_from_api(user_input)
    url = "http://www.recipepuppy.com/api/?i=#{user_input}"
    response_string = RestClient.get(url)
    response_hash = JSON.parse(response_string)
    results_hash = response_hash["results"]
    recipe = []
    results_hash.each do |results|
        if results["ingredients"] == user_input 
            recipe << results["title"]
        end
    end
    recipe
end


# binding.pry
# 0


# def get_info_from_api
#     #make the web request
#     all_info = RestClient.get(API_BASEURL)
#     info_hash = JSON.parse(all_info)
# end

# def show_recipes_with_ingredient(ingredient)
#     result_hash = get_info_from_api["results"]
#     recipe = []
#     result_hash.each do |result|
#         if result["ingredients"] == ingredient
#             recipe = result["title"]
#             binding.pry
#         end 
#     end 
#     recipe.map do |rec| 
#         rec 
#     end 
# end 
# binding.pry

# puts show_recipes_with_ingredient("sugar")