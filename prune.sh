while read -r line
do
  if [[ $line == *"release" ]]; then
    echo "skipping $line"
  else
    echo "will prune $line"
  fi
done < <(git branch --merged)
