# Release Process

- leave the elm.json package version alone :)
- trigger the `tag and publish [manual]` action and specify the release increment (major, minor, or patch)
  - once the action completes, the elm.json will be updated and the package will be live on package.elm-lang.org
- create a release (with title, notes, thanks, etc) and tie it to the tag that was created by the action / new package version

## Execution

The order of operations for tagging and publishing in the action is this

1. run all checks, i.e. format, docs, tests, etc
1. push change / update to the elm.json
1. push the new tag to the repo
1. publish the new version to elm package registry

## Troubleshooting

- if step 1 of execution fails, after addressing the error, you run the action again
- if step 2 of execution fails, after addressing the error, you run the action again
- if step 3 of execution fails (the elm.json version was incremented), after addressing the error, you should manually tag (github's ux or the cli) and manually publish the package with `elm publish`
- if step 4 of execution fails (the elm.json version was incremented and there's a new corresponding tag), after addressing the error, you should manually publish the package  with `elm publish`
