https://www.youtube.com/watch?v=UQvXst5I41I&ab_channel=DanGitschooldude
https://opensource.com/article/20/5/git-submodules-subtrees


If one person works on "elements" and another person works on "car" which depends on "elements" then it makes sense that guy working on "elements" is independently writing his code without caring for more code, and then the other guy is using that module with git submodule
so he chooses specific version (commit) to include in his code

```git submodule add <https....>```
or you can specify the name to use by 
```git submodule add <https....> the_name```

Note: now except from the folder ".git" we also have a file called ".gitmodules" in our repo.

Note: the parent repo doesnt know about the history of the submodule. It only knows the commit (version) of the submodule.

As soon as we navigate in the submodule (within the parent repo) and do changes there, any git commands there are on the repository of the submodule (not the parent git repository)

We can do commits in the submodule and then in the parent repo : ```git add <submodule_name>``` and ```git commit -m "Updated reference to the submodule"```

**If i do "git push" in parent repo it won't push the changes of the submodule, however it will be pointing on this new commit.** 
**Thus if i clone again the parent repo it will be broken as it won't be able to fetch the referenced submodule commit**
**In fact note that when you clone the repo with submodules you get empty submodules. You need to run ```git submodule update --init``` so that it will clone the submodules. This is where you will find the repo is broken.**
**Instead of running these two commands you can use git clone --recursive <repo>***

So you just need to be in the folder of the submodule and push the commit and then any clone of the parent will be fine since the reference is commited.


In the parent repo .. i can navigate to folder of submodule and do ```git checkout -b new_branch``` and make changes in a branch and push them. The parent repo won't be affected since it is referencing the master branch of the submodule. If within parent dir we run ```git add <submodule_name>``` then it will reference the branch we now checked out in the submodule.


Generally, to fetch all changes from upstream in your submodules you can run ```git submodule update``` from parent dir.


