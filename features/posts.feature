Feature: Post managment & Display
    In order to provide quality content
    As an author
    I need to be able to manage posts

    Scenario: Show Post
        Given I have a post
        And my post has title "My Post"
        And my post has body "This is my post"
        And my post has author with name "kiote"
        And my post was published on "Jan 28, 2011"
        When I display the post
        Then show me the page
        Then I should see "My Post"
        And I should see "This is my post"
        And I should see "kiote"
        And I should see "Jan 28, 2011"