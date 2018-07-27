# Level-To-Do-List

#Description
This is a List App. Yeah another one.

There is a user authentication system that allows you to signup/login to create and view your lists.

You can create items and delete them from any particular list. When you "complete" an item by deleting it from any list, it will increase your user level by 1, which you can track in the upper right hand corner.

#Installation Guide

Fork and clone the repo and run in the console

    $ bundle install

Once all the dependencies are setup, if necessary run this in the console to make sure the database is setup correctly,

    $ rake db:migrate

Finally run this to start the server

    $rails s

#Contributers Guide

##Contributing
When contributing to this repository, please first discuss the change you wish to make via issue, email, or any other method with the owners of this repository before making a change.

Please note we have a code of conduct, please follow it in all your interactions with the project.

##Pull Request Process

Create a pull request to propose and collaborate on changes to a repository. These changes are proposed in a branch, which ensures that the master branch only contains finished and approved work.

Pull requests can only be opened if there are differences between your branch and the upstream branch. You can specify which branch you'd like to merge your changes into when you create your pull request.

If you don't have write access to the repository where you'd like to create a pull request, you must create a fork, or copy, of the repository first.

## Issues
If there are new features, bugs, you notice, please let me know by raising an issue on the associated branch, or by recommending a fix through a pull request.

We are using an MIT license. Do whatever you want. Go wild.
