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

Cleanup old images in production:

```sh
$ dokku run console
```

```ruby
Image.lt(created_at: 2.months.ago).destroy_all
```

Delete old dangling files because of paperclip wrong folder:

```sh
$ find . -mtime +60 -delete
```