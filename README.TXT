BRANCH FOR TESTING USE OF ESB URL



Sample scripts to query Canvas.  The user information is factored out
into user_info.rb and automatically included in each script.  Note
that user_info.rb itself must NEVER be checked into git.  To use real
tokens copy the template to user_info_rb and fill it in as appropriate.

The API results are usually returned from Canvas as json and printed
as json in the scripts.  Some scripts format the output before
printing.  Some Canvas APIs may not return json due to bugs.

The API structure is documented at:
https://canvas.instructure.com/doc/api/

Running API calls as a different user is documented at:
https://canvas.instructure.com/doc/api/file.masquerading.html

Running API calls using institution specific SIS data is documented
at:
https://canvas.instructure.com/doc/api/file.object_ids.html

Note that the non-production instances are often refreshed and that
existing tokens will stop working when that is done.

TTD:
- Lots of room to factor out common printing and query specification.
- Convert user_info to yml.
