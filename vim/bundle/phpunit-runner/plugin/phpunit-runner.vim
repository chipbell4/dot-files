:function AllTests()
	:!phpunit
:endfunction

:function TestCurrentFile()
	" Get the filename, without extension. Split it on the path separator
	:let split_file = split( expand('%:r'), '/' )

	" Get the last element of the array, the path
	:let filename = split_file[-1]

	" If the file contains the word "Test", then it is a test and we can simply
	" run it. Otherwise, we'll have to tell PHPunit to filter and look for the
	" test file
	:if filename =~ "Test"
		:!clear && phpunit %
	:else

		:let testname = filename . 'Test'
		:execute '!clear && phpunit --filter=' . filename . 'Test'
	:endif
:endfunction
