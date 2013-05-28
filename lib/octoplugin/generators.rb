# The scaffold DSL can determine the arity of the proc to find how many params
# are needed...  *might* be able to find what they are called -- but if not, an
# alternative syntax is viable:

generator :project do
  arguments do
    name :required => true
  end
  scaffold do
    name = args.name.gsub(/\s+/, '_').downcase
    dir 'projects' do # To simplify things and ensure path-handling is done
                      # properly by plugins, we may want to mandate that
                      # each `dir` call represents one level of directory.
                      # Then we can do automatically do escaping and such.
      dir name do
        # `page` would be a special-case of `file` that automatically
        # determines default file extension, knows to always use UTF-8
        # encoding, always has a front-matter section (even if it's empty),
        # etc.
        page 'index', :content => 'Default content...'

        # ... whereas `file` could be used for, well, arbitrary files.
        # We may even be able to provide some helpers here to simplify path
        # handling...  I.E. `template` here would find files relative to the
        # plugin's install-root in some well-defined directory for such
        # things.  So in this case it would be reading
        # <plugin_install_root>/<scaffolds>/project/images/logo.png
        file 'logo.png', :content => template('images', 'logo.png')
      end
    end
  end
end
