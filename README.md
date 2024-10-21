# Yocto-Custom-Scripts

This Bash script is designed to enhance the efficiency of developers working within a Yocto Project environment by providing functions that facilitate navigation to a recipe's working directory, accessing development shells, and viewing log files associated with specific recipe tasks. 


The first function, `go_recipe`, allows users to navigate to the working directory of a specified recipe.

The second function, `go_dev`, is designed to open a development shell for the specified recipe.

The third function, `bblog`, allows users to view log files associated with a specific task of a recipe. 

The final function, `bbrun`, is similar to `bblog`, but instead of accessing the log file, it opens the run file associated with a specific task of a recipe. 

