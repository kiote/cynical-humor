Feature: Front Page
    In order to see most revelant posts
    As a reader
    I want the 15 most recent posts on the front page

    Scenario: 1 post in blog
        Given I have a post
        And my post has title "My Post"
        And my post has body "This is my post"
        And my post has author with name "kiote"
        And my post was published on "Jan 28, 2011"
        When I go to the homepage
        Then I should see "My Post"
        And I should see "This is my post"
        And I should see "kiote"
        And I should see "Jan 28, 2011"

   Scenario: Add a new Post
        Given I have a user named "kiote"
        When I go to the post creation page
        And I fill in "post[title]" with "My Post Title"
        And I fill in "post[body]" with "This is my post body"
        And I select "kiote" from "post[author_id]"
        And I fill if "post[published_on]" with "Jan 28, 2011"
        And I press "Save Post"
        Then I should see "My Post Title"
        And I should see "This is my post body"
        And I should see "kiote"
        And I should see "Jan 28, 2011"