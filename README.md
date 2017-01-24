# Bookmark-manager

User Stories

```
As a user
So that I can access my list of bookmarks
I want to see a list of bookmarks that have been saved

Acceptance Criteria:
- On the homepage title and tags will be displayed alongside each link.

As a user
So that I can bookmark a link for later
I want to be able to add new links to the list

Acceptance Criteria:
- On the homepage links will be displayed in chronological order.

As a user
So that I can categorize my bookmarks
I want to be able to add tags to saved links

As a user
So that I can easily find a bookmark
I want to filter my bookmarks by tag

---------------------

Domain Model

Objects |  Messages
        |  
List    |  .view
        |  .filter_by(tag)
        |  .add_link(link)
Link    |  .add_tag(tag)
Tag     |  .create
```
