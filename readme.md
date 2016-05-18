# Bash projects
#### Simple solution to save path to all your projects, and switch between them.
## Installation
1. Clone this repository to any folder
2. If you want to write additional functions to your `.bash_profile` run `./install`
3. Run `sudo ln -s $PWD/projects /usr/bin`

## Usage
#### You can find all available commands by `projects -h`

### Creating projects
Let's create project named `Foo` with current directory path

Ways to do this:

1. `projects -c Foo --dir $PWD`
2. `projects -c --name Foo --dir $PWD`

### Switching to projects
You can open project in 2 ways

1. Run additional function `project`, and pass it's name, or id

  ```
  project Foo
  project name Foo
  project id 1
  ```
2. Using terminal interpolation

  ```
  cd $(projects -o --id 1)
  cd $(projects -o --name Foo)
  ```

### Retrieving project paths
You can retrieve project path in 2 ways

1. Run additional function `project_dir`, and pass it's name, or id

  ```
  atom $(project_dir Foo)
  atom $(project_dir name Foo)
  atom $(project_dir id 1)
  ```
2. Using terminal interpolation

  ```
  atom $(projects -o --id 1)
  atom $(projects -o --name Foo)
  ```

### Finding projects
Sometimes you may want to find project id by name, let's find our `Foo` project
```
projects -f Foo
```
### Deleting projects
You can delete project by its id
```
projects -d 1
```
Also you can delete all projects by running
```
projects -d all
```
## Additional functions
#### `project NAME|KEY [VALUE]`
Set terminal directory to project
Available keys - `name, id`

Usage:
```
project Foo
project name Foo
project id 1
```
#### `project_dir NAME|KEY [VALUE]`
Return project path
Available keys - `name, id`

Usage:
```
atom $(project_dir Foo)
atom $(project_dir name Foo)
atom $(project_dir id 1)
```
