"First argument is " + $Args[0]
$date = Get-Date -Format "yyyy-MM-dd"
git checkout master
git tag archive/$date-$Args $Args
git branch -D $Args
git branch -d -r origin/$Args
git push --tags
git push origin :$Args

