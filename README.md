# Requirements

 - [Ruby](http://rubyinstaller.org/)

# Installation

1. `gem install jekyll`

# Running the site

1. `jekyll serve` in the root directory of this repository
2. You can view your site at `localhost:4000`

# Know-How:
_**Details in the [wiki site](https://github.com/legokor/legokor.hu/wiki) of this repo.**_
## Projects
### Statuses
- change it in the `./_projects/<project_name>.html`
- If more has to be added or want to change them: go to `./projektekt.html`
- If displayed text has to be changed: `./_layouts/project.html`
- Values:
  - `starting`: the project is just starting up, preparations are in progress
  - `active`: the project is running, the members are working on it
  - `inactive`: there is no active work in the project, but if someone is interested it can be revived (know-how is still here)
  - `finished`: the project has completed
  - `archived`: the project was not completed, and neither can be revived because of the loss of the know-how in the field
