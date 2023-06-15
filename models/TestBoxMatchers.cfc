/**
 * Optional matchers for TestBox when faking requests.
 */
component {

	/**
	 * Expects a certain request to have been sent.
	 * The HyperBuilder instance should be passed in to `expect`.
	 * The first argument should be the predicate function to determine if the request matches.
	 * An optional message can be passed as the second argument.
	 */
	function toHaveSentRequest( expectation, args = {} ) {
		var hyper = expectation.actual;
		if ( structCount( args ) >= 2 ) {
			expectation.message = args[ 2 ];
		} else {
			expectation.message = expectation.isNot ? "Expected to not find a request that matched the callback parameters but did." : "Expected to find a request that matched the callback parameters but did not.";
		}
		var sent = hyper.wasRequestSent( args[ 1 ] );
		return expectation.isNot ? !sent : sent;
	}

	/**
	 * Expects a certain number of requests to have been sent.
	 * The HyperBuilder instance should be passed in to `expect`.
	 * The first argument should be the number of requests expected to have been sent.
	 * An optional message can be passed as the second argument.
	 */
	function toHaveSentCount( expectation, args = {} ) {
		var hyper         = expectation.actual;
		var actualCount   = hyper.getFakeRequestCount();
		var expectedCount = args[ 1 ];
		var messagePlural = expectedCount == 1 ? "request" : "requests";
		if ( structCount( args ) >= 2 ) {
			expectation.message = args[ 2 ];
		} else {
			expectation.message = expectation.isNot ? "Expected not to have sent exactly #expectedCount# #messagePlural# but did." : "Expected to have sent exactly #expectedCount# #messagePlural# but sent #actualCount#.";
		}
		return expectation.isNot ? actualCount != expectedCount : actualCount == expectedCount;
	}

	/**
	 * Expects no requests to have been sent.
	 * The HyperBuilder instance should be passed in to `expect`.
	 * An optional message can be passed as the first argument.
	 */
	function toHaveSentNothing( expectation, args = {} ) {
		var hyper       = expectation.actual;
		var actualCount = hyper.getFakeRequestCount();
		if ( structCount( args ) >= 1 ) {
			expectation.message = args[ 1 ];
		} else {
			expectation.message = expectation.isNot ? "Expected to have sent any number of requests but have sent nothing." : "Expected to have sent no requests but have sent #actualCount#.";
		}
		return expectation.isNot ? actualCount != 0 : actualCount == 0;
	}

}
