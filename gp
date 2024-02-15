GIT_DIR=`git rev-parse --git-dir 2>/dev/null`
if [ -z "$GIT_DIR" ]; then
  echo "gp: could not find git dir"
  return 0
fi
GIT_BRANCH=`cat $GIT_DIR/HEAD | cut -c 17-`
if [ "$GIT_BRANCH" = "" ]; then
  echo "gp: cannot be used without a branch name"
else
  git push --set-upstream origin $GIT_BRANCH
fi
