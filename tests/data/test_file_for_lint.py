import foo

_TEST_RAW_STRING = r'Raw strings should not throw errors. It\'s okay for them to exceed the maximum line length.'


class TestClass(object):

    # This line should throw an error because it is a comment and exceeds the maximum line length.
    def __init__(self):
        """This line should throw an error because it is over 80 characters and within a docstring."""
        self._string_too_long = "This string is too long, it exceeds the character limit."

    def this_function_name_should_not_throw_an_error_because_we_are_only_checking_comments_and_strings(
            self):
        """This line should not throw an error because it contains a URL: https://ketohub.io"""
        an_array = []
        for something in ['another', 'array']:
            # This comment contains a URL, so it can be over the character limit: https://ketohub.io
            an_array.append(something)
        """
        A triple-quote string can be over the limit whether or not it contains a URL.
        """
        """A triple-quote string can be over the limit when it's on three lines or just one."""
        return an_array
