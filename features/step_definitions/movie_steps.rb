# Add a declarative step here for populating the DB with movies.


Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
   Movie.create(movie)	
  end
 # flunk "Unimplemented"
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

#Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  #flunk "Unimplemented"
#end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

#Given /^(?:|I ) uncheck the following ratings:$/ do |rating|
#  uncheck(rating)
#end

#Given /^(?:|I ) check the following ratings:$/ do |rating|
#  check(rating)
#end


When /^I Press "([^"]*)"$/ do |button|
  click_button(button)
end

Then /^I Should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Then /^I Should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end
 

Given /^I (un)?check the following ratings: (.*)$/ do |un,rating_list|
  rating_list.split( /, / ).each do |rating| un ? uncheck("ratings_"+rating) : check("ratings_"+rating) end
end

#Given /^I check the following ratings: (.*)$/ do |rating_list|
#  rating_list.split( /, / ).each do |rating| check("ratings_"+rating) end
#end

Then /^I should see "([^"]*)" before "([^"]*)"$/ do |movie1, movie2|
 assert page.body.index(movie1) < page.body.index(movie2)
  # express the regexp above with the code you wish you had
end

Then /^I should see all of the movies$/ do
  #pending # express the regexp above with the code you wish you had
  assert page.body.scan(/<tr>/).length == Movie.count+1
end


