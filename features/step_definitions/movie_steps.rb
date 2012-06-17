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

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.content  is the entire content of the page as a string.
  flunk "Unimplemented"
end

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
#When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|

#	rating_list.split( /, / ).each do |rating| check(rating)

  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
#end

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
 

Given /^I uncheck the following ratings: (.*)$/ do |rating_list|
  rating_list.split( /, / ).each do |rating| uncheck("ratings_"+rating) end
end

Given /^I check the following ratings: (.*)$/ do |rating_list|
  rating_list.split( /, / ).each do |rating| check("ratings_"+rating) end
end

Then /^I Should see "([^"]*)" before "([^"]*)"$/ do |movie1, movie2|
 # esxpress the regexp above with the code you wish you had
end




#Then I should see all of the movies do
 #page.all("table tr").count.should == 10#Movie.count
#end
