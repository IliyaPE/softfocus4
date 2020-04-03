http://softfocus.me

Deploy to production (dokku):

    git remote add dokku dokku@dokku.rootbox.fr:softfocus
    git push dokku master

Run tests:

    bin/rspec

Start dev server:

    bin/rails s

Regenerate some images:

```ruby
Image.all.each {|i| i.file.reprocess!(:mini) }
```