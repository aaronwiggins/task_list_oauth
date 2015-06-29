#To-Do List

A to-do list app with drag-and-drop functionality.  AJAX enables the following functions to occur without refreshing the webpage:

* Create new task
* Mark task complete
* Re-order tasks with 'Dragon-Drop'

###Additional Info
* Uses [ranked-model](https://github.com/mixonic/ranked-model) gem for drag-and-drop ordering
* Styled with [Bootstrap](getbootstrap.com/getting-started/) version 3.3.5 to make this app look "nice"
* [ERD Diagram](https://www.lucidchart.com/invitations/accept/271df267-e182-4be3-b57c-872143160e55)
* View this app on [Heroku](http://thawing-river-5798.herokuapp.com/)

###To Run in Terminal...
* Click [here](https://github.com/aaron-joe/task_list.git) to clone the repository to your computer
* Once in the projects root directory, in the terminal type:
    * `bundle install`
    * `bin/rake db:migrate`
    * `bin/rake db:seed`
        * can run `bin/rake db:setup` in-place of the previous 2
    * `bin/rails server`
    * Open your browser and navigate to `localhost:3000`
