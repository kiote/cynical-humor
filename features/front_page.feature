Feature: Front Page
    In order to see most revelant posts
    As a reader
    I want the 15 most recent posts on the front page

    Scenario: 1 post in blog
        Given I have a post
        And my post has title "My Post"
        And my post has body "This is my post"
        And my post has author with name "kiote"
        And my post was published on "Jan 28, 1011"
        When I go to homepage
        Then I should see "My post"
        And I should see "This is my post"
        And I should see "kiote"
        And I should see "Jan 28, 2011"